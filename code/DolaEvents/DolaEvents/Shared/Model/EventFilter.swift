//
//  EventFilter.swift
//  PlanManagement
//
//  Created by Doloswala
//

import SwiftUI

enum EventFilter: String {
    static var allFilters: [EventFilter] {
        return [.NonCompleted, .Completed, .OverDue, .All]
    }

    case All = "all-string"
    case NonCompleted = "nonCompleted-string"
    case Completed = "completed-string"
    case OverDue = "overdue-string"

    var localizedString: String {
        return NSLocalizedString(rawValue, comment: "")
    }
}

