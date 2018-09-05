//
//  menu.swift
//  VideoGameLibrary
//
//  Created by Katelyn Pace on 8/30/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import Foundation


class Menu {
    
    var shouldQuit = false
    let library = Library() //create a new instance of the library class
    
    
    func go() {
        
        help()
        
        repeat{
            
       var input = getInput()
   
        while validateInput(input) == false {
                (print("Invalid input"))
                input = getInput()
            }
            
            handleInput(input)
            
    } while !shouldQuit
  }
    
    
    func help() {
        print("""
        
        Menu:
        Please enter a number
        1. Add Game
        2. Remove Game
        3. List Available Games
        4. Check-Out Game
        5. Check-In Game
        6. List Checked Out Games
        7. Help
        8. Quit

        """)
        
    }
    
    func handleInput(_ input: String) {
        
        switch input {
        case "1": // in place of if input put switch with cases
            library.addGame()
            help()
        case "2":
            library.removeGame()
            help()
        case "3":
            library.listAvailableGames()
            help()
        case "4":
            library.checkGameOut()
            help()
        case "5":
            library.checkGameIn()
            help()
        case "6":
            library.listUnavailableGames()
        case "7":
            help()
        case "8":
            quit()
        default:
            break
        }
        
    }
    
    func quit() {
        shouldQuit = true
        print("Thanks for using the video game library")
    }

}

func validateInput(_ input: String) -> Bool {
    let menuOptions = Array(1...8)
    
    guard let number = Int(input) else { return false }
    
    return menuOptions.contains(number)
}


func getInput() -> String {
    var input: String? = nil
    
    repeat{
       let line =
        readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if line != "" {
            input = line
        } else {
            print("Invalid input.")
        }
    } while input == nil
    
    return input!
}


