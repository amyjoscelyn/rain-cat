//
//  MenuScene.swift
//  RainCat
//
//  Created by Amy Joscelyn on 10/6/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene
{
    let startButtonTexture = SKTexture(imageNamed: "button_start")
    let startButtonPressedTexture = SKTexture(imageNamed: "button_start_pressed")
    let soundButtonTexture = SKTexture(imageNamed: "speaker_on")
    let soundButtonOffTexture = SKTexture(imageNamed: "speaker_off")
    
    let logoSprite = SKSpriteNode(imageNamed: "logo")
    var startButton: SKSpriteNode! = nil
    var soundButton: SKSpriteNode! = nil
    
    let highScoreNode = SKLabelNode(fontNamed: "PixelDigivolve")
    
    var selectedButton: SKSpriteNode?
    
    //this scene is simple: it only contains two buttons.
    //were it to have more than three or four, it would be time to stop and refactor the menu button's code into its own class of SKSpriteNode 
    override func sceneDidLoad()
    {
        backgroundColor = SKColor(red: 0.30, green: 0.81, blue: 0.89, alpha: 1.0)
        
        //set up logo
        logoSprite.position = CGPoint(x: size.width / 2, y: size.height / 2 + 100)
        addChild(logoSprite)
        
        //set up start button
        startButton = SKSpriteNode(texture: startButtonTexture)
        startButton.position = CGPoint(x: size.width / 2, y: size.height / 2 - startButton.size.height / 2)
        addChild(startButton)
        
        let edgeMargin: CGFloat = 25
        //set up sound button
        soundButton = SKSpriteNode(texture: soundButtonTexture)
        soundButton.position = CGPoint(x: size.width - soundButton.size.width / 2 - edgeMargin, y: soundButton.size.height / 2 + edgeMargin)
        addChild(soundButton)
        
        //set up high score node
        let defaults = UserDefaults.standard
        
        let highScore = defaults.integer(forKey: ScoreKey)
        
        highScoreNode.text = "\(highScore)"
        highScoreNode.fontSize = 90
        highScoreNode.verticalAlignmentMode = .top
        highScoreNode.position = CGPoint(x: size.width / 2, y: startButton.position.y - startButton.size.height / 2 - 50)
        highScoreNode.zPosition = 1
        addChild(highScoreNode)
    }
}
