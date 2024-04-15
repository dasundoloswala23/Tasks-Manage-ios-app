//
//  ContentView.swift
//  Shared
//
//  Created by Doloswala
//

/// view all

import SwiftUI
import CoreData

struct EventListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder: DateHolder

    @State var selectedFilter = EventFilter.NonCompleted
    
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                DateScroller()
                    .padding()
                    .environmentObject(dateHolder)
                ZStack
                {
                    List
                    {
                        ForEach(filteredEventItems())
                        { EventItem in
                            NavigationLink(destination: EventEditView(passedEventItem: EventItem, initialDate: EventItem.dueDate!)
                                .environmentObject(dateHolder))
                            {
                                EventCell(passedEventItem: EventItem)
                                    .environmentObject(dateHolder)
                                    .padding(.vertical, 8)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Picker("", selection: $selectedFilter.animation())
                            {
                                ForEach(EventFilter.allFilters, id: \.self)
                                {
                                    filter in
                                    Text(filter.localizedString)
                                }
                            }
                        }
            
                    }
                    
                
                }
            }
            .navigationTitle("eventlisttitle-string")
        }
    }

    private func filteredEventItems() -> [EventItem] {
        switch selectedFilter {
        case .Completed:
            return dateHolder.EventItems.filter { $0.isCompleted() }
        case .NonCompleted:
            return dateHolder.EventItems.filter { !$0.isCompleted() }
        case .OverDue:
            return dateHolder.EventItems.filter { $0.isOverdue() }
        case .All:
            return dateHolder.EventItems
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { filteredEventItems()[$0] }.forEach(viewContext.delete)

            dateHolder.saveContext(viewContext)
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            EventListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                .environment(\.locale,Locale.init(identifier: "en"))
            EventListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                .environment(\.locale,Locale.init(identifier: "ja"))
            EventListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                .environment(\.locale,Locale.init(identifier: "si"))
        }
    }
}
