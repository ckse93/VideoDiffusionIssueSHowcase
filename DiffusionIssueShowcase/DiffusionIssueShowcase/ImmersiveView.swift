//
//  ImmersiveView.swift
//  DiffusionIssueShowcase
//
//  Created by Chan Jung on 1/8/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {

    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let immersiveContentEntity = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(immersiveContentEntity)

            }
        }
    }
}
