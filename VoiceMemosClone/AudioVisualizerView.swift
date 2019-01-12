//
//  AudioVisualizerView.swift
//  VoiceMemosClone
//
//  Created by Hassan El Desouky on 1/12/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import UIKit

class AudioVisualizerView: UIView {
    
    // Bar width
    var barWidth: CGFloat = 4.0
    // Indicate that waveform should draw active/inactive state
    var active = false {
        didSet {
            if self.active {
                self.color = UIColor.red.cgColor
            }
            else {
                self.color = UIColor.gray.cgColor
            }
        }
    }
    // Color for bars
    var color = UIColor.gray.cgColor
    // Given waveforms
    var waveforms: [Int] = Array(repeating: 0, count: 100)
    
    // MARK: - Init
    override init (frame : CGRect) {
        super.init(frame : frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        self.backgroundColor = UIColor.clear
    }
    
    // MARK: - Draw bars
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        context.clear(rect)
        context.setFillColor(red: 0, green: 0, blue: 0, alpha: 0)
        context.fill(rect)
        context.setLineWidth(1)
        context.setStrokeColor(self.color)
        let w = rect.size.width
        let h = rect.size.height
        let t = Int(w / self.barWidth)
        let s = max(0, self.waveforms.count - t)
        let m = h / 2
        let r = self.barWidth / 2
        let x = m - r
        var bar: CGFloat = 0
        for i in s ..< self.waveforms.count {
            var v = h * CGFloat(self.waveforms[i]) / 50.0
            if v > x {
                v = x
            }
            else if v < 3 {
                v = 3
            }
            let oneX = bar * self.barWidth
            var oneY: CGFloat = 0
            let twoX = oneX + r
            var twoY: CGFloat = 0
            var twoS: CGFloat = 0
            var twoE: CGFloat = 0
            var twoC: Bool = false
            let threeX = twoX + r
            let threeY = m
            if i % 2 == 1 {
                oneY = m - v
                twoY = m - v
                twoS = -180.degreesToRadians
                twoE = 0.degreesToRadians
                twoC = false
            }
            else {
                oneY = m + v
                twoY = m + v
                twoS = 180.degreesToRadians
                twoE = 0.degreesToRadians
                twoC = true
            }
            context.move(to: CGPoint(x: oneX, y: m))
            context.addLine(to: CGPoint(x: oneX, y: oneY))
            context.addArc(center: CGPoint(x: twoX, y: twoY), radius: r, startAngle: twoS, endAngle: twoE, clockwise: twoC)
            context.addLine(to: CGPoint(x: threeX, y: threeY))
            context.strokePath()
            bar += 1
        }
    }

}
