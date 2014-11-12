//
//  ThirdViewController.swift
//  SwiftSampleAnimation
//
//  Created by EDOUARD CHUSSEAU on 10/11/2014.
//  Copyright (c) 2014 Remi Santos. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var goButton: UIButton!
    
    @IBOutlet weak var container: UIView!
    
    var animator:UIDynamicAnimator!
    var gravity = UIGravityBehavior()
    var collision = UICollisionBehavior()
    var elasticity = UIDynamicItemBehavior()
    let swagColor = UIColor(red:0.000000, green:0.776471, blue:0.674510, alpha:1.0)

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.view.backgroundColor = UIColor.whiteColor()
        
        //goButton initialize
        goButton.backgroundColor = goButton.tintColor
        goButton.tintColor = UIColor.whiteColor()
        goButton.layer.cornerRadius = goButton.frame.size.height/2
        
        //Dynamic initialize
        animator = UIDynamicAnimator(referenceView: self.view)
        
        //Gravity (with Georges Clooney ? :o)
        gravity.gravityDirection = CGVectorMake(0, 1)
        gravity.magnitude = 10
        animator.addBehavior(gravity)
        
        //Collisions
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)

        //elasticity
        elasticity.elasticity = 0.4
        animator.addBehavior(elasticity)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        for view in container.subviews as [UIView] {
            view.removeFromSuperview()
        }
        self.view .sendSubviewToBack(container)
    }
    @IBAction func letsFall(sender: AnyObject) {
        let width = Int(self.view.frame.size.width)
        let randomX = (random()%(width - 50)) + 50
        var newBall = UIView(frame: CGRectMake(CGFloat(randomX), 0, 50, 50))
        newBall.layer.cornerRadius = newBall.frame.size.width/2
        newBall.backgroundColor = swagColor
        
        container.addSubview(newBall)
        
        gravity.addItem(newBall)
        collision.addItem(newBall)
        elasticity.addItem(newBall)
        
    }

}
