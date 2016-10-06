//
//  HudNode.swift
//  RainCat
//
//  Created by Amy Joscelyn on 10/6/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

import SpriteKit

class HudNode: SKNode
{
    private let scoreKey = "RAINCAT_HIGHSCHORE"
    private let scoreNode = SKLabelNode(fontNamed: "PixelDigivolve")
    private(set) var score: Int = 0
    private var highScore: Int = 0
    private var showingHighScore = false
    
    //Set up HUD here
    public func setup(size: CGSize)
    {
        let defaults = UserDefaults.standard //we're not worried about security so UserDefaults is the perfect solution to store small chunks of data
        
        highScore = defaults.integer(forKey: scoreKey)
        
        scoreNode.text = "\(score)"
        scoreNode.fontSize = 70
        scoreNode.position = CGPoint(x: size.width / 2, y: size.height - 100)
        scoreNode.zPosition = 1
        
        addChild(scoreNode)
    }
    
    public func addPoint()
    {
        score += 1
        
        updateScoreboard()
        
        if score > highScore
        {
            let defaults = UserDefaults.standard
            
            defaults.set(score, forKey: scoreKey)
            
            if !showingHighScore
            {
                showingHighScore = true
                
                scoreNode.run(SKAction.scale(to: 1.5, duration: 0.25))
                scoreNode.fontColor = SKColor.yellow
            }
        }
    }
    
    public func resetPoints()
    {
        score = 0
        
        updateScoreboard()
        
        if showingHighScore
        {
            showingHighScore = false
            
            scoreNode.run(SKAction.scale(to: 1.0, duration: 0.25))
            scoreNode.fontColor = SKColor.white
        }
    }
    
    private func updateScoreboard()
    {
        scoreNode.text = "\(score)"
    }
}