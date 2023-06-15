//
//  DetailsView.swift
//  NighWatch
//
//  Created by Jim Lotruglio on 6/15/23.
//

import SwiftUI

struct DetailsView: View {
    let taskName: String
    var body: some View {
        VStack{
            Text(taskName)
            Text("Placeholder for Description")
            Text("Complete Button")
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(taskName: "Test Task")
    }
}
