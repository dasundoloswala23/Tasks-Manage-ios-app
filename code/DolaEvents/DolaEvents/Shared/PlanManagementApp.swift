//
//  EventManagementApp.swift
//  Shared
//
//  Created by Doloswala
//

import SwiftUI
import LocalAuthentication

@main
struct PlanManagementApp: App {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    let persistenceController = PersistenceController.shared
    @State private var unlocked = false
    @State private var text = "Locked"

    var body: some Scene {
        WindowGroup {
            if isActive {
                if unlocked {
                    let context = persistenceController.container.viewContext
                    let dateHolder = DateHolder(context)
                    
                    BottomNavigationView {
                        EventListView()
                            .environment(\.managedObjectContext, context)
                            .environmentObject(dateHolder)
                            .tabItem {
                                Label("events-string", systemImage: "calendar")
                            }
                        EventEditView(passedEventItem: nil, initialDate: dateHolder.date)
                            .environment(\.managedObjectContext, context)
                            .environmentObject(dateHolder)
                            .tabItem {
                                Label("add-string", systemImage: "plus")
                            }
                    }
                } else {
                    Text(text)
                        .bold()
                        .padding()
                    Button("authenticate-string"){
                        authenticate()
                    }
                }
            } else {
                VStack{
                    VStack {
                        Image("logo")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaledToFit()

                        Text("appname")
                            .font(Font.custom("Baskerville-Bold", size:26))
                            .scaleEffect(size)
                            .opacity(opacity)
                            .onAppear {
                                withAnimation(.easeIn(duration: 1.2)) {
                                    self.size = 0.9
                                    self.opacity = 1.0
                                }
                            }
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                    self.isActive = true
                                }
                            }
                    }
                }
            }
        }
    }
    
    func  authenticate() {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error){
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "reasons-string"){
                success, authenticationError in
                if success {
                    self.unlocked = true
                    self.text = "unlocked-string"
                } else {
                    self.unlocked = true
                    self.text = "problem-string"
                }
            }
        } else {
            self.text = "biometrics-string"
        }
    }
}

struct BottomNavigationView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        TabView {
            content
      
        }
    }
}
