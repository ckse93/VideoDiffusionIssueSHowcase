//
//  PlayerModel.swift
//  DiffusionIssueShowcase
//
//  Created by Chan Jung on 1/8/25.
//

import Foundation
import AVKit
import SwiftUI

@MainActor
@Observable
class PlayerModel {
    var player = AVPlayer()
    
    func makePlayerUI() -> AVPlayerViewController {
        guard let url = Bundle.main.url(forResource: "lightsabersample", withExtension: "mp4") else {
            fatalError("Unable to locate the Demo movie file, make sure you supple it.")
        }
        let avPlayerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: avPlayerItem)
        let controller = AVPlayerViewController()
        controller.player = player
        controller.modalPresentationStyle = .fullScreen
        return controller
    }
}
