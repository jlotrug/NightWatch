//
//  Task.swift
//  NighWatch
//
//  Created by Jim Lotruglio on 6/16/23.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    let name: String
    var isComplete: Bool
    var lastCompleted: Date?
}
