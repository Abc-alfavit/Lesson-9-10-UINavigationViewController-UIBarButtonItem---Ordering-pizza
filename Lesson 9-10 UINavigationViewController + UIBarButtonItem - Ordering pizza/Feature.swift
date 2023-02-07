//
//  Feature.swift
//  Lesson 9-10 UINavigationViewController + UIBarButtonItem - Ordering pizza
//
//  Created by Валентин Ремизов on 03.02.2023.
//

import UIKit

class Feature: UIViewController {
    @IBOutlet private weak var namePizzaLabel: UILabel!
    @IBOutlet private weak var pizzaImageView: UIImageView!
    var namePizzaCurrent = String()
    var pizzaImageCurrent = UIImage()
    @IBOutlet private weak var baconSwitch: UISwitch!
    @IBOutlet private weak var chickenSwitch: UISwitch!
    @IBOutlet private weak var mozzarellaSwitch: UISwitch!
    @IBOutlet private weak var pineappleSwitch: UISwitch!
    @IBOutlet weak var oliveSwitch: UISwitch!
    @IBOutlet private weak var totalSumLabel: UILabel!
    private var totalSumFeature: Double = 15

    override func viewDidLoad() {
        super.viewDidLoad()
        namePizzaLabel.text = namePizzaCurrent
        pizzaImageView.image = pizzaImageCurrent
        calculateTotalPrice()
        baconSwitch.addTarget(self, action: #selector(baconPressed), for: .valueChanged)
        chickenSwitch.addTarget(self, action: #selector(chickenPressed), for: .valueChanged)
        mozzarellaSwitch.addTarget(self, action: #selector(mozzarellaPressed), for: .valueChanged)
        pineappleSwitch.addTarget(self, action: #selector(pineapplePressed), for: .valueChanged)
        oliveSwitch.addTarget(self, action: #selector(olivePressed), for: .valueChanged)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let order = segue.destination as? Order else {return}
        order.totalSum = totalSumFeature
        guard let namePizzaNextController = namePizzaLabel.text else {return}
        order.nameSelectedPizzaString = namePizzaNextController

        if baconSwitch.isOn { order.componentsArray.append("Bacon") }
        if chickenSwitch.isOn { order.componentsArray.append("Chicken") }
        if mozzarellaSwitch.isOn { order.componentsArray.append("Mozzarella cheese") }
        if pineappleSwitch.isOn { order.componentsArray.append("Pineapple") }
        if oliveSwitch.isOn { order.componentsArray.append("Olive") }
    }

    @objc private func baconPressed() {
        calculateComponents(type: .bacon)
    }

    @objc private func chickenPressed() {
        calculateComponents(type: .chicken)
    }

    @objc private func mozzarellaPressed() {
        calculateComponents(type: .mozzarella)
    }

    @objc private func pineapplePressed() {
        calculateComponents(type: .pineapple)
    }

    @objc private func olivePressed() {
        calculateComponents(type: .olive)
    }

    private enum componentsSelected {
        case bacon
        case chicken
        case mozzarella
        case pineapple
        case olive
    }

    private func calculateComponents (type: componentsSelected) {
        switch type {
        case .bacon: baconSwitch.isOn ? (totalSumFeature += 1.6) : (totalSumFeature -= 1.6)
        case .chicken: chickenSwitch.isOn ? (totalSumFeature += 2) : (totalSumFeature -= 2)
        case .mozzarella: mozzarellaSwitch.isOn ? (totalSumFeature += 0.8) : (totalSumFeature -= 0.8)
        case .pineapple: pineappleSwitch.isOn ? (totalSumFeature += 1.4) : (totalSumFeature -= 1.4)
        case .olive: oliveSwitch.isOn ? (totalSumFeature += 0) : (totalSumFeature -= 0)
        }
        calculateTotalPrice()
    }

    private func calculateTotalPrice() {
        totalSumLabel.text = "Total price: \(Double(round(100 * Double(totalSumFeature)) / 100)) $"
    }

}
