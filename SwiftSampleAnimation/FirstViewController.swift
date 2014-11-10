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
    
    @IBOutlet var round1: UIImageView!
    
    @IBOutlet var round2: UIImageView!
    var round1Center:CGPoint!
    var shouldReset:Bool=false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //goButton initialize
        goButton.layer.borderWidth = 1
        goButton.layer.borderColor = UIColor.blackColor().CGColor
        goButton.layer.cornerRadius = goButton.frame.size.height/2
        //round1 initialize
        round1.layer.backgroundColor = UIColor.blueColor().CGColor
        round1.layer.cornerRadius = round1.frame.size.width/2
        //round2 initialize
        round2.layer.cornerRadius = round2.frame.size.width/2
        round2.layer.backgroundColor = UIColor.blueColor().CGColor
        
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
        round2.layer.backgroundColor = UIColor.blueColor().CGColor
        round2.layer.cornerRadius = round2.frame.size.width/2
        shouldReset = false
    }
    
    
    func startAnimation()
    {
        round1Center = round1.center
        
        UIView.animateWithDuration(1, animations: { () -> Void in
            //Move round1 to the right
            self.round1.transform = CGAffineTransformMakeTranslation(self.view.frame.size.width-100, 0)
            //Change round2 form and color
            self.round2.layer.backgroundColor = UIColor.redColor().CGColor
            self.round2.layer.cornerRadius = 0
            
        })
        shouldReset = true
        
    }

}

