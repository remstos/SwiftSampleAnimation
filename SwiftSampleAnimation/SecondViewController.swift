//
//  SecondViewController.swift
//  SwiftSampleAnimation
//
//  Created by Remi Santos on 10/11/14.
//  Copyright (c) 2014 Remi Santos. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var carImageView: UIImageView!
    
    @IBOutlet weak var bigView: UIView!
    @IBOutlet var centerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerLabel.hidden = true
    }

    func showCenterLabelWithText(text:String) {
        centerLabel.hidden = false
        centerLabel.text = text
    }
    
    
    @IBAction func carPanGestureRecognized(sender: UIPanGestureRecognizer) {
        let center = sender.locationInView(self.view)
        carImageView.center.x = center.x
        showCenterLabelWithText("VROOM !!")
        
        if(sender.state == UIGestureRecognizerState.Ended){
            centerLabel.hidden = true
        }
        
    }

    
    //Gestures on big view
    @IBAction func tapGestureRecognized(sender: UITapGestureRecognizer) {
        
        showCenterLabelWithText("Tap")
        
    }
    
    @IBAction func pinchGestureRecognized(sender: UIPinchGestureRecognizer) {
        showCenterLabelWithText("Pinch")
        bigView.transform = CGAffineTransformMakeScale(sender.scale, sender.scale)
        if(sender.state == UIGestureRecognizerState.Ended){
            bigView.transform = CGAffineTransformIdentity
        }
    }
    
    @IBAction func rotationGestureRecognized(sender: UIRotationGestureRecognizer) {
        showCenterLabelWithText("Rotate")
        bigView.transform = CGAffineTransformMakeRotation(sender.rotation)
        if(sender.state == UIGestureRecognizerState.Ended){
            bigView.transform = CGAffineTransformIdentity
        }
    }
    
    @IBAction func swipeGestureRecognized(sender: UISwipeGestureRecognizer) {
        
        switch sender.direction {
        case UISwipeGestureRecognizerDirection.Left:
                showCenterLabelWithText("Swipe left")
                break
        case UISwipeGestureRecognizerDirection.Down:
            showCenterLabelWithText("Swipe down")
            break
        case UISwipeGestureRecognizerDirection.Right:
            showCenterLabelWithText("Swipe right")
            break
        case UISwipeGestureRecognizerDirection.Up:
            showCenterLabelWithText("Swipe up")
            break
        default:
            showCenterLabelWithText("Swipe ?")
            break
        }

    }
    @IBAction func longPressGestureRecognized(sender: UILongPressGestureRecognizer) {
        showCenterLabelWithText("Long press")

    }
}

