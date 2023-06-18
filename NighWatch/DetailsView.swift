//
//  DetailsView.swift
//  NighWatch
//
//  Created by Jim Lotruglio on 6/15/23.
//

import SwiftUI

struct DetailsView: View {
    @Binding var task: Task
    var body: some View {
        VStack{
            Text(task.name)
            Text("Placeholder for Description")
            Button("Mark Complete"){
                task.isComplete = true
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(task: Binding<Task>.constant(Task(name: "Test Task", isComplete: false)))
    }
}
