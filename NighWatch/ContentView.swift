//
//  ContentView.swift
//  NighWatch
//
//  Created by Jim Lotruglio on 5/10/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var nightWatchTasks: NighWatchTasks
    @State private var focusModeOn = false
    @State private var resetAlertShowing = false
    var body: some View {
        NavigationView {
            List{
                
                
                Section(header: TaskSectionHeader(symbolSystemName: "moon.stars", headerText: "Nightly Tasks")) {
                    let taskIndices = nightWatchTasks.nightlyTasks.indices
                    let tasks = nightWatchTasks.nightlyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs, id:\.0.id, content: {
                        task, taskIndex in
                        let nightWatchTasksWrapper = $nightWatchTasks
                        let tasksBinding = nightWatchTasksWrapper.nightlyTasks
                        let theTasksBinding = tasksBinding[taskIndex]
                        
                        if !focusModeOn || (focusModeOn && !task.isComplete){
                            NavigationLink(destination: DetailsView(task: theTasksBinding), label: {TaskRow(task: task)})
                        }
                        
                    }).onDelete(perform: { indexSet in
                        nightWatchTasks.nightlyTasks.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        nightWatchTasks.nightlyTasks
                            .move(fromOffsets: indices, toOffset: newOffset)
                    })
                }.listStyle(GroupedListStyle())
                
                
                Section(header: TaskSectionHeader(symbolSystemName: "sunset", headerText: "Weekly Tasks"))
                {
                    let taskIndices = nightWatchTasks.weeklyTasks.indices
                    let tasks = nightWatchTasks.weeklyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                
                    ForEach(taskIndexPairs, id:\.0.id, content: {
                        task, taskIndex in
                        let nightWatchTasksWrapper = $nightWatchTasks
                        let tasksBinding = nightWatchTasksWrapper.weeklyTasks
                        let theTasksBinding = tasksBinding[taskIndex]
                        if !focusModeOn || (focusModeOn && !task.isComplete){
                            NavigationLink(destination: DetailsView(task: theTasksBinding), label: {TaskRow(task: task)})
                        }
                    }).onDelete(perform: { indexSet in
                        nightWatchTasks.nightlyTasks.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        nightWatchTasks.nightlyTasks
                            .move(fromOffsets: indices, toOffset: newOffset)
                    })
                }.listStyle(GroupedListStyle())

                Section(header: TaskSectionHeader(symbolSystemName: "calendar", headerText: "Monthly Tasks")){
                    let taskIndices = nightWatchTasks.monthlyTasks.indices
                    let tasks = nightWatchTasks.monthlyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs, id:\.0.id, content: {
                        task, taskIndex in
                        let nightWatchTasksWrapper = $nightWatchTasks
                        let tasksBinding = nightWatchTasksWrapper.monthlyTasks
                        let theTasksBinding = tasksBinding[taskIndex]
                        if !focusModeOn || (focusModeOn && !task.isComplete){
                            NavigationLink(destination: DetailsView(task: theTasksBinding), label: {TaskRow(task: task)})
                        }

                    }).onDelete(perform: { indexSet in
                        nightWatchTasks.nightlyTasks.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        nightWatchTasks.nightlyTasks
                            .move(fromOffsets: indices, toOffset: newOffset)
                    })
                }.listStyle(GroupedListStyle())
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Reset"){
                        resetAlertShowing = true
                    }
                }
                ToolbarItem(placement: .bottomBar){
                    Toggle(isOn: $focusModeOn, label: {
                        Text("Focus Mode")
                    })
                    .toggleStyle(.switch)
                }
                
            }
        }.alert(isPresented: $resetAlertShowing, content: {
            Alert(title: Text("Reset List"), message: Text("Are you sure?"), primaryButton: .cancel(), secondaryButton: .destructive(Text("Yes reset it"), action: {
                
                let refreshedNightWatchTasks = NighWatchTasks()
                self.nightWatchTasks.nightlyTasks = refreshedNightWatchTasks.nightlyTasks
                self.nightWatchTasks.weeklyTasks = refreshedNightWatchTasks.weeklyTasks
                self.nightWatchTasks.monthlyTasks = refreshedNightWatchTasks.monthlyTasks
            }))
        })
    }
}

struct TaskRow: View {
    let task: Task
    var body: some View {
        VStack {
            if task.isComplete {
                HStack {
                    Image(systemName: "checkmark.square")
                    Text(task.name)
                        .foregroundColor(.gray)
                    .strikethrough()
                }
            } else {
                HStack {
                    Image(systemName: "square")
                    Text(task.name)
                     
                }
            }
        }
    }
}

struct TaskSectionHeader: View {
    let symbolSystemName: String
    let headerText: String
    var body: some View {
        HStack{
            Image(systemName: symbolSystemName)
            Text(headerText)
        }
        .font(.title3)
    }
}



struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let nightWatchTasks = NighWatchTasks()
        ContentView(nightWatchTasks: nightWatchTasks)
    }
}






