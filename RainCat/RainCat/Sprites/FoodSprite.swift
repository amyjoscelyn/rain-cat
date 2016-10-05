//
//  FoodSprite.swift
//  RainCat
//
//  Created by Amy Joscelyn on 10/4/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

import SpriteKit

public class FoodSprite: SKSpriteNode
{
    public static func newInstance() -> FoodSprite
    {
        let foodDish = FoodSprite(imageNamed: "food_dish")
        
        foodDish.physicsBody = SKPhysicsBody(rectangleOf: foodDish.size)
        foodDish.physicsBody?.categoryBitMask = FoodCategory
        foodDish.physicsBody?.contactTestBitMask = WorldFrameCategory | RainDropCategory | CatCategory
        foodDish.zPosition = 3
        
        return foodDish
    }
}
