//
// MIT License
//
// Copyright (c) 2017 Paul Hudson
// https://www.github.com/twostraws/ShaderKit
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import Foundation
import SpriteKit

extension SKAttributeValue {
    public convenience init(size: CGSize) {
        let size = vector_float2(Float(size.width), Float(size.height))
        self.init(vectorFloat2: size)
    }
}

extension SKShader {
    convenience init(fromFile filename: String, uniforms: [SKUniform]? = nil, attributes: [SKAttribute]? = nil) {
        // Swift Playgrounds App projects can load resources from Swift Package bundles.
        #if SWIFT_PACKAGE
        let bundle = Bundle.module
        #else
        let bundle = Bundle(for: ShapeNode.self)
        #endif

        if let path = bundle.path(forResource: filename, ofType: "fsh"),
           let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
           let source = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
            self.init(source: source as String)
        } else {
            // Safe fallback: empty shader source uses default SpriteKit rendering.
            self.init(source: "")
        }

        if let uniforms = uniforms {
            self.uniforms = uniforms
        }

        if let attributes = attributes {
            self.attributes = attributes
        }
    }
}

extension SKUniform {
    public convenience init(name: String, color: SKColor) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        let colors = vector_float4([Float(r), Float(g), Float(b), Float(a)])

        self.init(name: name, vectorFloat4: colors)
    }

    public convenience init(name: String, size: CGSize) {
        let size = vector_float2(Float(size.width), Float(size.height))
        self.init(name: name, vectorFloat2: size)
    }

    public convenience init(name: String, point: CGPoint) {
        let point = vector_float2(Float(point.x), Float(point.y))
        self.init(name: name, vectorFloat2: point)
    }
}

public struct ShaderHelper {
    
    public static func createCheckerboard() -> SKShader {
        let uniforms: [SKUniform] = [
            SKUniform(name: "u_rows", float: 12),
            SKUniform(name: "u_cols", float: 12),
            SKUniform(name: "u_first_color", color: .white),
            SKUniform(name: "u_second_color", color: .black)
        ]
        
        return SKShader(fromFile: "SHKCheckerboard", uniforms: uniforms)
    }
    
    public static func createCircleWave() -> SKShader {
        let uniforms: [SKUniform] = [
            SKUniform(name: "u_speed", float: 1),
            SKUniform(name: "u_brightness", float: 0.5),
            SKUniform(name: "u_strength", float: 2),
            SKUniform(name: "u_density", float: 100),
            SKUniform(name: "u_center", point: CGPoint(x: 0.68, y: 0.33)),
            SKUniform(name: "u_color", color: SKColor(red: 0, green: 0.5, blue: 0, alpha: 1))
        ]
        
        return SKShader(fromFile: "SHKCircleWave", uniforms: uniforms)
    }
    
    public static func createCircleWaveBlended() -> SKShader {
        let uniforms: [SKUniform] = [
            SKUniform(name: "u_speed", float: 1),
            SKUniform(name: "u_brightness", float: 0.5),
            SKUniform(name: "u_strength", float: 2),
            SKUniform(name: "u_density", float: 100),
            SKUniform(name: "u_center", point: CGPoint(x: 0.68, y: 0.33)),
            SKUniform(name: "u_color", color: SKColor(red: 0, green: 0.5, blue: 0, alpha: 1))
        ]
        
        return SKShader(fromFile: "SHKCircleWaveBlended", uniforms: uniforms)
    }
    
    public static func createCircleWaveRainbow() -> SKShader {
        let uniforms: [SKUniform] = [
            SKUniform(name: "u_speed", float: 1),
            SKUniform(name: "u_brightness", float: 0.5),
            SKUniform(name: "u_strength", float: 2),
            SKUniform(name: "u_density", float: 100),
            SKUniform(name: "u_center", point: CGPoint(x: 0.68, y: 0.33)),
            SKUniform(name: "u_red", float: -1)
        ]
        
        return SKShader(fromFile: "SHKCircleWaveRainbow", uniforms: uniforms)
    }
    
    public static func createCircleWaveRainbowBlended() -> SKShader {
        let uniforms: [SKUniform] = [
            SKUniform(name: "u_speed", float: 1),
            SKUniform(name: "u_brightness", float: 0.5),
            SKUniform(name: "u_strength", float: 2),
            SKUniform(name: "u_density", float: 100),
            SKUniform(name: "u_center", point: CGPoint(x: 0.68, y: 0.33)),
            SKUniform(name: "u_red", float: -1)
        ]
        
        return SKShader(fromFile: "SHKCircleWaveRainbowBlended", uniforms: uniforms)
    }
    
    public static func createColorAlpha() -> SKShader {
        let uniforms: [SKUniform] = [
            SKUniform(name: "u_color", color: .green)
        ]
        
        return SKShader(fromFile: "SHKColorAlpha", uniforms: uniforms)
    }
    
    public static func createColorEmboss() -> SKShader {
        let uniforms: [SKUniform] = [
            SKUniform(name: "u_strength", float: 1)
        ]
        
        let attributes = [
            SKAttribute(name: "a_size", type: .vectorFloat2)
        ]
        
        return SKShader(fromFile: "SHKEmbossColor", uniforms: uniforms, attributes: attributes)
    }
    
    public static func createColorInvert() -> SKShader {
        return SKShader(fromFile: "SHKColorInvert")
    }
    
    public static func createColorNonAlpha() -> SKShader {
        let uniforms: [SKUniform] = [
            SKUniform(name: "u_color", color: .yellow)
        ]
        
        return SKShader(fromFile: "SHKColorNonAlpha", uniforms: uniforms)
    }
    
    public static func createColorize() -> SKShader {
        let uniforms: [SKUniform] = [
            SKUniform(name: "u_color", color: .green),
            SKUniform(name: "u_strength", float: 1)
        ]
        
        return SKShader(fromFile: "SHKColorize", uniforms: uniforms)
    }
    
    public static func createDesaturate() -> SKShader {
        let uniforms: [SKUniform] = [
            SKUniform(name: "u_strength", float: 0.5)
        ]
        
        return SKShader(fromFile: "SHKDesaturate", uniforms: uniforms)
    }
    
    public static func createDynamicGrayNoise() -> SKShader {
        return SKShader(fromFile: "SHKDynamicGrayNoise")
    }
    
    public static func createDynamicRainbowNoise() -> SKShader {
        return SKShader(fromFile: "SHKDynamicRainbowNoise")
    }
    
    public static func createGrayEmboss() -> SKShader {
        let uniforms: [SKUniform] = [
            SKUniform(name: "u_strength", float: 1)
        ]
        
        let attributes = [
            SKAttribute(name: "a_size", type: .vectorFloat2)
        ]
        
        return SKShader(fromFile: "SHKEmbossGray", uniforms: uniforms, attributes: attributes)
    }
    
    public static func createInfrared() -> SKShader {
        return SKShader(fromFile: "SHKInfrared")
    }
    
    public static func createInterlace() -> SKShader {
        let uniforms: [SKUniform] = [
            SKUniform(name: "u_width", float: 2),
            SKUniform(name: "u_color", color: .black),
            SKUniform(name: "u_strength", float: 0.35),
        ]
        
        let attributes = [
            SKAttribute(name: "a_size", type: .vectorFloat2)
        ]
        
        return SKShader(fromFile: "SHKInterlace", uniforms: uniforms, attributes: attributes)
    }
    
    public static func createLightGrid() -> SKShader {
        let uniforms: [SKUniform] = [
            SKUniform(name: "u_density", float: 8),
            SKUniform(name: "u_speed", float: 3),
            SKUniform(name: "u_group_size", float: 2),
            SKUniform(name: "u_brightness", float: 3),
        ]
        
        return SKShader(fromFile: "SHKLightGrid", uniforms: uniforms)
    }
    
    public static func createLinearGradient() -> SKShader {
        let uniforms: [SKUniform] = [
            SKUniform(name: "u_first_color", color: .blue),
            SKUniform(name: "u_second_color", color: .clear)
        ]
        
        return SKShader(fromFile: "SHKLinearGradient", uniforms: uniforms)
    }
    
    public static func createPassthrough() -> SKShader {
        return SKShader(fromFile: "SHKPassthrough")
    }
    
    public static func createPixelate() -> SKShader {
        let uniforms: [SKUniform] = [
            SKUniform(name: "u_strength", float: 8),
        ]
        
        let attributes = [
            SKAttribute(name: "a_size", type: .vectorFloat2)
        ]
        
        return SKShader(fromFile: "SHKPixelate", uniforms: uniforms, attributes: attributes)
    }
    
    public static func createRadialGradient() -> SKShader {
        let uniforms: [SKUniform] = [
            SKUniform(name: "u_first_color", color: .clear),
            SKUniform(name: "u_second_color", color: .darkGray),
            SKUniform(name: "u_center", point: CGPoint(x: 0.75, y: 0.25))
        ]
        
        return SKShader(fromFile: "SHKRadialGradient", uniforms: uniforms)
    }
    
    public static func createScanlines() -> SKShader {
        let uniforms: [SKUniform] = [
            SKUniform(name: "u_width", float: 4.0),
            SKUniform(name: "u_brightness", float: 0.75),
            SKUniform(name: "u_color", color: .white),
        ]
        
        let attributes = [
            SKAttribute(name: "a_size", type: .vectorFloat2)
        ]
        
        return SKShader(fromFile: "SHKScanlines", uniforms: uniforms, attributes: attributes)
    }
    
    public static func createScreen() -> SKShader {
        let uniforms: [SKUniform] = [
            SKUniform(name: "u_width", float: 2),
            SKUniform(name: "u_color", color: .clear),
            SKUniform(name: "u_strength", float: 1),
        ]
        
        let attributes = [
            SKAttribute(name: "a_size", type: .vectorFloat2)
        ]
        
        return SKShader(fromFile: "SHKScreen", uniforms: uniforms, attributes: attributes)
    }
    
    public static func createStaticGrayNoise() -> SKShader {
        return SKShader(fromFile: "SHKStaticGrayNoise")
    }
    
    public static func createStaticRainbowNoise() -> SKShader {
        return SKShader(fromFile: "SHKStaticRainbowNoise")
    }
    
    public static func createWater() -> SKShader {
        let uniforms: [SKUniform] = [
            SKUniform(name: "u_speed", float: 1.5),
            SKUniform(name: "u_strength", float: 2),
            SKUniform(name: "u_frequency", float: 8)
        ]
        
        return SKShader(fromFile: "SHKWater", uniforms: uniforms)
    }
    
    public static func createSwim() -> SKShader {
        let uniforms: [SKUniform] = [
            SKUniform(name: "u_speed", float: 3.0),
            SKUniform(name: "u_strength", float: 2.0),
            SKUniform(name: "u_frequency", float: 10.0)
        ]
        
        return SKShader(fromFile: "SHKWater", uniforms: uniforms)
    }
    
}
