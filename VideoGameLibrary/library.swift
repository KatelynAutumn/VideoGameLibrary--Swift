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
    private var gameArray: [Game] = [Game(title: "Skyrim", rating: "T"), Game(title: "Fallout", rating: "T"), Game(title: "Mist", rating: "T")]
    
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
        
        
        print("Please enter the rating for the game (E,T,M")
        
        var rating = readLine()
        
        while rating == nil || rating == "" {
            print("Invalid entry, please enter a title")
            rating = readLine()
        }
        
        let newGame = Game(title: newGameTitle!, rating: rating!)
        gameArray.append(newGame)
    }
    
    
    
    func removeGame() {
        //we need to go through our array and list out the title of the game as well as its index. the user can then enter an index and we will remove the game at each index.
        print("Please enter the number of the game you wish to remove")
        
        for index in 0..<gameArray.count {
            print("\(index). \(gameArray[index].title) \(gameArray[index].rating)")
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
                print("Name: \(game.title) , Rating: \(game.rating)")
                
            }
        }
    }
    
    //we need to go through our game array
    //check to see if each game is checked in or not.
    //if it isnt, print out the title of the game
    
    
    
    
    
    func listUnavailableGames() {
        for game in gameArray {
            if !game.checkedIn {
                print(game.title , game.rating)
                if let dueDate = game.dueDate {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy" //setting the format we want to use for the dateFormatter
                    print("This game is due back on \(dateFormatter.string(from: dueDate))")
                    
                }
            }
        }
        //we need to go through our game array and check to see if each game is checked out or not. if it isnt, print out the title of the game
    }
    
    //this takes all the games that have been checked out
    
    func getAvailableGames() -> [Game] {
        var availableGames = [Game]()
        
        for game in gameArray {
            if game.checkedIn {
                availableGames.append(game)
            }
        }
        return availableGames
    }
    
    
    
    func getUnavailableGames() -> [Game] {
        var unavailableGames = [Game]()
        
        for game in gameArray {
            if !game.checkedIn {
                unavailableGames.append(game)
            }
        }
        return unavailableGames
    }
    
    
    
    
    
    func checkGameOut() {
        
        let currentCalendar = Calendar.current
        let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date()) //generates a new date... added 14 days to current date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM, dd, YYYY"
        
        
        let availableGames = getAvailableGames()
        
        print("Please enter the number of the game you wish to check out")
        
        
        guard availableGames.count > 0 else {
            print("There are no games available to check in")
            return
        }
        
        
        for index in 0..<availableGames.count {
            if availableGames[index].checkedIn {
                print("\(index). \(availableGames[index].title) \(availableGames[index].rating)")
            }
        }
        
        
        var index : Int? = nil
        
        repeat {
            var userInput = Int(readLine()!)
            
            while userInput == nil {
                print("Invalid input. Please enter a usable index")
                userInput = Int(readLine()!)
            }
            
            if userInput! >= 0 && userInput! < availableGames.count {
                index = userInput!
            } else {
                print("Please enter a valid index.")
                continue
            }
            
        } while index == nil
        
        
        let game = availableGames[index!]
        
        if game.rating == "T" {
            let birthday = getBirthDate()
            guard checkUserIs(yearsOld: 13, birthDate: birthday) else {
                print("Sorry you must be at least 13 to check out this game.")
                return
            }
        } else if game.rating == "M" {
            let birthday = getBirthDate()
            guard checkUserIs(yearsOld: 18, birthDate: birthday) else {
                print("Sorry you must be at least 18 to check out this game.")
                return
            }
        }
        
        availableGames[index!].checkedIn = false
        
        gameArray[index!].dueDate = dueDate //set the due date of game being checked out to the new date
        
        print("This game is due back on \(dateFormatter.string(from: dueDate!))")
        
    }
    
    
    
    
    func checkGameIn() {
        
        let unavailableGames = getUnavailableGames()
        
        guard unavailableGames.count > 0 else {
            print("There are no games available to check in")
            return
        }
        
        print("Please enter the number of the game you wish to check in")
        
        
        for index in 0..<unavailableGames.count {
            print("\(index). \(unavailableGames[index].title) \(unavailableGames[index].rating)")
        }
        
        
        var index : Int? = nil
        
        repeat {
            
            var userInput = Int(readLine()!)
            
            while userInput == nil {
                print("Invalid input. Please enter a usable index")
                userInput = Int(readLine()!)
            }
            if userInput! >= 0 && userInput! <
                unavailableGames.count {
                index = userInput!
            }  else {
                print("Please enter a valid index.")
                continue
            }
            
            
        } while index == nil
        
        unavailableGames[index!].checkedIn = true
        
        gameArray[index!].dueDate = nil //no due date needed since checking in
    }
    
}


