//
//  SearchMyMovieApp.swift

import SwiftUI

@main
// App definition.

struct SearchMyMovieApp: App {
    // Environmental root level View Model for the main view.
    @StateObject var filmListViewModel: FilmListViewModel
    @State private var tabSelection = 1

    // Constructs the app including the root View Model as a 'State' object.
    init() {
        let viewModel = FilmListViewModel()
        _filmListViewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some Scene {
        WindowGroup {
            TabView(selection: $tabSelection)  {
                FilmListView(tabSelection: $tabSelection).environmentObject(filmListViewModel)
                    .tabItem {
                        Label("Search", systemImage: "viewfinder.circle.fill")
                    }.tag(1)


                OldSearchesView(tabSelection: $tabSelection).environmentObject(filmListViewModel)
                    .tabItem {
                        Label("Old Searches", systemImage: "list.dash")
                    }.tag(2)

            }
        }
    }
}
