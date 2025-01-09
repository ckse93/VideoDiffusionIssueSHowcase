//
//  ImmersiveEnvManager.swift
//  DiffusionIssueShowcase
//
//  Created by Chan Jung on 1/8/25.
//

import Foundation
import SwiftUI
import RealityKit
import Backrooms

@MainActor
@Observable
class ImmersiveEnvManager {
    public private(set) var backrooms: Entity?
    public var showImmersiveSpace: Bool = false
    
    @MainActor
    public func loadAsset() async {
        do {
            if self.backrooms == nil {
                self.backrooms = try await Entity(named: "backroomsVideo", in: backroomsBundle)
            }
        } catch {
            // make sure to give it the right asset name!
            fatalError("error loading asset: \(error)")
        }
    }
    
    @MainActor
    public func presentImmersiveSpace() {
        if self.backrooms == nil {
            return
        } else {
            self.showImmersiveSpace = true
        }
    }
    
    @MainActor
    public func dismissImmersiveSpace() {
        self.showImmersiveSpace = false
    }
}
