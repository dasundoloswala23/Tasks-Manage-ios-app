import XCTest
@testable import PlanManagement

class EventItemExtensionTests: XCTestCase {
    
    func testIsCompleted() {
        let eventItem = EventItem()
        XCTAssertFalse(eventItem.isCompleted())
        
        eventItem.completedDate = Date()
        XCTAssertTrue(eventItem.isCompleted())
    }
    
    func testIsOverdue() {
        let eventItem = EventItem()
        XCTAssertFalse(eventItem.isOverdue())
        
        eventItem.dueDate = Date(timeIntervalSinceNow: -3600) // Set due date to 1 hour ago
        XCTAssertTrue(eventItem.isOverdue())
        
        eventItem.completedDate = Date()
        XCTAssertFalse(eventItem.isOverdue())
        
        eventItem.scheduleTime = false
        XCTAssertFalse(eventItem.isOverdue())
    }
    
    func testOverdueColor() {
        let eventItem = EventItem()
        XCTAssertEqual(eventItem.overDueColor(), .black)
        
        eventItem.dueDate = Date(timeIntervalSinceNow: -3600) // Set due date to 1 hour ago
        XCTAssertEqual(eventItem.overDueColor(), .red)
    }
    
    func testDueDateTimeOnly() {
        let eventItem = EventItem()
        XCTAssertEqual(eventItem.dueDateTimeOnly(), "")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd:hh:mm a"
        let dueDate = dateFormatter.date(from: "14:10:30 AM")!
        
        eventItem.dueDate = dueDate
        XCTAssertEqual(eventItem.dueDateTimeOnly(), "14:10:30 AM")
    }
    
}
