//
//  TaskManagementApp.swift
//  TaskManagement
//
//  Created by Назар Горевой on 16/11/2023.
//

import SwiftUI

@main
struct TaskManagementApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
