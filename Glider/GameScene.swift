//
//  GameScene.swift
//  Glider
//
//  Created by Timofey on 13.06.24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    let verticalPipeGap = 150.0
    
    var planer: SKSpriteNode!
    var blueSkyColor: SKColor!
    var pipeTextureUp: SKTexture!
    var pipeTextureDown: SKTexture!
    var resetPipes: SKAction!
    var movingBG: SKNode!
    var obstacles: SKNode!
    var canRestart = Bool()
    var scoreLabelNode = SKLabelNode()
    var playerScore = NSInteger()
    
//    let planerCategory
//    let worldCategory
//    let obstaclesCategory
//    let scoreCategory
//
    override func didMove(to view: SKView) {
        
        canRestart = true
        //физика игры и предметов
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -5.0)
        self.physicsWorld.contactDelegate = self
        // задний фон
        blueSkyColor = SKColor(red: 255, green: 255.0, blue: 255.0, alpha: 1.0)
        self.backgroundColor = blueSkyColor
        
        //перемещение заднего фона
        movingBG = SKNode()
        self.addChild(movingBG)
        obstacles = SKNode()
        self.addChild(obstacles)
        
        //земля при ударе об которую будет вылетать gameover
        let groundTexture = SKTexture(imageNamed: "background1")
        groundTexture.filteringMode = .nearest //означает, что каждый пиксель будет отображаться с использованием ближайшей точки в текстуре. Этот режим работает быстрее, но результаты могут быть пикселизированными
        let moveAction = SKAction.move(by: CGVector(dx: -groundTexture.size().width * 2.0, dy: 0), duration: TimeInterval(0.02 * groundTexture.size().width * 2.0))
        

    }
    
}


