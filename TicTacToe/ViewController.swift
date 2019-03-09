//
//  ViewController.swift
//  TicTacToe
//
//  Created by Supannee Mutitanon on 8/3/19.
//  Copyright © 2019 Supannee Mutitanon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //1 = o , 2 = x
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    var activePlayer = 1
    var activeGame = true
    var state = [0,0,0,0,0,0,0,0,0] //0 = empty, 1=o ,2=x
    var winningCombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x-500, y: playAgainButton.center.y)
    }

    @IBAction func playAgainPressed(_ sender: Any) {
        activeGame = true
        activePlayer = 1
        state = [0,0,0,0,0,0,0,0,0]
        var button: UIButton
        
        for i in 1..<10{
            if let button = view.viewWithTag(i) as? UIButton{
                button.setImage(nil,for:[])
            }
        }
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x-500, y: playAgainButton.center.y)

    }
    @IBAction func buttonPressed(_ sender: AnyObject) {
        var activePosition = sender.tag-1
        
        if state[activePosition] == 0 && activeGame{
            
            state[activePosition] = activePlayer
            
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "nought.png"),for: [])
                activePlayer = 2
            }else{
                sender.setImage(UIImage(named: "cross.png"),for: [])
                activePlayer = 1
            }
            
            for combination in winningCombination {
                if state[combination[0]] != 0 && state[combination[0]] == state[combination[1]] && state[combination[1]] == state[combination[2]]{
                        activeGame = false
                        winnerLabel.isHidden = false
                        playAgainButton.isHidden = false
                        print(state[combination[0]])
                        print("hereeeeee")
                    
                    if state[combination[0]] == 1 {
                        winnerLabel.text = "O HAS WON!!!!"
                    }else{
                        winnerLabel.text = "X HAS WON!!!"
                    }
                    
                    UIView.animate(withDuration: 1){
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x+500, y: self.winnerLabel.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x+500, y: self.playAgainButton.center.y)
                    }
                }
            }
        }
        
        
        
        print("press \(sender.tag)" )
    }
    
}

