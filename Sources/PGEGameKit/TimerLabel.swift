
//  Created by Playground Engineer
//  Copyright © 2025 Satyananda Corp
//  Licensed for educational use. See LICENSE file for details.


import Foundation
import SpriteKit

public class TimerLabel {
    let label = LabelNode(text: "00:00")
    public var timer: Timer?
    public init() {
        label.position = position
        label.fontName = fontName
        label.fontSize = fontSize
        label.fontColor = fontColor
        label.zPosition = 100
    }
    public var position: CGPoint = .zero {
        didSet {
            label.position = position
        }
    }
    public var fontName: String = "" {
        didSet {
            label.fontName = fontName
        }
    }
    public var fontSize: CGFloat = 30.0 {
        didSet {
            label.fontSize = fontSize
        }
    }
    public var fontColor: UIColor = .white {
        didSet {
            label.fontColor = fontColor
        }
    }
    public var frame: CGRect {
        return label.frame
    }
   
    private func endOld(by sec: Int, min: Int, hour: Int, completion: @escaping ()->()) {
        canvas.addChild(label)
        var sec = sec
        var min = min
        var hour = hour
        var elapsedTime = hour * (60 * 60) + min * 60 + sec
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
            if elapsedTime <= 0 {
                timer.invalidate()
                elapsedTime = 0
                completion()
            }
            elapsedTime -= 1
            var tSec = "00"
            var tMin = "00"
            var tHour = "00"
            var timeInterval = 1
            tSec = (sec < 10) ? "0\(sec)" : "\(sec)"
            tMin =  (min < 10) ? "0\(min)" : "\(min)"
            tHour = (hour < 10) ? "0\(hour)" : "\(hour)"
            label.text = "\(tMin):\(tSec)"
            sec -= timeInterval
            if sec == 0 {
                sec = 60
                min -= 1
                if min == 0 {
                    if hour > 0 {
                        hour -= 1
                    }
                }
            }
        }
    }
    
    private func endOld(by endTime: Int, completion: @escaping ()->()) {
        canvas.addChild(label)
        var sec = 0
        var min = 0
        var hour = 0
        var elapsedTime = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
            elapsedTime += 1
            if elapsedTime >= endTime {
                timer.invalidate()
                elapsedTime = 0
                completion()
            }
            var tSec = "00"
            var tMin = "00"
            var tHour = "00"
            var timeInterval = 1
            sec += timeInterval
            tSec = (sec < 10) ? "0\(sec)" : "\(sec)"
            tMin =  (min < 10) ? "0\(min)" : "\(min)"
            tHour = (hour < 10) ? "0\(hour)" : "\(hour)"
            label.text = "\(tMin):\(tSec)"
            if sec == 60 {
                sec = 0
                min += 1
            }
            if min == 60 {
                min = 0
                hour += 1
            }
            if hour == 24 {
                hour = 0
            }
        }
    }
    
    public func end(by endTime: Int, completion: @escaping ()->()) {
        label.text = "00:\(endTime)"
        canvas.addChild(label)
        var sec = endTime
        var min = 0
        var hour = 0
        var elapsedTime = endTime
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
            elapsedTime -= 1
            if elapsedTime <= 0 {
                timer.invalidate()
                elapsedTime = 0
                completion()
            }
            var tSec = "00"
            var tMin = "00"
            var tHour = "00"
            let timeInterval = 1
            sec -= timeInterval
            tSec = (sec < 10) ? "0\(sec)" : "\(sec)"
            tMin =  (min < 10) ? "0\(min)" : "\(min)"
            tHour = (hour < 10) ? "0\(hour)" : "\(hour)"
            label.text = "\(tMin):\(tSec)"
            if sec == 60 {
                sec = 0
                min += 1
            }
            if min == 60 {
                min = 0
                hour += 1
            }
            if hour == 24 {
                hour = 0
            }
        }
    }
}






