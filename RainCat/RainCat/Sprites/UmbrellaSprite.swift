//
//  UmbrellaSprite.swift
//  RainCat
//
//  Created by Amy Joscelyn on 10/3/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

import Foundation
import SpriteKit

public class UmbrellaSprite: SKSpriteNode
{
    private var destination: CGPoint!
    private let easing: CGFloat = 0.1
    
    public static func newInstance() -> UmbrellaSprite
    {
        let whiteUmbrella = UmbrellaSprite(imageNamed: "umbrella")
        
        let path = UIBezierPath()
        path.move(to: CGPoint())
        path.addLine(to: CGPoint(x: -whiteUmbrella.size.width / 2 - 30, y: 0))
        path.addLine(to: CGPoint(x: 0, y: whiteUmbrella.size.height / 2))
        path.addLine(to: CGPoint(x: whiteUmbrella.size.width / 2 + 30, y: 0))
        
        whiteUmbrella.physicsBody = SKPhysicsBody(polygonFrom: path.cgPath)
        whiteUmbrella.physicsBody?.isDynamic = false
        whiteUmbrella.physicsBody?.categoryBitMask = UmbrellaCategory
        whiteUmbrella.physicsBody?.contactTestBitMask = RainDropCategory
        
        return whiteUmbrella
    }
    
    public func updatePosition(point: CGPoint)
    {
        position = point
        destination = point
    }
    
    public func setDestination(destination: CGPoint)
    {
        self.destination = destination
    }
    
    public func update(deltaTime: TimeInterval)
    {
        let distance = sqrt(pow((destination.x - position.x), 2) + pow((destination.y - position.y), 2))
        
        if distance > 1
        {
            let directionX = (destination.x - position.x)
            let directionY = (destination.y - position.y)
            
            position.x += directionX * easing
            position.y += directionY * easing
        }
        else
        {
            position = destination
        }
    }
}
