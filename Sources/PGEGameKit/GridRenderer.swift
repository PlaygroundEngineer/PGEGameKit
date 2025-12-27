
//  Created by Playground Engineer
//  Copyright © 2025 Satyananda Corp
//  Licensed for educational use. See LICENSE file for details.


import SpriteKit

enum GridRenderer {
    private static let gridName = "__pge_grid__"

    static func render(on canvas: SKNode, in scene: SKScene) {
        let color = randomColor()

        // Remove existing grid if present
        canvas.childNode(withName: gridName)?.removeFromParent()

        let grid = SKNode()
        grid.name = gridName
        grid.zPosition = -999

        let w = scene.size.width
        let h = scene.size.height

        // Axis lines (centered)
        let xAxis = CGMutablePath()
        xAxis.addLines(between: [CGPoint(x: 0, y: -h/2), CGPoint(x: 0, y: h/2)])
        let x = ShapeNode(path: xAxis)
        x.strokeColor = color
        x.lineWidth = 2
        x.zPosition = 0
        grid.addChild(x)

        let yAxis = CGMutablePath()
        yAxis.addLines(between: [CGPoint(x: -w/2, y: 0), CGPoint(x: w/2, y: 0)])
        let y = ShapeNode(path: yAxis)
        y.strokeColor = color
        y.lineWidth = 2
        y.zPosition = 0
        grid.addChild(y)

        for i in -5...5 {
            if i == 0 { continue }
            let value = i * 100
            let p = CGFloat(value)

            let yPoint = ShapeNode(circleOfRadius: 3.0)
            yPoint.fillColor = color
            yPoint.strokeColor = .clear
            yPoint.zPosition = 0
            yPoint.position = CGPoint(x: 0, y: p)
            grid.addChild(yPoint)

            let xPoint = ShapeNode(circleOfRadius: 3.0)
            xPoint.fillColor = color
            xPoint.strokeColor = .clear
            xPoint.zPosition = 0
            xPoint.position = CGPoint(x: p, y: 0)
            grid.addChild(xPoint)

            let yLabel = SKLabelNode(text: "\(value)")
            yLabel.position = CGPoint(x: 20, y: p)
            yLabel.fontName = "Georgia"
            yLabel.fontSize = 13
            yLabel.fontColor = color
            yLabel.verticalAlignmentMode = .center
            yLabel.zPosition = 0
            grid.addChild(yLabel)

            let xLabel = SKLabelNode(text: "\(value)")
            xLabel.position = CGPoint(x: p, y: -20)
            xLabel.fontName = "Georgia"
            xLabel.fontSize = 13
            xLabel.fontColor = color
            xLabel.horizontalAlignmentMode = .center
            xLabel.verticalAlignmentMode = .center
            xLabel.zPosition = 0
            grid.addChild(xLabel)
        }

        canvas.addChild(grid)
    }
}
