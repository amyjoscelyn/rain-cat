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
        
        return whiteUmbrella
    }
}
