
//  Created by Playground Engineer
//  Copyright © 2025 Satyananda Corp
//  Licensed for educational use. See LICENSE file for details.


import SpriteKit
import UIKit

// MARK: - Kid-facing globals

/// The main drawing surface kids add nodes to.
/// (0,0) is always the center of the screen.
public private(set) var canvas: ShapeNode = ShapeNode(rectOf: CGSize(width: 10, height: 10))

/// Called every frame.
public var onUpdate: (_ currentTime: TimeInterval) -> Void = { _ in }

/// Physics contact hooks (optional)
public var onContactBegin: (_ contact: SKPhysicsContact) -> Void = { _ in }
public var onContactEnd: (_ contact: SKPhysicsContact) -> Void = { _ in }

/// Called when an action completes (optional helper hook)
public var onActionComplete: () -> Void = { }

// MARK: - Scene

public final class GameScene: SKScene, SKSceneDelegate, SKPhysicsContactDelegate {

    private var hasLoaded = false
    public let cameraNode = SKCameraNode()

    public override init(size: CGSize) {
        super.init(size: size)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        // Center coordinate system: (0,0) in the middle for portrait + landscape.
        anchorPoint = CGPoint(x: 0.5, y: 0.5)

        backgroundColor = .black
        scaleMode = .resizeFill

        physicsWorld.contactDelegate = self
        delegate = self
        
        camera = cameraNode
        addChild(cameraNode)
    }

    /// Creates/refreshes the canvas to match the scene size.
    private func configureCanvasIfNeeded() {
        // Build the canvas only once, but always keep its size aligned.
        if !hasLoaded {
            hasLoaded = true
            canvas.removeFromParent()
            canvas = ShapeNode(rectOf: size)
            canvas.zPosition = -1
            canvas.fillColor = .clear
            canvas.strokeColor = .clear
            addChild(canvas)
        } else {
            // Update existing canvas geometry when the scene resizes.
            canvas.path = CGPath(rect: CGRect(x: -size.width/2, y: -size.height/2, width: size.width, height: size.height), transform: nil)
        }
    }

    public override func didMove(to view: SKView) {
        configureCanvasIfNeeded()
    }

    public override func didChangeSize(_ oldSize: CGSize) {
        super.didChangeSize(oldSize)
        configureCanvasIfNeeded()
    }

    // MARK: - SKSceneDelegate
    public func update(_ currentTime: TimeInterval, for scene: SKScene) {
        onUpdate(currentTime)
    }

    // MARK: - SKPhysicsContactDelegate
    public func didBegin(_ contact: SKPhysicsContact) {
        onContactBegin(contact)
    }

    public func didEnd(_ contact: SKPhysicsContact) {
        onContactEnd(contact)
    }
}
