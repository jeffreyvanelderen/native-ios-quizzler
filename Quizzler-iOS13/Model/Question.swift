//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Jeffrey Vanelderen on 09/01/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String;
    let answer: String;
    
    init(text: String, answer: String) {
        self.text = text
        self.answer = answer
    }
}
