//
//  NighWatchApp.swift
//  NighWatch
//
//  Created by Jim Lotruglio on 5/10/23.
//

import SwiftUI

@main
struct NighWatchApp: App {
    var body: some Scene {
        @StateObject var nightWatchTasks = NighWatchTasks()
        WindowGroup {
            ContentView(nightWatchTasks: nightWatchTasks)
        }
    }
}
