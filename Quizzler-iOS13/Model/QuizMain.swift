//
//  QuizMain.swift
//  Quizzler-iOS13
//
//  Created by Jeffrey Vanelderen on 09/01/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct QuizMain {
    let questions: [Question] = [
        Question(text: "A slug's blood is green.", answer: "True"),
        Question(text: "Approximately one quarter of human bones are in the feet.", answer: "True"),
        Question(text: "The total surface area of two human lungs is approximately 70 square metres.", answer: "True"),
        Question(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: "True"),
        Question(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: "False"),
        Question(text: "It is illegal to pee in the Ocean in Portugal.", answer: "True"),
        Question(text: "You can lead a cow down stairs but not up stairs.", answer: "False"),
        Question(text: "Google was originally called 'Backrub'.", answer: "True"),
        Question(text: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: "True"),
        Question(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: "False"),
        Question(text: "No piece of square dry paper can be folded in half more than 7 times.", answer: "False"),
        Question(text: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: "True")
    ];
    var index = 0;
    var correctAnswers = 0;
    
    init() {}
    
    func getCurrentQuestion() -> Question? {
        if (self.index < self.questions.count) {
            return self.questions[self.index];
        }
        return nil;
    }
    
    func getProgress() -> Float {
        return Float(self.index + 1) / Float(self.questions.count);
    }
    
    mutating func answerQuestion(answer: String) -> Bool {
        let question = getCurrentQuestion();
        let isUserAnswerCorrect = answer == question?.answer;
        if (isUserAnswerCorrect) {
            correctAnswers += 1;
        }
        return isUserAnswerCorrect;
    }
    
    mutating func nextQuestion() {
        index+=1;
    }
    
    mutating func reset() {
        index = 0;
        correctAnswers = 0;
    }
}
