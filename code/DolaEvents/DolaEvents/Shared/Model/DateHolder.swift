//
//  DateHolder.swift
// PalnManagement
//
//  Created by Doloswala
//

import SwiftUI
import CoreData

class DateHolder: ObservableObject
{
    @Published var date = Date()
    @Published var EventItems: [EventItem] = []
    
    let calendar: Calendar = Calendar.current
    
    func moveDate(_ days: Int,_ context: NSManagedObjectContext)
    {
        date = calendar.date(byAdding: .day, value: days, to: date)!
        refreshEventItems(context)
    }
        
    init(_ context: NSManagedObjectContext)
    {
        refreshEventItems(context)
    }
    
    func refreshEventItems(_ context: NSManagedObjectContext)
    {
        EventItems = fetchEventItems(context)
    }
    
    func fetchEventItems(_ context: NSManagedObjectContext) -> [EventItem]
    {
        do
        {
            return try context.fetch(dailyEventsFetch()) as [EventItem]
        }
        catch let error
        {
            fatalError("Unresolved error \(error)")
        }
    }
    
    func dailyEventsFetch() -> NSFetchRequest<EventItem>
    {
        let request = EventItem.fetchRequest()
        
        request.sortDescriptors = sortEvent()
        request.predicate = predicate()
        return request
    }
    
    private func sortEvent() -> [NSSortDescriptor]
    {
        let completedDateSort = NSSortDescriptor(keyPath: \EventItem.completedDate, ascending: true)
        let timeSort = NSSortDescriptor(keyPath: \EventItem.scheduleTime, ascending: true)
        let dueDateSort = NSSortDescriptor(keyPath: \EventItem.dueDate, ascending: true)
        
        return [completedDateSort, timeSort, dueDateSort]
    }
    
    private func predicate() -> NSPredicate
    {
        let start = calendar.startOfDay(for: date)
        let end = calendar.date(byAdding: .day, value: 1, to: start)
        return NSPredicate(format: "dueDate >= %@ AND dueDate < %@", start as NSDate, end! as NSDate)
    }
    
    func saveContext(_ context: NSManagedObjectContext)
    {
        do {
            try context.save()
            refreshEventItems(context)
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
