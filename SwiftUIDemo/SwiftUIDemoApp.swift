//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Airy on 2021/8/9.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        let mainWindow =  WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        
        #if os(macOS)
        mainWindow
            .commands {
                LandmarkCommands()
            }
        #else
        mainWindow
        #endif
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
        
        #if os(macOS)
        Settings {
            LandmarkSettings()
        }
        #endif
    }
    
}
