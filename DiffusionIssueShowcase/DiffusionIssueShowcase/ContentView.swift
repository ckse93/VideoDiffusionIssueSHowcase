//
//  ContentView.swift
//  DiffusionIssueShowcase
//
//  Created by Chan Jung on 1/8/25.
//

import AVKit
import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(Navigator.self) var navigator
    @Environment(ImmersiveEnvManager.self) var immersiveEnvManager
    @Environment(PlayerModel.self) private var playerModel
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    
    var body: some View {
        Group {
            switch navigator.mainViewState {
            case .main:
                VStack {
                    Button("Show Video") {
                        Task {
                            await openImmersiveSpace(id: "backroom")
                        }
                    }
                }
            case .video:
                VideoContentView()
                    .immersiveEnvironmentPicker {
                        ImmersiveEnvironmentPickerView()
                            .environment(immersiveEnvManager)
                    }
                    .onAppear {
                        playerModel.player.play()
                    }
            }
        }
        .immersionManager()
    }
}

