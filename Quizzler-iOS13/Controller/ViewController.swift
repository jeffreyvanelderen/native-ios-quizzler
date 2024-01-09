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
    
    var quizMain = QuizMain();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBar.setProgress(0.0, animated: false);
        setQuestionText();
    }

    // Triggered by either true or false
    @IBAction func onAnswerPress(_ sender: UIButton) {
        let isUserAnswerCorrect = quizMain.answerQuestion(answer: sender.currentTitle!);
        showQuestionResultOnButton(button: sender, isUserAnswerCorrect: isUserAnswerCorrect)
        
        progressBar.setProgress(quizMain.getProgress(), animated: true);
        quizMain.nextQuestion();
        setQuestionText();
        
        // Finish
        if (quizMain.index == quizMain.questions.count) {
            // Done. Finish up
            displayAlertWithMessage(message: "Done! You got \(quizMain.correctAnswers)/\(quizMain.questions.count)");
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.reset();
            }
        }
    }
    
    private func setQuestionText() {
        let question = quizMain.getCurrentQuestion();
        if (question != nil) {
            questionLabel.text = question!.text
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
        quizMain.reset();
        progressBar.setProgress(0.0, animated: true);
        setQuestionText();
    }
    
}

