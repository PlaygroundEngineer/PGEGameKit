//  Created by Playground Engineer
//  Copyright © 2025 Satyananda Corp
//  Licensed for educational use. See LICENSE file for details.

import SpriteKit
import UIKit

/// Create or reset the shared scene.
/// Call this before adding nodes to `canvas`.
public func setScene() {
    // Create a placeholder scene; actual size will be set by the view controller after layout.
    _scene = GameScene(size: CGSize(width: 800, height: 600))
    scene.scaleMode = .resizeFill
}

/// Draw a simple coordinate grid centered at (0,0).
/// Safe to call multiple times; it replaces the old grid.
public func showGrid() {
    GridRenderer.render(on: canvas, in: scene)
}
