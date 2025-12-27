
//  Created by Playground Engineer
//  Copyright © 2025 Satyananda Corp
//  Licensed for educational use. See LICENSE file for details.

import Foundation
import SpriteKit

public struct Button {
    
    public init(color: UIColor) {
        self.init()
        self.color = color
    }
    
    public init(cornerRadius: Double) {
        self.init()
        self.cornerRadius = cornerRadius
    }
    
    public init(cornerRadius: Double, color: UIColor) {
        self.init()
        self.cornerRadius = cornerRadius
        self.color = color
    }
    
    public init(width: Double, height: Double, cornerRadius: Double, color: UIColor) {
        self.height = height
        self.width = width
        self.cornerRadius = cornerRadius
        self.color = color
    }
    
    public init(title: String, image: UIImage, height: Double, width: Double, cornerRadius: Double, color: UIColor) {
        self.title = title
        self.image = image
        self.height = height
        self.width = width
        self.cornerRadius = cornerRadius
        self.color = color
    }
    
    public init(title: String, image: UIImage) {
        self.init()
        self.title = title
        self.image = image
    }
    
    public init() {
        self.height = Double(canvas.frame.height / 20)
        self.width = Double(canvas.frame.height / 20)
        self.cornerRadius = Double(canvas.frame.height / 40)
        self.color = .white
    }
    
    var title: String?
    var image: UIImage?
    var width: Double
    var height: Double
    var cornerRadius: Double
    var color: UIColor
}

