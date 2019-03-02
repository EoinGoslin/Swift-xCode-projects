//
//  PolygonShape.swift
//  HelloPoly3
//
//  Created by Eoin Goslin on 25/02/2019.
//  Copyright © 2019 COMP47390. All rights reserved.
//

import UIKit
import CoreGraphics

class PolygonShape: NSObject {
    
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
