//
//  EventCell.swift
//  PalnManagement
//
//  Created by doloswala
//

import SwiftUI

struct EventCell: View
{
    @EnvironmentObject var dateHolder: DateHolder
    @ObservedObject var passedEventItem: EventItem
    
    var body: some View
    {
        HStack
        {
            CheckBoxView(passedEventItem: passedEventItem)
                .environmentObject(dateHolder)
            
            Text(passedEventItem.name ?? "")
                .padding(.horizontal)
            
            if !passedEventItem.isCompleted() && passedEventItem.scheduleTime
            {
                Spacer()
                Text(passedEventItem.dueDateTimeOnly())
                    .font(.footnote)
                    .foregroundColor(passedEventItem.overDueColor())
                    .padding(.horizontal)
            }
        }
    }
}

struct EventCell_Previews: PreviewProvider {
    static var previews: some View {
        EventCell(passedEventItem: EventItem())
    }
}
