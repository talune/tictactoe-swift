//
//  ViewController.swift
//  tictactoe
//
//  Created by Lucille on 11/12/14.
//  Copyright (c) 2014 Lucille. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var turnCount = 1
    
    var winner = 0
    var winnerName = ["No one", "Noughts", "Crosses"]
    
    // 0 = empty, 1 = nought, 2 = cross
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    @IBAction func playAgainPressed(sender: AnyObject) {
        turnCount = 1
        winner = 0
        gameState = [0,0,0,0,0,0,0,0,0]
        message.center = CGPointMake(message.center.x - 400, message.center.y)
        message.alpha = 0
        playAgain.center = CGPointMake(playAgain.center.x - 400, playAgain.center.y)
        playAgain.alpha = 0
        var button: UIButton
        for var i = 0; i < 9; ++i {
            button = view.viewWithTag(i) as UIButton
            button.setImage(nil, forState: .Normal)
        }
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        var image = UIImage()
        if (gameState[sender.tag] == 0 && winner == 0) {
            
            if (turnCount%2 == 0) {
                image = UIImage(named: "cross.png")!
                gameState[sender.tag] = 2
            } else {
                image = UIImage(named: "nought.png")!
                gameState[sender.tag] = 1
            }
            sender.setImage(image, forState: .Normal)
           
            for combo in winningCombinations {
                if (gameState[combo[0]] == gameState[combo[1]] && gameState[combo[0]] == gameState[combo[2]] && gameState[combo[0]] != 0) {
                    winner = gameState[combo[0]]
                }
            }
            
            if (winner != 0) {
                message.text = "\(winnerName[winner]) win!"
                UIView.animateWithDuration(0.4, animations: {
                    self.message.alpha = 1
                    self.message.center = CGPointMake(self.message.center.x + 400, self.message.center.y)
                })
                UIView.animateWithDuration(1.5, animations: {
                    self.playAgain.alpha = 1
                    self.playAgain.center = CGPointMake(self.playAgain.center.x + 400, self.playAgain.center.y)
                })
            } else {
                ++turnCount
                if turnCount == 10 {
                    message.text = "No one wins :("
                    UIView.animateWithDuration(0.4, animations: {
                        self.message.alpha = 1
                        self.message.center = CGPointMake(self.message.center.x + 400, self.message.center.y)
                    })
                    UIView.animateWithDuration(1.5, animations: {
                        self.playAgain.alpha = 1
                        self.playAgain.center = CGPointMake(self.playAgain.center.x + 400, self.playAgain.center.y)
                    })
                }
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        message.center = CGPointMake(message.center.x - 400, message.center.y)
        playAgain.center = CGPointMake(playAgain.center.x - 400, playAgain.center.y)
    }
}

