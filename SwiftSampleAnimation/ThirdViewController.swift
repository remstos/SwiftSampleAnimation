//
//  ThirdViewController.swift
//  SwiftSampleAnimation
//
//  Created by EDOUARD CHUSSEAU on 10/11/2014.
//  Copyright (c) 2014 Remi Santos. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var ballOne: UIView!
    var ballOneCenter:CGPoint!
    @IBOutlet weak var ballTwo: UIView!
    @IBOutlet weak var ballThree: UIView!
    
    var animateUp = false
    var animator:UIDynamicAnimator!
    var gravity = UIGravityBehavior()
    var collision = UICollisionBehavior()
    var elasticity = UIDynamicItemBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.view.backgroundColor = UIColor.whiteColor()
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity.gravityDirection = CGVectorMake(0.1, 1)
        gravity.magnitude = 10
        animateUp = true
        animator.addBehavior(gravity)
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)

        elasticity.elasticity = 0.4
        animator.addBehavior(elasticity)
        
        ballOne.layer.cornerRadius = ballOne.frame.size.width / 2
        ballTwo.layer.cornerRadius = ballTwo.frame.size.width / 2
        ballThree.layer.cornerRadius = ballThree.frame.size.width / 2
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        ballOneCenter = ballOne.center
        
        gravity.addItem(ballOne)
        collision.addItem(ballOne)
        elasticity.addItem(ballOne)
        
        gravity.addItem(ballTwo)
        collision.addItem(ballTwo)
        elasticity.addItem(ballTwo)
        
        gravity.addItem(ballThree)
        collision.addItem(ballThree)
        elasticity.addItem(ballThree)
    }
    @IBAction func letsFall(sender: AnyObject) {
        
        if (animateUp) {
            self.upAnimation()
        } else {
            self.downAnimation()
        }
    }
    
    func upAnimation() {
        gravity.magnitude = -10
        animateUp = false
    }
    func downAnimation() {
        gravity.magnitude = 10
        animateUp = true
    }
}
