
//  Created by Playground Engineer
//  Copyright © 2025 Satyananda Corp
//  Licensed for educational use. See LICENSE file for details.


import SpriteKit

// Internal backing storage so the package can reset the scene,
// while external callers can read it if needed.
var _scene: GameScene = GameScene(size: CGSize(width: 800, height: 600))

/// The shared scene used by the PGEGameKit view/controller.
public var scene: GameScene { _scene }
