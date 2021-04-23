//
//  ContentView.swift
//  ProgrammaticNavigation
//
//  Created by Chase McElroy on 4/23/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView(content: {
            List {
                NavigationLink(destination: FirstView(idUsedInSecondView: "asdf")) { Text("Programatic Navigation") }
                NavigationLink(destination: FirstView(idUsedInSecondView: nil)) { Text("Manual Navigation") }
            }
        })
    }
}

struct FirstView: View {
    var idUsedInSecondView: String?
    @State var buttonIsActive: Bool = false
    @State var navigatedToSecondView: Bool = false

    var body: some View {
        ZStack {
            NavigationLink(
                destination: SecondView(commentToNavigateTo: idUsedInSecondView),
                isActive: $buttonIsActive
            ) {
                Text("Hello").foregroundColor(.white)
            }.zIndex(1)
            Color.purple
                .ignoresSafeArea()
        }
        .onAppear {
            if idUsedInSecondView != nil && !navigatedToSecondView {
                buttonIsActive = true
                navigatedToSecondView = true
            }
        }
    }
}

struct SecondView: View {
    var commentToNavigateTo: String?

    var body: some View {
        Color.yellow
            .ignoresSafeArea()
    }
}
