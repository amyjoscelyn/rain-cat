//
//  GameViewController.swift
//  RainCat
//
//  Created by Amy Joscelyn on 10/3/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
//        let sceneNode = GameScene(size: view.frame.size) //for when we want to show the game right away
        let sceneNode = MenuScene(size: view.frame.size) //to show the menu first
        
        if let view = self.view as! SKView? {
            view.presentScene(sceneNode)
            view.ignoresSiblingOrder = true
            
            view.showsPhysics = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
        SoundManager.sharedInstance.startPlaying()
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
