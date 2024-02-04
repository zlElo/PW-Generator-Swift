//
//  Generate_pw.swift
//  PW-Generator
//
//  Created by zlElo on 04.02.24.
//

import Foundation

func Generate_password(useLetters: Bool, useNumbers: Bool, useSpecial: Bool, speed: Int) -> String{
    print("[log] generate password...")
    var items = ""
    var pw = ""
    
    // logic add items for generating
    if (useLetters == true) {
        items.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvw")
    }
    if (useNumbers == true) {
        items.append("1234567890")
    }
    if (useSpecial == true) {
        items.append("!§$%&/()=?+*#'.,;:-_><^'")
    }
    
    // Generate password
    for _ in 1...speed {
        let character = items.randomElement()!
        pw.append(character)
    }
    
    print("Generated password: " + pw)
    return(pw)
}
