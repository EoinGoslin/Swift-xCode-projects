//
//  PolygonView.swift
//  HelloPoly3
//
//  Created by Eoin Goslin on 25/02/2019.
//  Copyright © 2019 COMP47390. All rights reserved.
//


// Custom View which will display the shape

import Foundation
import CoreGraphics
import UIKit



class PolygonView: UIView {
    //Must be a delegate to the protocol
    var delegate:PolygonProtocol? = nil
    var lineWidth:Float = 2.0
    var strokeColour:UIColor = UIColor.blue
    var fillColour:UIColor = UIColor.green.withAlphaComponent(0.5)
    
    
    //need to override draw function
    override func draw(_ rect: CGRect) {
        let insetRect = rect.insetBy(dx: CGFloat(lineWidth / 2), dy: CGFloat(lineWidth / 2))
        
        if let vertices = delegate?.pointsInRect(insetRect) {
            fillColour.setFill()
            strokeColour.setStroke()
            let path = UIBezierPath()
            path.move(to: vertices[0])
            for vertex in vertices[1..<vertices.count] {
                path.addLine(to: vertex)
            }
            path.close()
            path.stroke()
            path.fill()
        }
    }
    
}
