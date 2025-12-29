
//  Created by Playground Engineer
//  Copyright © 2025 Satyananda Corp
//  Licensed for educational use. See LICENSE file for details.


import UIKit
import SpriteKit

public final class GameViewController: UIViewController {

    private let skView = SKView()
    private var hasPresented = false
    private var hasInitializedScene = false

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black

        skView.frame = view.bounds
        skView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(skView)

        skView.ignoresSiblingOrder = true
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.showsPhysics = false
    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if !hasInitializedScene {
           hasInitializedScene = true
           setScene() // <-- ensures the shared scene exists before first present
        }
        
        if skView.scene !== scene {
            scene.size = skView.bounds.size
            scene.scaleMode = .resizeFill
            skView.presentScene(scene)
        } else {
            scene.size = skView.bounds.size
        }
    }

    public override var prefersStatusBarHidden: Bool { true }
}
