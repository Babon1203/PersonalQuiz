//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.08.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet weak var animalDefinitionLabel: UILabel!
    @IBOutlet weak var animalTypeLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
        calcResultAnswers()
    } 
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func calcResultAnswers() {
        let answersWitchResult = answers.map { ($0.animal, 0) }
        let calcAnswers = Dictionary(answersWitchResult, uniquingKeysWith: +)
        let sortedAnswers = calcAnswers.sorted(by: {$0.value > $1.value})

        guard let calculatedAnimalInAnswers = sortedAnswers.first?.key else { return }
        updateUI(witch: calculatedAnimalInAnswers)
    }
    
    private func updateUI(witch animal: Animal) {
        animalTypeLabel.text = "Вы - \(animal.rawValue)"
        animalDefinitionLabel.text = "\(animal.definition)"
    }
}
