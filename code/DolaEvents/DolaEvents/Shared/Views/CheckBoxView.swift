//
//  CheckBoxView.swift
//  PalnManagement
//
//  Created by Doloswala
//

import SwiftUI

struct CheckBoxView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder: DateHolder
    @ObservedObject var passedEventItem: EventItem
    
    var body: some View
    {
        Image(systemName: passedEventItem.isCompleted() ? "checkmark.circle.fill" : "circle")
            .foregroundColor(passedEventItem.isCompleted() ? .green : .secondary)
            .onTapGesture {
                withAnimation
                {
                    if !passedEventItem.isCompleted()
                    {
                        passedEventItem.completedDate = Date()
                        dateHolder.saveContext(viewContext)
                        
                    }
                }
            }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView(passedEventItem: EventItem())
    }
}
