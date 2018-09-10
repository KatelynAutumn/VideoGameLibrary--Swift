//
//  game.swift
//  VideoGameLibrary
//
//  Created by Katelyn Pace on 9/4/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import Foundation



// this is the data model that represents our games that will be stored in the library


class Game {
    //this will store the title of the game
    var title: String
    //setting to true by default, since whenever we create a new game we will assume its checked in
    var checkedIn = true
    //This is optional because if a game isnt checked out it wont have a due date
    var dueDate: Date?
    var rating: String
    //since checked in has a default value and dueDate is an optional, the only value that we have to initialize is the title
    init(title: String, rating: String) {
    self.title = title
    self.rating = rating    }
}








