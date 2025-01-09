//
//  VIdeoView.swift
//  DiffusionIssueShowcase
//
//  Created by Chan Jung on 1/8/25.
//

import Foundation
import SwiftUI
import AVKit

struct VideoContentView: UIViewControllerRepresentable {
    @Environment(PlayerModel.self) private var model
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = model.makePlayerUI()
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}

struct ImmersiveEnvironmentPickerView: View {
    @Environment(ImmersiveEnvManager.self) var immersiveEnvManager
    
    var body: some View {
        Button {
            Task {
                await immersiveEnvManager.loadAsset()
                immersiveEnvManager.presentImmersiveSpace()
            }
        } label: {
            Label {
                Text("Backroom", comment: "backroom")
            } icon: {
                Image("icon")  // these images should be 180 x 180 pixel smh
            }
        }
    }
}

extension View {
    func immersionManager() -> some View {
        self.modifier(ImmersiveSpacePresentationModifier())
    }
}

private struct ImmersiveSpacePresentationModifier: ViewModifier {
    @Environment(ImmersiveEnvManager.self) var immersiveEnvManager
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    func body(content: Content) -> some View {
        content
            .onChange(of: immersiveEnvManager.showImmersiveSpace) { _, show in
                Task { @MainActor in
                    if show {
                        await openImmersiveSpace(id: "backroom")
                    } else {
                        await dismissImmersiveSpace()
                    }
                }
            }
    }
}
