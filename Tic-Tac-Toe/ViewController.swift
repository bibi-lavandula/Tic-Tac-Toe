//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Shin Yun Ong on 2020-12-30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    var board = [String]()
    var currentPlayer = ""
    
    var rules = [[0,1,2],[3,4,5],[6,7,8],
                 [0,3,6],[1,4,7],[2,5,8],
                 [0,4,8],[2,4,6]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBoard()
        
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let index = buttons.firstIndex(of: sender)!
        
        if !board[index].isEmpty {
            return
        }
        
        if currentPlayer == "X" {
            sender.setTitle("X", for: .normal)
            currentPlayer = "O"
            board[index] = "X"
        } else {
            sender.setTitle("O", for: .normal)
            currentPlayer = "X"
            board[index] = "O"
        }
        
        whoWins()
        
    }
    
   func whoWins(){
        
        for rule in rules {
            let player1 = board[rule[0]]
            let player2 = board[rule[1]]
            let player3 = board[rule[2]]
            
            if player1 == player2,
               player2 == player3,
               !player1.isEmpty {
                showAlert(msg: "Player \(player1) is the winner!")
                return
            }
        }
    
        if !board.contains(""){
        showAlert(msg: "It's a tie! Try again :)")
    }
    
        
    }
    
    //added msg in parameter to be able to take in player
    func showAlert(msg: String){
        let alert = UIAlertController (title: "** Game ends **", message: msg, preferredStyle: .alert)
        let action = UIAlertAction (title: "OK", style: .default) { _ in
            self.boardReset()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //Clear and start blank board
    func boardReset(){
        board.removeAll()
        loadBoard()
        
        for button in buttons {
            button.setTitle(nil, for: .normal)
        }
    }
    
    //Blank board
    func loadBoard(){
        for _ in 0..<buttons.count {
            board.append("")
        }
        
    }
    
}

