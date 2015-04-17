//
//  BouncerBehavior.swift
//  Bouncer
//
//  Created by Soojin Ro on 4/13/15.
//  Copyright (c) 2015 NSoojin. All rights reserved.
//

import UIKit

class BouncerBehavior: UIDynamicBehavior {
    let gravity = UIGravityBehavior()
    
    lazy var collider: UICollisionBehavior = {
        let createdCollider = UICollisionBehavior()
        createdCollider.translatesReferenceBoundsIntoBoundary = true
        return createdCollider
        }()
    
    lazy var BlockBehavior: UIDynamicItemBehavior = {
        let createdBlockBehavior = UIDynamicItemBehavior()
        createdBlockBehavior.allowsRotation = true
        createdBlockBehavior.elasticity = CGFloat(NSUserDefaults.standardUserDefaults().doubleForKey("BouncerBehavior.Elasticity"))
        createdBlockBehavior.friction = 0
        createdBlockBehavior.resistance = 0
        
        NSNotificationCenter.defaultCenter().addObserverForName(NSUserDefaultsDidChangeNotification, object: nil, queue: nil) { (notification) -> Void in
            createdBlockBehavior.elasticity = CGFloat(NSUserDefaults.standardUserDefaults().doubleForKey("BouncerBehavior.Elasticity"))
        }
        return createdBlockBehavior
        }()
    
    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collider)
        addChildBehavior(BlockBehavior)
    }
    
    func addBarrier(path: UIBezierPath, name: String) {
        collider.removeBoundaryWithIdentifier(name)
        collider.addBoundaryWithIdentifier(name, forPath: path)
    }
    
    func addBlock(block: UIView) {
        dynamicAnimator?.referenceView?.addSubview(block)
        gravity.addItem(block)
        collider.addItem(block)
        BlockBehavior.addItem(block)
    }
    
    func removeBlock(block: UIView) {
        gravity.removeItem(block)
        collider.removeItem(block)
        BlockBehavior.removeItem(block)
        block.removeFromSuperview()
    }
}
