//
//  PolygonShape.swift
//  HelloPoly3
//
//  Created by Eoin Goslin on 25/02/2019.
//  Copyright © 2019 COMP47390. All rights reserved.
//

import UIKit
import CoreGraphics

// Anyone who is adheres to this protocol must implement this method
protocol PolygonProtocol {
    func pointsInRect(_ rect: CGRect) -> [CGPoint]
}

class PolygonShape: NSObject, PolygonProtocol {
    
    func pointsInRect(_ rect: CGRect) -> [CGPoint] {
        let center = rect.center
        let radius = min(rect.size.width, rect.size.height) / 2.0
        let arc = 2 * CGFloat.pi / CGFloat(numberOfSides)
        var vertexArray = [CGPoint]()
        for i in 0..<numberOfSides {
            var vertex = center
            vertex.x += cos(arc * CGFloat(i) - 2 * CGFloat.pi) * radius
            vertex.y += sin(arc * CGFloat(i) - 2 * CGFloat.pi) * radius
            vertexArray.append(vertex)
        }
        return vertexArray
    }
    
    
    //will be used to updated the shape name label
    private var names = ["triangle", "square", "pentagon", "hexagon", "heptagon", "octagon", "novagon", "decagon", "Hendecagon", "Dodecagon"]
    
    
    public var numberOfSides:Int = 8 {
        didSet {
            if !(3...12).contains(numberOfSides) {
                if oldValue <= 3 {
                    numberOfSides = 3
                } else {
                    numberOfSides = 12
                }
            }
        }
    }
    //return name of shape on the fly
    var name:String {
        get {
            return names[numberOfSides-3]
        }
    }
    
    override var description: String {
        return name
    }
    
    
    
}

//Need to make an extension fot rect for the center point
extension CGRect {
    var center: CGPoint {
        get{
            return CGPoint(x: size.width/2.0 * origin.x, y: size.height/2.0 * origin.y)
        }
    }
}
