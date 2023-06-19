//
//  DetailsView.swift
//  NighWatch
//
//  Created by Jim Lotruglio on 6/15/23.
//

import SwiftUI

struct DetailsView: View {
    @Binding var task: Task
    @Environment(\.verticalSizeClass) var verticalSizeClass
    var body: some View {
        VStack{
            Text(task.name)
            if verticalSizeClass == .regular{
                
                
                Divider()
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                Divider()
            }
            Button("Mark Complete"){
                task.isComplete = true
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(task: Binding<Task>.constant(Task(name: "Test Task", isComplete: false)))
//            .previewInterfaceOrientation(.landscapeLeft)

    }
}
