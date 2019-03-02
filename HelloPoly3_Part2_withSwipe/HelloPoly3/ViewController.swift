//
//  ViewController.swift
//  HelloPoly3
//
//  Created by Eoin Goslin on 25/02/2019.
//  Copyright © 2019 COMP47390. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var VertexLabelCount: UILabel!
    
    @IBOutlet weak var decreaseButton: UIButton!
    
    @IBOutlet weak var increaseButton: UIButton!
   
    
    // Custom View
    
    @IBOutlet weak var polygonView: PolygonView!
    
    
    //swipe gesture recognizer for right side
    
    @IBAction func rightSwipe(_ sender: UISwipeGestureRecognizer) {
        polygonModel.numberOfSides += 1
        updateUI()
    }
    
    
    //For the left
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        polygonModel.numberOfSides -= 1
        updateUI()
    }
    
    
   
    // add model to the controller
    lazy var polygonModel:PolygonShape = {
        let polygon = PolygonShape()
        polygon.numberOfSides = 8
        return polygon
    }()
    
    //add button functionalities
    
    @IBAction func decreaseNumberOfSides(_ sender: UIButton) {
        polygonModel.numberOfSides -= 1
        updateUI()
    }
    
    @IBAction func increaseNumberOfSides(_ sender: UIButton) {
        polygonModel.numberOfSides += 1
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //when view loads want to get information back from defaults if any
        
        let defaults:UserDefaults = UserDefaults.standard
        if let numberOfSides = defaults.object(forKey: "numberOfSides") as? Int {
            polygonModel.numberOfSides = numberOfSides
        }
        polygonView.delegate = polygonModel
        // Update UI when view loads as well
        updateUI()
    }
    
    
    func updateUI() {
        
        let defaults:UserDefaults = UserDefaults.standard
        defaults.set(polygonModel.numberOfSides, forKey: "numberOfSides")
        defaults.synchronize()
        
        polygonView.setNeedsDisplay()
        
        //update VertexCountLabel to display correct number
        VertexLabelCount.text = "\(polygonModel.numberOfSides)"
        //disable/enable button if number of sides is at minimum or maximum
        decreaseButton.isEnabled = polygonModel.numberOfSides == 3 ? false : true
        increaseButton.isEnabled = polygonModel.numberOfSides == 12 ? false : true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //remove resource resources that can be recreated
    }
}

