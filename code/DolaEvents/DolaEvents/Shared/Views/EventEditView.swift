//
//  EventEditView.swift
//  PalnManagement
//
//  Created by Doloswala
//

import SwiftUI

struct EventEditView: View
{
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder: DateHolder
    
    @State var selectedEventItem: EventItem?
    @State var name: String
    @State var desc: String
    @State var dueDate: Date
    @State var scheduleTime: Bool
    
    init(passedEventItem: EventItem?, initialDate: Date)
    {
        if let EventItem = passedEventItem
        {
            _selectedEventItem = State(initialValue: EventItem)
            _name = State(initialValue: EventItem.name ?? "")
            _desc = State(initialValue: EventItem.desc ?? "")
            _dueDate = State(initialValue: EventItem.dueDate ?? initialDate)
            _scheduleTime = State(initialValue: EventItem.scheduleTime)
        }
        else
        {
            _name = State(initialValue: "")
            _desc = State(initialValue: "")
            _dueDate = State(initialValue: initialDate)
            _scheduleTime = State(initialValue: false)
        }
    }
    
    var body: some View
    {
        Form
        {
            
            Section(header: Text("eventname-string"))
            {
                TextField("eventname-string", text: $name)
                TextField("description-string", text: $desc)
            }
            
            Section(header: Text("date-string"))
            {
                Toggle("schedule-string", isOn: $scheduleTime)
                DatePicker("date-string", selection: $dueDate, displayedComponents: displayComps())
            }
            
            if selectedEventItem?.isCompleted() ?? false
            {
                Section(header: Text("completed-string"))
                {
                    Text(selectedEventItem?.completedDate?.formatted(date: .abbreviated, time: .shortened) ?? "")
                        .foregroundColor(.green)
                }
            }
            
    
    
           
            
     
            
            Section()
            {
                Button("save-string", action: saveAction)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
    
    func    MapView() {
        
    }
    func displayComps() -> DatePickerComponents
    {
        return scheduleTime ? [.hourAndMinute, .date] : [.date]
    }
    
    func saveAction() {
        withAnimation {
            if selectedEventItem == nil {
                selectedEventItem = EventItem(context: viewContext)
            }
            
            selectedEventItem?.created = Date()
            selectedEventItem?.name = name
            selectedEventItem?.dueDate = dueDate
            selectedEventItem?.scheduleTime = scheduleTime
            
            dateHolder.saveContext(viewContext)
            self.presentationMode.wrappedValue.dismiss()
            
            // Print debug information
            print("Data saved:")
            print("Name: \(name)")
            print("Due Date: \(dueDate)")
            print("Schedule Time: \(scheduleTime)")
        }
    }



}

struct EventEditView_Previews: PreviewProvider
{
    static var previews: some View {
        Group{
            EventEditView(passedEventItem: EventItem(), initialDate: Date()).environment(\.locale,Locale.init(identifier: "en"))
            
        }
      
    }
}
