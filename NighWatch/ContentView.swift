//
//  ContentView.swift
//  NighWatch
//
//  Created by Jim Lotruglio on 5/10/23.
//

import SwiftUI

let nightlyTasks = [
    "Check all windows",
    "Check all doors",
    "Check that the safe is locked",
    "Check the mailbox",
    "Inspect security cameras",
    "Clear ice from sidewalks",
    "Document \"strange and unusual\" occurrences"
]

let weeklyTasks = [
    "Check inside all vacant rooms",
    "Walk the perimeter of property"
]

let monthlyTasks = [
    "Test security alarm",
    "Test motion detectors",
    "Test smoke alarms"
]

struct ContentView: View {
    var body: some View {
        NavigationView {
            List{
                
                Section(header: ExtractedView()) {
                    ForEach(nightlyTasks, id: \.self, content: {
                        taskName in
                        NavigationLink(taskName, destination: VStack{
                            Text(taskName)
                            Text("Placeholder for Description")
                            Text("Complete Button")
                        })
                    })
                }.listStyle(GroupedListStyle())
                
                Section(header: HStack{
                    Image(systemName: "sunset")
                    Text("Weekly Tasks")
                }
                .font(.title3)){
                    ForEach(weeklyTasks, id: \.self, content: {
                        taskName in
                        NavigationLink(taskName, destination: Text(taskName))
                    })
                }.listStyle(GroupedListStyle())
                
                Section(header: HStack{
                    Image(systemName: "calendar")
                    Text("Monthly Tasks")
                }
                .font(.title3)){
                    ForEach(monthlyTasks, id: \.self, content: {
                        taskName in
                        NavigationLink(taskName, destination: Text(taskName))
                    })
                }.listStyle(GroupedListStyle())
            }
            .navigationTitle("Home")
        }
//        VStack {
//            HStack {
//
//                VStack(alignment: .leading) {
//                    // MARK: Nightly Tasks
//                    Group {
//                        HStack {
//                            Text(Image(systemName: "moon.stars")).foregroundColor(Color.yellow)
//                                .font(.title3)
//                                .fontWeight(.heavy)
//
//                            Text("Nightly Tasks")
//                                .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
//                                .fontWeight(.bold)
//                                .foregroundColor(Color.yellow)
//                                .underline()
//                        }
//                        Text("- Check all windows")
//                        Text("- Check all doors")
//                        Text("- Check that the safe is locked")
//                        Text("- Check the mailbox")
//                        Text("- Inspect security cameras")
//                        Text("- Clear ice from sidewalks")
//                        Text("- Document \"strange and unusual\" occurrences")
//                    }
//                    // MARK: Weekly Tasks
//                    Group {
//                        Divider()
//                        HStack {
//                            Text(Image(systemName: "sunset")).foregroundColor(Color.yellow)
//                                .font(.title3)
//                                .fontWeight(.heavy)
//
//                            Text("Weekly Tasks")
//                                .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
//                                .fontWeight(.bold)
//                                .foregroundColor(Color.yellow)
//                                .underline()
//                        }
//                        Text("- Check inside all vacant rooms")
//                        Text("- Walk the perimeter of property")
//                    }
//                    // MARK: Monthly Tasks
//                    Group {
//                        Divider()
//                        HStack {
//                            Text(Image(systemName: "calendar")).foregroundColor(Color.yellow)
//                                .font(.title3)
//                                .fontWeight(.heavy)
//
//                            Text("Monthly Tasks")
//                                .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
//                                .fontWeight(.bold)
//                                .foregroundColor(Color.yellow)
//                                .underline()
//                        }
//                        Text("- Test security alarm")
//                        Text("- Test motion detectors")
//                        Text("- Test smoke alarms")
//
//                    }
//                }
//                .padding([.top, .leading])
//                .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
//
//                Spacer()
//            }
//            Spacer()
//        }

    }
}

struct ExtractedView: View {
    var body: some View {
        HStack{
            Image(systemName: "moon.stars")
            Text("Nightly Tasks")
        }
        .font(.title3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


