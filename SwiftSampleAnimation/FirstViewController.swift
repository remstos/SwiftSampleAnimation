//
//  FirstViewController.swift
//  SwiftSampleAnimation
//
//  Created by Remi Santos on 10/11/14.
//  Copyright (c) 2014 Remi Santos. All rights reserved.
//
import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var goButton: UIButton!
    
    @IBOutlet var round1: UIView!
    
    @IBOutlet var round2: UIView!
    var round1Center:CGPoint!
    var shouldReset:Bool=false
    let swagColor = UIColor(red:0.000000, green:0.776471, blue:0.674510, alpha:1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //goButton initialize
        goButton.backgroundColor = goButton.tintColor
        goButton.tintColor = UIColor.whiteColor()
        goButton.layer.cornerRadius = goButton.frame.size.height/2
        //round1 initialize
        round1.backgroundColor = swagColor
        round1.layer.cornerRadius = round1.frame.size.width/2
        //round2 initialize
        round2.layer.cornerRadius = round2.frame.size.width/2
        round2.backgroundColor = swagColor
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goActionButton(sender: AnyObject) {
        
        
        if shouldReset == true {
            startReset()
        }
        else {
            startAnimation()
        }
        
    }
    
    func startReset()
    {
        self.round1.transform = CGAffineTransformIdentity
        round2.backgroundColor = swagColor
        round2.layer.cornerRadius = round2.frame.size.width/2
        shouldReset = false
        goButton.setTitle("Animate !", forState: .Normal)
    }
    
    
    func startAnimation()
    {
        round1Center = round1.center
        
        UIView.animateWithDuration(1, animations: { () -> Void in
            //Move round1 to the right
            self.round1.transform = CGAffineTransformMakeTranslation(self.view.frame.size.width-100, 0)
            //Change round2 form and color
            self.round2.backgroundColor = UIColor.blueColor()
            self.round2.layer.cornerRadius = 0
            
        })
        shouldReset = true
        goButton.setTitle("Reset", forState: .Normal)
    }

}

