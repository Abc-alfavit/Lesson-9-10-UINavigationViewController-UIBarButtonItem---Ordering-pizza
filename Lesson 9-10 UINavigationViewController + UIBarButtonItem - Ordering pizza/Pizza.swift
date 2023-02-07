//
//  Pizza.swift
//  Lesson 9-10 UINavigationViewController + UIBarButtonItem - Ordering pizza
//
//  Created by Валентин Ремизов on 03.02.2023.
//

import UIKit

class Pizza: UIViewController {
    
    @IBOutlet private weak var pepperoniLabel: UILabel!
    @IBOutlet private weak var pepperoniImageView: UIImageView!
    @IBOutlet private weak var sicilianLabel: UILabel!
    @IBOutlet private weak var sicilianImageView: UIImageView!
    @IBOutlet private weak var newyorkLabel: UILabel!
    @IBOutlet private weak var newyorkImageView: UIImageView!
    @IBOutlet private weak var mixLabel: UILabel!
    @IBOutlet private weak var mixImageView: UIImageView!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let feature = segue.destination as? Feature else {return}
        if segue.identifier == "Pepperoni" {
            guard let pepperoniText = pepperoniLabel.text else {return}
            guard let pepperoniImage = pepperoniImageView.image else {return}
            feature.pizzaImageCurrent = pepperoniImage
            feature.namePizzaCurrent = pepperoniText
        } else if segue.identifier == "Sicilian" {
            guard let sicilianText = sicilianLabel.text else {return}
            guard let sicilianImage = sicilianImageView.image else {return}
            feature.namePizzaCurrent = sicilianText
            feature.pizzaImageCurrent = sicilianImage
        } else if segue.identifier == "Newyork" {
            guard let newyorkText = newyorkLabel.text else {return}
            guard let newyorkImage = newyorkImageView.image else {return}
            feature.pizzaImageCurrent = newyorkImage
            feature.namePizzaCurrent = newyorkText
        } else {
            guard let mixText = mixLabel.text else {return}
            guard let mixImage = mixImageView.image else {return}
            feature.pizzaImageCurrent = mixImage
            feature.namePizzaCurrent = mixText
        }
    }
}
