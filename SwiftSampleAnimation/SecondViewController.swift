//
//  SecondViewController.swift
//  SwiftSampleAnimation
//
//  Created by Remi Santos on 10/11/14.
//  Copyright (c) 2014 Remi Santos. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var roundGesture: UIImageView!
    
    @IBOutlet var Vroum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Vroum.hidden = true
        roundGesture.layer.cornerRadius = roundGesture.frame.size.width/2
    }

    @IBAction func GestureRound(sender: UIPanGestureRecognizer) {
        let center = sender.locationInView(self.view)
        roundGesture.center.x = center.x
        Vroum.hidden = false
        if(sender.state == UIGestureRecognizerState.Ended){
            Vroum.hidden = true
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

