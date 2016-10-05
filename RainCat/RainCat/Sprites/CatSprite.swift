//
//  CatSprite.swift
//  RainCat
//
//  Created by Amy Joscelyn on 10/4/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

import SpriteKit

public class CatSprite: SKSpriteNode
{
    private let walkingActionKey = "action_walking"
    private let walkFrames = [
        SKTexture(imageNamed: "cat_one"),
        SKTexture(imageNamed: "cat_two")
    ]
    private let movementSpeed: CGFloat = 100
    
    public static func newInstance() -> CatSprite
    {
        let catSprite = CatSprite(imageNamed: "cat_one")
        
        catSprite.zPosition = 3
        catSprite.physicsBody = SKPhysicsBody(circleOfRadius: catSprite.size.width / 2)
        catSprite.physicsBody?.categoryBitMask = CatCategory
        catSprite.physicsBody?.contactTestBitMask = RainDropCategory | WorldFrameCategory
        
        return catSprite
    }
    
    public func update(deltaTime: TimeInterval, foodLocation: CGPoint)
    {
        if action(forKey: walkingActionKey) == nil
        {
            //this is a nested SKAction
            let walkingAction = SKAction.repeatForever(
                SKAction.animate(with: walkFrames,
                                 timePerFrame: 0.1,
                                 resize: false,
                                 restore: true))
            
            run(walkingAction, withKey: walkingActionKey)
        }
        
        if foodLocation.x < position.x
        {
            //Food is left
            position.x -= movementSpeed * CGFloat(deltaTime)
            xScale = -1
        }
        else
        {
            //Food is right
            position.x += movementSpeed * CGFloat(deltaTime)
            xScale = 1
        }
    }
}
