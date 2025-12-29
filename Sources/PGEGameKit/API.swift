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

/// Kid-friendly verb: start the game.
/// Alias for setScene() + relies on GameViewController to safely present the latest `scene`.
public func start() {
    setScene()
}

/// Draw a simple coordinate grid centered at (0,0).
/// Safe to call multiple times; it replaces the old grid.
public func showGrid() {
    GridRenderer.render(on: canvas, in: scene)
}

/// Remove everything students added to the canvas.
/// Keeps the grid if it exists (so experimentation is painless).
public func clearCanvas(keepGrid: Bool = true) {
    let gridName = GridRenderer.gridNodeName

    // If we want to keep the grid, remove everything else.
    if keepGrid {
        let grid = canvas.childNode(withName: gridName)
        canvas.removeAllChildren()
        if let grid = grid { canvas.addChild(grid) }
        return
    }

    // Otherwise clear everything.
    canvas.removeAllChildren()
}

/// Add a label to the canvas (great for narration + proof).
@discardableResult
public func addLabel(_ text: String, at position: CGPoint = .zero) -> SKLabelNode {
    let label = SKLabelNode(text: text)
    label.position = position
    label.fontName = "Georgia"
    label.fontSize = 18
    label.fontColor = .white
    label.zPosition = 1000
    label.verticalAlignmentMode = .center
    label.horizontalAlignmentMode = .center

    canvas.addChild(label)
    return label
}
