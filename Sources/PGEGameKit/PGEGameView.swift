
//  Created by Playground Engineer
//  Copyright © 2025 Satyananda Corp
//  Licensed for educational use. See LICENSE file for details.


import SwiftUI
import UIKit

/// Drop this into your Swift Playgrounds App `WindowGroup` to show the game.
/// Example:
///     WindowGroup { PGEGameView().task { setScene(); showGrid(); ... } }
public struct PGEGameView: View {
    public init() {}
    public var body: some View {
        GameViewControllerRepresentable()
    }
}

private struct GameViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        GameViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
