//
//  SplashScreen.swift
//  PlanManagement (iOS)
//
//  Created by dasun on 2023-04-10.
//

import SwiftUI

struct SplashScreen: Scene {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        
      
        WindowGroup {
            
            let context = persistenceController.container.viewContext
            let dateHolder = DateHolder(context)
            
            if isActive {
                EventListView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .environmentObject(dateHolder)
            }else{
                VStack{
                    VStack{
                        Image(systemName: "hare.fill")
                            .font(.system(size: 80))
                            .foregroundColor(.red)
                        Text("Dola Events")
                            .font(Font.custom("Baskerville-Bold", size:26))
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.2)){
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                            self.isActive = true
                        }
                    }
                }
            }
            
        }
    }


}
