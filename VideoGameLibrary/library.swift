//
//  library.swift
//  VideoGameLibrary
//
//  Created by Katelyn Pace on 9/4/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import Foundation


// this class will handle storing our array of games. it will also handle all the interactions with that array

class Library {
    //an array array of Game objects
    private var gameArray: [Game] = [Game(title: "Skyrim"), Game(title: "Fallout"), Game(title: "Mist")]
    
    func addGame() {
        //when we make a game, we need a title for the game.
        //we need to be able to get user input for the title
        //we need to create a new game object using that title
        //we need to be able to add the game to our gameArray
        //placeholder since we dont have any way to list our games yet
        //need input validation to make sure the gameTitle is not Nil
        print("Please enter the title of the name you wish to add")
        var newGameTitle = readLine()
        while newGameTitle == nil || newGameTitle == "" {
            print("Invalid entry, please enter a title")
            newGameTitle = readLine()
        }
        let newGame = Game(title: newGameTitle!)
        gameArray.append(newGame)
    }
    
    
    
    func removeGame() {
    //we need to go through our array and list out the title of the game as well as its index. the user can then enter an index and we will remove the game at each index.
        print("Please enter the number of the game you wish to remove")
        
        for index in 0..<gameArray.count {
           print("\(index). \(gameArray[index].title)")
        }
        
        
        //in case user enters something other than an anvailable Int
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Invalid input. Please enter a usable index")
            userInput = Int(readLine()!)
            
            gameArray.remove(at: userInput!)
        }
    }
    
    
    
    
    func listAvailableGames() {
        
        
        for game in gameArray {
            if game.checkedIn {
                print(game.title)
            }
        }
    }
        
        //we need to go through our game array
        //check to see if each game is checked in or not.
        //if it isnt, print out the title of the game
    
    
    
    
    
    func listUnavailableGames() {
        for game in gameArray {
            if !game.checkedIn {
                print(game.title)
                if let dueDate = game.dueDate {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy" //setting the format we want to use for the dateFormatter
                    print("This game is due back on \(dateFormatter.string(from: dueDate))")
                    
                }
            }
        }
        //we need to go through our game array and check to see if each game is checked out or not. if it isnt, print out the title of the game
    }
   
    
    
    
    func checkGameOut() {
    
                print("Please enter the number of the game you wish to check out")
        for index in 0..<gameArray.count {
            print("\(index). \(gameArray[index].title)")
        }
    
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Invalid input. Please enter a usable index")
            userInput = Int(readLine()!)
        }
        
        gameArray[userInput!].checkedIn = false
        
        //setting a two week due date
        let currentCalendar = Calendar.current
        let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date()) //generates a new date... added 14 days to current date
        
        gameArray[userInput!].dueDate = dueDate //set the due date of game being checked out to the new date
        
    }
    
   
    
    
    func checkGameIn() {
        
        print("Please enter the number of the game you wish to check in")
        
        for index in 0..<gameArray.count {
            print("\(index). \(gameArray[index].title)")
        }
        
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Invalid input. Please enter a usable index")
            userInput = Int(readLine()!)
        }
        
        gameArray[userInput!].checkedIn = true
        
        gameArray[userInput!].dueDate = nil //no due date needed since checking in
    }


    
}


