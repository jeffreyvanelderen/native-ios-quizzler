//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var index = 0;
    let questions: [Question] =
    [
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
    var correctAnswers = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBar.setProgress(0.0, animated: false);
        setQuestionText();
    }

    // Triggered by either true or false
    @IBAction func onAnswerPress(_ sender: UIButton) {
        let question = questions[index];

        let userAnswer = sender.currentTitle;

        let isUserAnswerCorrect = userAnswer == question.answer;
        if (isUserAnswerCorrect) {
            correctAnswers += 1;
        }
        showQuestionResultOnButton(button: sender, isUserAnswerCorrect: isUserAnswerCorrect)
        
        progressBar.setProgress(Float(index + 1) / Float(questions.count), animated: true)
        index += 1;
        setQuestionText();
        
        // Finish
        if (index == questions.count) {
            // Done. Finish up
            displayAlertWithMessage(message: "Done! You got \(correctAnswers)/\(questions.count)");
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.reset();
            }
        }
    }
    
    private func setQuestionText() {
        if (index < questions.count) {
            questionLabel.text = questions[index].text;
        }
    }
    
    private func showQuestionResultOnButton(button: UIButton, isUserAnswerCorrect: Bool) {
        button.backgroundColor = isUserAnswerCorrect ? .green : .red;
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            button.backgroundColor = .clear;
        }
    }
    
    private func displayAlertWithMessage(message: String) {
        let alertController = UIAlertController(
            title: "Alert",
            message: "",
            preferredStyle: UIAlertController.Style.alert
        );
        alertController.addAction(UIAlertAction(title: "Okay", style: .default));
        
        alertController.message = message;
        
        present(alertController, animated: true, completion: nil);
    }
    
    private func reset() {
        // Start again
        index = 0;
        correctAnswers = 0;
        progressBar.setProgress(0.0, animated: true);
        setQuestionText();
    }
    
}

