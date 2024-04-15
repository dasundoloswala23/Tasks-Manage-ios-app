# Project Name - Dola Events


#### 01. Brief Description of Project - This app is designed for maintaining an event to-do list that helps users keep track of the events they need to complete. Users can add events to their list and easily edit, delete, mark as completed, or view the list based on different categories such as complete, incomplete, overdue, or all events separately. Some to-dos are private, so this app has a Face ID unlock system to ensure privacy
#### 02. Users of the System - Users can add events, edit them if they want to, delete them once the task is complete, and also mark them as completed.
#### 03. What is unique about your solution - There is a potential privacy issue for users when others can open the to-do app and view their tasks when accessing the phone for other reasons, such as to view photos. To address this, the app includes a Face ID unlock system to prevent unauthorized access. Even if someone knows the passcode, they cannot open the app because it requires the real phone owner's face ID to unlock.And with added localization, users can read this app in their own language.
#### 04. Differences of Assignment 02 compared to Assignment 01 -In Assessment 1, I used Swift and Storyboard for development. However, in Assessment 2, I switched to SwiftUI for development. Additionally, in this project, I have incorporated language supportability.
#### 05. Briefly document the functionality of the screens you have (Include screen shots of images)
1.The splash screen displays the app logo and name as the initial page when the application is opened. After that, it redirects to the Face ID unlock page.

![image](https://github.com/SE4020/assignment-02-dasundoloswala23/assets/86093844/64ba5b7f-3c68-4cb4-940e-8c9d2b87b29a)       ![image](https://github.com/SE4020/assignment-02-dasundoloswala23/assets/86093844/3509e942-abc1-4592-82b9-de9c3281363d)



              
2.This page is the Face ID or touch id unlock page, and when the user opens it, they must use their Face ID or touch id to unlock the page. Without doing so, the user cannot log in to the app.

![image](https://github.com/SE4020/assignment-02-dasundoloswala23/assets/86093844/df9cf016-561a-470a-9358-22690a9a378c) ![image](https://github.com/SE4020/assignment-02-dasundoloswala23/assets/86093844/f581b1d0-bd84-4e3a-bb9f-eef543881070)


              

3.This page displays all the events with their relevant due dates that the user has added, showcasing the tasks they need to complete. Furthermore, this app supports both dark mode and light mode. If the user selects dark mode, the application will switch to a dark color scheme. Additionally, this app offers support for multiple languages including English, Sinhala, and Japanese. To add a new event, the user can click on the "Add" button, which will redirect them to the add event page. 

![image](https://github.com/SE4020/assignment-02-dasundoloswala23/assets/86093844/deebe8b1-e038-4dcc-8edc-d5cebf971dd1) ![image](https://github.com/SE4020/assignment-02-dasundoloswala23/assets/86093844/f926d11b-ee68-482f-a74c-1aa452c68108)  ![image](https://github.com/SE4020/assignment-02-dasundoloswala23/assets/86093844/477ddb6f-2ce5-4c49-802b-c62e273482ae)




4.The Add Event screen allows the user to add new event to their list. To save the event, the app uses Core Data.

![image](https://github.com/SE4020/assignment-02-dasundoloswala23/assets/86093844/2289b17b-e35e-4623-83c6-5bfdf226bd84)  ![image](https://github.com/SE4020/assignment-02-dasundoloswala23/assets/86093844/5eaa1474-10e7-48e4-b37a-fb77ab625a30)




5.If the user wants to edit a event, they can click on the event, and it will display an edit screen. From there, the user can make changes to the to-do and click the save button to save the changes.

![image](https://github.com/SE4020/assignment-02-dasundoloswala23/assets/86093844/c5cfb442-dd9e-41de-98dc-4fe82598cf8d)  ![image](https://github.com/SE4020/assignment-02-dasundoloswala23/assets/86093844/17bc9193-e446-473b-8c23-74f4dcf28929)


 
6.If the user wants to delete it, they can swipe left on the to-do, and a delete button will appear. Clicking on the delete button will delete the event.

![image](https://github.com/SE4020/assignment-02-dasundoloswala23/assets/86093844/eda871db-1ecc-47d0-84cf-3250f39b311e)



7.This app supports English, Sinhala, and Japanese. If the user changes the language setting on their phone, the application's language will automatically adjust to the corresponding language. 

![image](https://github.com/SE4020/assignment-02-dasundoloswala23/assets/86093844/c99c0b04-fc0a-4915-a1a2-4e3eda932304)   ![image](https://github.com/SE4020/assignment-02-dasundoloswala23/assets/86093844/992a6964-f304-4547-b3a9-e79d88aea450)

![image](https://github.com/SE4020/assignment-02-dasundoloswala23/assets/86093844/73db77a8-ad9f-4847-9821-5870ed3b1990)    ![image](https://github.com/SE4020/assignment-02-dasundoloswala23/assets/86093844/6682a7ce-2df2-4f55-909a-bb0c2dda385f)
 
  
 





 
#### 06. Give examples of best practices used when writing code
This app maintains the MVC architecture and separates utility files.

![image](https://github.com/SE4020/assignment-02-dasundoloswala23/assets/86093844/653f67d9-21d3-44a4-8603-5a31c026b15d)



 


For configure strings used separate configure file


![image](https://github.com/SE4020/assignment-02-dasundoloswala23/assets/86093844/215b4703-1900-4ed3-a56c-1e656364d380)


 
```
"eventlisttitle-string" = " Event List";
"event-string" = "Event";

//edit add event

"eventname-string" = " Event Name";
"description-string" = " Description";
"date-string" = " Due Date";
"schedule-string" = "Schedule Time";
"completed-string" = "Completed";
"save-string" = "Save";
```

```
"eventlisttitle-string" = "ලැයිස්තු";
"event-string" = " ලැයිස්තුව ";

// edit screen 

"eventname-string" = "උසස් නම";
"description-string" = "විස්තරය";
"date-string" = "දිනය";
"schedule-string" = "කාල සටහන";
"completed-string" = "සම්පූර්ණ";
"save-string" = "සුරකින්න";
```

#### 07. UI Components used

•	At the splash screen used imageView
•	The View All Todo page uses UIViewController, UIButton, UINavigationController, and UISlider to display the to-do list and allows users to delete to-dos by using the swipe gesture
#### 08. Testing carried out

When the user the event is added successfully, the app will print a success message to the console.

```
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
```


For the unit testing I tryout the separate code wihich as XCTest
```
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

```

![image](https://github.com/SE4020/assignment-02-dasundoloswala23/assets/86093844/8c8a51c2-845f-49a2-93f2-5182932f03ce)


 

#### 09. Documentation 

(a) Design Choices To ensure that all users can easily use the app, I have used simple UI components that are easy to understand. Additionally, the UI is responsive and can be used on any size of iPhone and iPad. Furthermore, the app supports both light mode and dark mode to provide a better user experience

(b) Implementation Decisions I used the MVC architecture for the development of this app. This architecture makes it easy for developers to develop and update the application. Additionally, other developers can easily understand the code, making it easier for them to work on the app in the future.

(c) Challenges During development, I faced some challenging issues, particularly in the project info section. I searched for solutions on Stack Overflow and watched YouTube tutorials, but I found that many of the solutions were outdated because they were using old versions of Xcode and Swift.

#### 10. Additional iOS Library used

I used the localization library to facilitate the translation of the app into different languages.

![image](https://github.com/SE4020/assignment-02-dasundoloswala23/assets/86093844/d068e5ae-f545-4a74-9c41-a04876eea43b)

 

And I utilized the XCTest.framework library for conducting unit testing.

![image](https://github.com/SE4020/assignment-02-dasundoloswala23/assets/86093844/3612e617-3fee-42c7-9e4b-5323252446d4)

 

#### 11. Reflection of using SwiftUI compared to UIKit

Using SwiftUI compared to UIKit brings several advantages and changes to the development process. Here's a reflection on the differences and benefits of using SwiftUI:

Live Preview and SwiftUI Canvas: SwiftUI offers live preview functionality, allowing developers to see real-time changes to the UI while editing the code. The SwiftUI Canvas provides a visual representation of the user interface, making it easier to design and iterate on the app's appearance. This live feedback accelerates the development process and improves productivity.

Swift Integration: SwiftUI is tightly integrated with the Swift programming language. It leverages Swift's features, such as type safety, generics, and optionals, to provide a more robust and expressive UI development experience. This integration allows developers to write concise and readable code, reducing the chance of errors.

Cross-platform Development: SwiftUI enables cross-platform development for iOS, macOS, watchOS, and tvOS. With a shared codebase, developers can create UIs that adapt to different platforms without the need for significant code modifications. This improves code reuse and simplifies the maintenance of multiple versions of the app.

Animation and Gestures: SwiftUI provides built-in support for animations and gestures. Animations can be easily applied to UI elements, allowing for smooth transitions and engaging user experiences. Gesture recognition is also simplified, making it easier to add interactivity and user-driven actions to the app.


#### 12. Reflection General

To complete my assessment, I did not use a Mac instance. Instead, I installed VMware on my personal computer and completed the assessment on that platform. However, when I needed to run the simulator, I used my office's Mac Mini after hours to continue working on the assessment. As a way to manage laptop resources, I used my iPhone as a simulator by connecting it to the VMware machine on my laptop.

  

