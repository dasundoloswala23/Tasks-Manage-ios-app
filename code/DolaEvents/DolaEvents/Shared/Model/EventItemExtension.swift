//
//  EventItemExtension.swift
//  PlanManagement
//
//  Created by Doloswala
//

import SwiftUI

extension EventItem
{
    
    func isCompleted() -> Bool
    {
        return completedDate != nil
    }
    
    func isOverdue() -> Bool
    {
        if let due = dueDate
        {
            return !isCompleted() && scheduleTime && due < Date()
        }
        return false
    }
    
    func overDueColor() -> Color
    {
        return isOverdue() ? .red : .black
    }
    
    
    func dueDateTimeOnly() -> String
    {
        if let due = dueDate
        {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd:hh:mm a"
            return dateFormatter.string(from: due)
        }
        
        return ""
    }
}
