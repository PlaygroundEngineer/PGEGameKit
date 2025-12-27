
//  Created by Playground Engineer
//  Copyright © 2025 Satyananda Corp
//  Licensed for educational use. See LICENSE file for details.


import Foundation
import UIKit
import SpriteKit
import SwiftUI

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}


public func randomSwiftUIColor() -> Color {
    let r = Double.random(in: 0...1)
    let g = Double.random(in: 0...1)
    let b = Double.random(in: 0...1)
    return Color(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b))
}
public func randomSwiftUIColor(with opacity: Double) -> Color {
    let r = Double.random(in: 0...1)
    let g = Double.random(in: 0...1)
    let b = Double.random(in: 0...1)
    return Color(.sRGB, red: r, green: g, blue: b, opacity: opacity)
 }

public func randomColor() -> UIColor {
    let r = Double.random(in: 0...1)
    let g = Double.random(in: 0...1)
    let b = Double.random(in: 0...1)
    return UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1.0)
}

public func randomColor(with alpha: Double) -> UIColor {
    let r = Double.random(in: 0...1)
    let g = Double.random(in: 0...1)
    let b = Double.random(in: 0...1)
    return UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(alpha))
}

public func random(_ a: Int, _ b: Int) -> Int {
    return Int.random(in: a...b)
}

public func random(_ a: Double, _ b: Double) -> Double {
    return Double.random(in: a...b)
}

public func random(_ a: CGFloat, _ b: CGFloat) -> CGFloat {
    return CGFloat.random(in: a...b)
}

public func point(_ x: Int, _ y: Int) -> CGPoint {
    return CGPoint(x: x, y: y)
}

public func point(_ x: Double, _ y: Double) -> CGPoint {
    return CGPoint(x: x, y: y)
}

public func point(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
    return CGPoint(x: x, y: y)
}

public func addCollisionBoarderToCanvas() {
    canvas.physicsBodyType = .path
    canvas.isDynamic = true
    canvas.affectedByGravity = false
}

public struct PlaygroundImage {
    public static var badMonster = UIImage(named: "badMonster.png")!
    public static var goodMonster = UIImage(named: "goodMonster.png")!
    public static var blueBall = UIImage(named: "blueBall.png")!
    public static var pinkBall = UIImage(named: "pinkBall.png")!
    public static var yellowBall = UIImage(named: "yellowBall.png")!
    public static var greenBall = UIImage(named: "greenBall.png")!
}

public struct PlaygroundSound {
    public static var alarmHarp = "alarm_harp_looped_002.wav"
    public static var alarmMicro = "alarm_micro_vibe_looped_007.wav"
    public static var alertBright = "alert_bright_echo_010.wav"
    public static var click = "click_011.wav"
    public static var error = "game_error_002.wav"
    public static var lose = "game_lose_001.wav"
    public static var win = "tone_alert_006"
    public static var notify = "kali_notify_001"
    public static var alertNegative = "negative_alert_007.wav"
    public static var alertPositive = "perc_positive_001.wav"
    public static var alertNegative2 = "perc_negative_005.wav"
    public static var singleBell = "perc_single_bell_001.wav"
    public static var toneBend = "tone_bend_004.wav"
    public static var swell01 = "tone_swell_001.wav"
    public static var swell02 = "tone_swell_002.wav"
    public static var swell03 = "tone_swell_003.wav"
    public static var swell04 = "tone_swell_004.wav"
}

public struct Font {
    public static var arialMT = "ArialMT"
    public static var arialBoldItalicMT = "Arial-BoldItalicMT"
    public static var arialBoldMT = "Arial-BoldMT"
    public static var arialItalicMT = "Arial-ItalicMT"
    public static var markerFeltThin = "MarkerFelt-Thin"
    public static var palatinoRoman  = "Palatino-Roman"
    public static var snellRoundhand = "SnellRoundhand"
    public static var futuraMedium = "Futura-Medium"
    public static var gillSansSemiBoldItalic = "GillSans-SemiBoldItalic"
    public static var partyLetPlain = "PartyLetPlain"
    public static var savoyeLetPlain = "SavoyeLetPlain"
    public static var trebuchetMS = "TrebuchetMS"
    public static var zapfin = "Zapfin"
    public static var pingFangTCRegular = "PingFangTC-Regular"
}

public struct EmitterFile {
    public static var fire = "Fire.sks"
    public static var fireFlies = "FireFlies.sks"
    public static var rain = "Rain.sks"
    public static var smoke = "Smoke.sks"
    public static var spark = "Spark.sks"
    public static var bokeh = "Bokeh.sks"
    public static var snow = "Snow.sks"
}

extension UIImage {
    class func image(from layer: CALayer) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(layer.bounds.size,
                                               layer.isOpaque, UIScreen.main.scale)
        
        defer { UIGraphicsEndImageContext() }
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

public func mask(_ node: SKNode, with maskNode: SKNode) -> SKCropNode {
    let cropNode = SKCropNode()
    cropNode.maskNode = maskNode
    cropNode.addChild(node)
    return cropNode
}

public func removeOutOfScreenNodes() {
    let screen = UIScreen.main.bounds
    for node in canvas.children {
        if abs(node.position.x) > screen.width / 2 ||
            abs(node.position.y) > screen.height / 2 {
            node.removeFromParent()
        }
    }
}

public func getShapeNode(for points: [CGPoint]) -> ShapeNode {
    var points = points
    return ShapeNode(splinePoints: &points, count: points.count)
}

public func crescent(width: Double, height: Double, center: CGPoint) -> CGPath {
    let path = CGMutablePath()
    
    let x = Double(center.x) - width / 2
    let y = Double(center.y) + height
    let p = point(x, y)
    
    let x1 = Double(center.x) + width / 2
    let y1 = Double(center.y) + height
    let p1 = point(x1, y1)
    
    let x2 = Double(center.x)
    let y2 = Double(center.y) - height
    let c = point(x2, y2)
    
    path.move(to: p)
    path.addQuadCurve(to: p1, control: c)
    
    path.move(to: p)
    path.addQuadCurve(to: p1, control: center)
    
    return path
}

public func leaf(width: Double, height: Double, center: CGPoint) -> CGPath {
    let path = CGMutablePath()
    
    let x2 = Double(center.x)
    let y2 = Double(center.y) - height/2
    let p1 = point(x2, y2)
    
    let x3 = Double(center.x)
    let y3 = Double(center.y) + (height/2)
    let p2 = point(x3, y3)
    
    let x = Double(center.x) - width / 2
    let y = Double(center.y)
    let c1 = point(x, y)
    
    let x1 = Double(center.x) + width / 2
    let y1 = Double(center.y)
    let c2 = point(x1, y1)
    
    path.move(to: p1)
    path.addQuadCurve(to: p2, control: c1)
    
    path.move(to: p1)
    path.addQuadCurve(to: p2, control: c2)
    
    return path
}

public func resizeImageToFitCanvas(_ image: UIImage) -> CGSize {
    var h = image.size.height
    var w = image.size.width
    while  h > canvas.frame.height || w > canvas.frame.width {
        var ratio: CGFloat = 1.0
        if h > canvas.frame.height {
            ratio = CGFloat(canvas.frame.height / h)
        } else if w > canvas.frame.width {
            ratio = CGFloat(canvas.frame.width / w)
        }
        w = w * ratio
        h = h * ratio
    }
    return CGSize(width: w, height: h)
}

extension UIColor {

    func lighter(by percentage: CGFloat = 30.0) -> UIColor {
        return self.adjust(by: abs(percentage) )
    }

    func darker(by percentage: CGFloat = 30.0) -> UIColor {
        return self.adjust(by: -1 * abs(percentage) )
    }

    func adjust(by percentage: CGFloat = 30.0) -> UIColor {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            if percentage < 0 {
                return UIColor.white
            } else {
                return UIColor.black
            }
        }
    }
}

public struct Message {
    private var labelYPosition = 150.0
    private var messages: [String] = []
    public init(messages: [String]) {
        self.messages = messages
        for message in messages {
            setMessage(text: message)
        }
    }
    mutating func setMessage(text: String) {
        let labelNode = LabelNode(text: "\(text)")
        labelNode.position.y = CGFloat(labelYPosition)
        labelNode.fontSize = 20.0
        labelNode.fontName = Font.arialBoldMT
        labelNode.fontColor = UIColor(red: 224/255, green: 16/255, blue: 115/255, alpha: 0.5)
        canvas.addChild(labelNode)
        
        let fade = SKAction.fadeOut(withDuration: 10.0)
        labelNode.run(fade)
        labelYPosition -= 50.0
    }

}

public func animateBackgroundHorizontal(_ img1: UIImage, _ img2: UIImage, duration: Double) {
    animateBackgroundHorizontal(img1, img2, zPosition: 1, duration: duration)
}
public func animateBackgroundHorizontal(_ img1: UIImage, _ img2: UIImage, duration: Double, shader: SKShader?) {
    animateBackgroundHorizontal(img1, img2, zPosition: 1, duration: duration, shader: shader)
}
public func animateBackgroundHorizontal(_ img1: UIImage, _ img2: UIImage, zPosition: CGFloat, duration: Double) {
    animateBackgroundHorizontal(img1, img2, zPosition: zPosition, duration: duration, shader: nil)
}
public func animateBackgroundHorizontal(_ img1: UIImage, _ img2: UIImage, zPosition: CGFloat, duration: Double, shader: SKShader?) {
    let m1 = SpriteNode(image: img1)
    m1.shader = shader
    m1.zPosition = zPosition
    m1.aspectFill(to: CGSize(width: m1.frame.width, height: canvas.frame.height))
    canvas.addChild(m1)

    let a1 = SKAction.move(by: CGVector(dx: m1.frame.width, dy: 0), duration: duration)
    let a2 = SKAction.move(by: CGVector(dx: -2 * m1.frame.width, dy: 0), duration: 0.0)
    let a3 = SKAction.sequence([a1, a2, a1])
    let a4 = SKAction.repeatForever(a3)
    m1.run(a4)
   
    let m2 = SpriteNode(image: img2)
    m2.shader = shader
    m2.zPosition = zPosition
    m2.aspectFill(to: CGSize(width: m2.frame.width, height: canvas.frame.height))
    canvas.addChild(m2)
    let startPosition = (m1.frame.width/2 + m2.frame.width/2) * -1
    m2.position.x = startPosition
    
    let b1 = SKAction.moveTo(x: 0, duration: duration)
    let b2 = SKAction.move(by: CGVector(dx: (m1.frame.width/2 + m2.frame.width/2), dy: 0), duration: duration)
    let b3 = SKAction.move(to: CGPoint(x: startPosition, y: 0), duration: 0.0)
    let b4 = SKAction.sequence([b1, b2, b3])
    let b5 = SKAction.repeatForever(b4)
    m2.run(b5)
}


public func animateBackgroundVertically(_ img1: UIImage, _ img2: UIImage, duration: Double) {
    animateBackgroundVertically(img1, img2, zPosition: 1, duration: duration)
}
public func animateBackgroundVertically(_ img1: UIImage, _ img2: UIImage, duration: Double, shader: SKShader?) {
    animateBackgroundVertically(img1, img2, zPosition: 1, duration: duration, shader: shader)
}
public func animateBackgroundVertically(_ img1: UIImage, _ img2: UIImage, zPosition: CGFloat, duration: Double) {
    animateBackgroundVertically(img1, img2, zPosition: zPosition, duration: duration, shader: nil)
}
public func animateBackgroundVertically(_ img1: UIImage, _ img2: UIImage, zPosition: CGFloat, duration: Double, shader: SKShader?) {
    let m1 = SpriteNode(image: img1)
    m1.shader = shader
    m1.zPosition = zPosition
    m1.aspectFill(to: CGSize(width: m1.frame.width, height: canvas.frame.height))
    canvas.addChild(m1)

    let a1 = SKAction.move(by: CGVector(dx: 0, dy: -m1.frame.height), duration: duration)
    let a2 = SKAction.move(by: CGVector(dx: 0, dy: 2 * m1.frame.height), duration: 0.0)
    let a3 = SKAction.sequence([a1, a2, a1])
    let a4 = SKAction.repeatForever(a3)
    m1.run(a4)
   
    let m2 = SpriteNode(image: img2)
    m2.shader = shader
    m2.zPosition = zPosition
    m2.aspectFill(to: CGSize(width: m2.frame.width, height: canvas.frame.height))
    canvas.addChild(m2)
    let startPosition = (m1.frame.height/2 + m2.frame.height/2)
    m2.position.y = startPosition
    
    let b1 = SKAction.moveTo(y: 0, duration: duration)
    let b2 = SKAction.move(by: CGVector(dx: 0, dy: -(m1.frame.height/2 + m2.frame.height/2)), duration: duration)
    let b3 = SKAction.move(to: CGPoint(x: 0, y: startPosition), duration: 0.0)
    let b4 = SKAction.sequence([b1, b2, b3])
    let b5 = SKAction.repeatForever(b4)
    m2.run(b5)
}
