//
//  Progress_TrackerApp.swift
//  Progress Watch Extension
//
//  Created by Patrick Knab on 28.01.21.
//

import SwiftUI

@main
struct Progress_TrackerApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
