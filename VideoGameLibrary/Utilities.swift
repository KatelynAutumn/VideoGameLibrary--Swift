//
//  Utilities.swift
//  VideoGameLibrary
//
//  Created by Katelyn Pace on 9/5/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import Foundation


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
//my try
//func getBirthDate() -> Date {
//
//    print("Game restricted- Please enter your birthday (MM/dd/yyyy)")
//
//    let birthday = readLine()!
//    let birthdayDateFormatter = DateFormatter()
//    birthdayDateFormatter.dateFormat = "MM/dd/yyyy"
//    let birthdayDate = birthdayDateFormatter.date(from: birthday)
//
//    return birthdayDate!
//}

func getBirthDate() -> Date {
    var birthday: Date?
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yy"
    
    print("Please enter your birthday in mm/dd/yy format:")
    
    repeat {
        let input = readLine()!
        
        if let birthdayDate = dateFormatter.date(from: input) {
            birthday = birthdayDate
        } else {
            print("Please enter a valid date.")
        }
    } while birthday == nil
    
    return birthday!
}

func checkUserIs(yearsOld: Int, birthDate: Date) -> Bool {
    let birthDate = getBirthDate()
    let calendar = Calendar(identifier: .gregorian)
    let yearComponent = DateComponents(calendar: calendar, year: yearsOld)
    
    guard let specifiedBirthday = calendar.date(byAdding: yearComponent, to: birthDate) else { return false }
    
    return specifiedBirthday <= Date()
}



