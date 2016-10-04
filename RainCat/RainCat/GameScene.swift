//
//  GameScene.swift
//  RainCat
//
//  Created by Amy Joscelyn on 10/3/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene
{
    private var lastUpdateTime: TimeInterval = 0
    
    private var currentRainDropSpawnTime: TimeInterval = 0
    private var rainDropSpawnRate: TimeInterval = 0.5
    private let random = GKARC4RandomSource()
    
    private let whiteUmbrella = UmbrellaSprite.newInstance()
    
    override func sceneDidLoad()
    {
        self.lastUpdateTime = 0
        
        let floorNode = SKShapeNode(rectOf: CGSize(width: size.width, height: 5))
        floorNode.position = CGPoint(x: size.width / 2, y: 50)
        floorNode.fillColor = SKColor.red
        floorNode.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: -size.width / 2, y: 0), to: CGPoint(x: size.width, y: 0))
        
        addChild(floorNode)
        
        whiteUmbrella.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(whiteUmbrella)
        //this could also be accomplished with an SKSpriteNode and just set the color without adding a texture.  Either way will work, and since it's just a temporary red rectangle, both ways are technically correct.
    }
    
    func spawnRainDrop()
    {
        let rainDrop = SKShapeNode(rectOf: CGSize(width: 20, height: 20))
        rainDrop.position = CGPoint(x: size.width / 2, y: size.height / 2)
        rainDrop.fillColor = SKColor.blue
        rainDrop.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 20))
        
        let randomPosition = abs(CGFloat(random.nextInt()).truncatingRemainder(dividingBy: size.width))
        rainDrop.position = CGPoint(x: randomPosition, y: size.height)
        
        addChild(rainDrop)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
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
    }
}
