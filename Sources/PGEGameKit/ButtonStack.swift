
//  Created by Playground Engineer
//  Copyright © 2025 Satyananda Corp
//  Licensed for educational use. See LICENSE file for details.


import Foundation
import SpriteKit

public class ButtonStack: SKNode {
    private var count: Int
    public var buttonActions: [()->()]
    public var colors: [UIColor] = [UIColor.white] {
        didSet {
            let count = colors.count
            for i in 0...count - 1 {
                if let stackNode = self.childNode(withName: "backgroundNode") as? ShapeNode,
                   let stackButton = stackNode.childNode(withName: "button\(i)") as? ShapeNode {
                    stackButton.color = colors[i]
                }
            }
        }
    }
    public var images: [UIImage]? {
        didSet {
            if let images = images {
                var i = 0
                for image in images {
                    let node = SpriteNode(image: image,
                                          size: CGSize(width: button.width * 0.6,
                                                       height: button.height * 0.6))
                    if i < buttons.count {
                        buttons[i].addChild(node)
                    }
                    i += 1
                }
            }
        }
    }
    public var color: UIColor {
        didSet {
            let backgroundNode = self.childNode(withName: "backgroundNode") as? ShapeNode
            if let backgroundNode = backgroundNode {
                backgroundNode.color = color
            }
        }
    }
    public var background: ShapeNode {
        return self.childNode(withName: "backgroundNode") as! ShapeNode
    }
    private var button: Button
    public var buttons: [ShapeNode] = []
    public enum Direction {
        case horizontal, vertical
    }
    
    private var direction: Direction
    private var space: Double
    private var cornerRadius: Double
    
    public convenience init(count: Int, direction: Direction) {
        self.init(count: count,
                  direction: direction,
                  space: 15,
                  color: .darkGray,
                  cornerRadius: 15,
                  button: Button())
    }
    
    public convenience init(count: Int, direction: Direction, cornerRadius: Double) {
        self.init(count: count,
                  direction: direction,
                  space: 15,
                  color: .darkGray,
                  cornerRadius: cornerRadius,
                  button: Button())
    }
    
    public convenience init(count: Int, direction: Direction, space: Double) {
        self.init(count: count,
                  direction: direction,
                  space: space,
                  color: .darkGray,
                  cornerRadius: 15,
                  button: Button())
    }
    
    public convenience init(count: Int, direction: Direction, space: Double, color: UIColor) {
        self.init(count: count,
                  direction: direction,
                  space: space,
                  color: color,
                  cornerRadius: 15,
                  button: Button())
    }
    
    public convenience init(count: Int, direction: Direction, space: Double, color: UIColor, cornerRadius: Double) {
        self.init(count: count,
                  direction: direction,
                  space: space,
                  color: color,
                  cornerRadius: cornerRadius,
                  button: Button())
    }
    
    public init(count: Int, direction: Direction, space: Double, color: UIColor, cornerRadius: Double, button: Button) {
        self.count = count
        self.space = space
        self.color = color
        self.direction = direction
        self.button = button
        self.cornerRadius = cornerRadius
        self.buttonActions = Array(repeating: {}, count: count)
        super.init()
        self.addChild(stack())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func stack() -> ShapeNode {
        var height = 0.0
        var width = 0.0
        if direction == .horizontal {
            width = Double(button.width) * Double(count) + space * Double(count)
            height = Double(button.height) + (space)
        } else {
            height = Double(button.height) * Double(count) + space * Double(count)
            width = Double(button.width) + (space)
        }
        
        let stackNode = ShapeNode(rectOf: CGSize(width: width, height: height),
                                    cornerRadius: CGFloat(cornerRadius))
        stackNode.name = "backgroundNode"
        stackNode.color = color
        stackNode.lineWidth = 0
        
        var startAt = 0.0
        if direction == .horizontal {
            startAt =  -Double(stackNode.frame.width) / 2 + Double(button.width / 2) + Double(space / 2)
        } else {
            startAt =  Double(stackNode.frame.height) / 2 - Double(button.height / 2) - Double(space / 2)
        }
        for i in 0 ... count - 1 {
            let buttonNode = ShapeNode(rectOf: CGSize(width: button.width, height: button.height),
                                   cornerRadius: CGFloat(button.cornerRadius))
            buttonNode.name = "button\(i)"
            buttonNode.color = button.color
            buttonNode.lineWidth = 0
            if direction == .horizontal {
                buttonNode.position.x = CGFloat(startAt)
                startAt += Double(buttonNode.frame.width) + Double(space)
            } else {
                buttonNode.position.y = CGFloat(startAt)
                startAt -= Double(buttonNode.frame.height) + Double(space)
            }
            //buttonNode.name = "button \(i)"
            stackNode.addChild(buttonNode)
            buttons.append(buttonNode)
            
            buttonNode.onTouchDown = {
                buttonNode.lineWidth = 5
                buttonNode.strokeColor = self.color
            }
            buttonNode.onTouchUp = {
                buttonNode.lineWidth = 0
                if i < self.buttonActions.count {
                    let action = self.buttonActions[i]
                    action()
                }
                
            }
        }
        return stackNode
    }
}




