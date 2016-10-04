//
//  GameScene.swift
//  RainCat
//
//  Created by Amy Joscelyn on 10/3/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

import SpriteKit
import GameplayKit

//must conform (inherit?) to SKPhysicsContactDelegate to provide us with functions to be called when two SKPhysicsBodys begin and end collision
class GameScene: SKScene, SKPhysicsContactDelegate
{
    private var lastUpdateTime: TimeInterval = 0
    
    private var currentRainDropSpawnTime: TimeInterval = 0
    private var rainDropSpawnRate: TimeInterval = 0.16
    private let random = GKARC4RandomSource()
    
    private let whiteUmbrella = UmbrellaSprite.newInstance()
    
    override func sceneDidLoad()
    {
        self.lastUpdateTime = 0
        
        //necessary with SKPhysicsContactDelegate
        self.physicsWorld.contactDelegate = self
        
        let floorNode = SKShapeNode(rectOf: CGSize(width: size.width, height: 5))
        floorNode.position = CGPoint(x: size.width / 2, y: 50)
        floorNode.fillColor = SKColor.red
        floorNode.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: -size.width / 2, y: 0), to: CGPoint(x: size.width, y: 0))
        floorNode.physicsBody?.categoryBitMask = FloorCategory
        floorNode.physicsBody?.contactTestBitMask = RainDropCategory
        
        addChild(floorNode)
        
        whiteUmbrella.updatePosition(point: CGPoint(x: frame.midX, y: frame.midY))
        addChild(whiteUmbrella)
        //this could also be accomplished with an SKSpriteNode and just set the color without adding a texture.  Either way will work, and since it's just a temporary red rectangle, both ways are technically correct.
    }
    
    func spawnRainDrop()
    {
        let rainDrop = SKShapeNode(rectOf: CGSize(width: 20, height: 20))
        rainDrop.position = CGPoint(x: size.width / 2, y: size.height / 2)
        rainDrop.fillColor = SKColor.blue
        rainDrop.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 20))
        rainDrop.physicsBody?.categoryBitMask = RainDropCategory
        
        let randomPosition = abs(CGFloat(random.nextInt()).truncatingRemainder(dividingBy: size.width))
        rainDrop.position = CGPoint(x: randomPosition, y: size.height)
        
        addChild(rainDrop)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touchPoint = touches.first?.location(in: self)
        
        if let point = touchPoint
        {
            whiteUmbrella.setDestination(destination: point)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touchPoint = touches.first?.location(in: self)
        
        if let point = touchPoint
        {
            whiteUmbrella.setDestination(destination: point)
        }
    }
    
    override func update(_ currentTime: TimeInterval)
    {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0)
        {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime        
        self.lastUpdateTime = currentTime
        
        // Update the Spawn Timer
        currentRainDropSpawnTime += dt
        
        if currentRainDropSpawnTime > rainDropSpawnRate
        {
            currentRainDropSpawnTime = 0
            spawnRainDrop()
        }
        
        whiteUmbrella.update(deltaTime: dt)
    }
    
    func didBegin(_ contact: SKPhysicsContact)
    {
        if contact.bodyA.categoryBitMask == RainDropCategory
        {
            contact.bodyA.node?.physicsBody?.collisionBitMask = 0
        }
        else if contact.bodyB.categoryBitMask == RainDropCategory
        {
            contact.bodyB.node?.physicsBody?.collisionBitMask = 0
        }
    }
}
