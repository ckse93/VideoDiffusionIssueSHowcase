//
//  DiffusionIssueShowcaseApp.swift
//  DiffusionIssueShowcase
//
//  Created by Chan Jung on 1/8/25.
//

import SwiftUI

enum MainViewState {
    case main
    case video
}

@MainActor
@Observable
final class Navigator {
    var mainViewState: MainViewState = .main
}

@main
struct DiffusionIssueShowcaseApp: App {
    @State private var navigator = Navigator()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(navigator)
        }

        ImmersiveSpace(id: "backroom") {
            ImmersiveView()
                .environment(navigator)
                .onDisappear {
                    navigator.mainViewState = .main
                }
        }
        .immersionStyle(selection: .constant(.full), in: .full)
    }
}
