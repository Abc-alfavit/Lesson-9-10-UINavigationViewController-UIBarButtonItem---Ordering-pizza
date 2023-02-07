//
//  Order.swift
//  Lesson 9-10 UINavigationViewController + UIBarButtonItem - Ordering pizza
//
//  Created by Валентин Ремизов on 03.02.2023.
//

import UIKit

class Order: UIViewController {
    @IBOutlet private weak var totalListLabel: UILabel!
    @IBOutlet private weak var forPaymentLabel: UILabel!
    @IBOutlet private weak var cardSwitch: UISwitch!
    @IBOutlet private weak var applePayImageView: UIImageView!
    @IBOutlet private weak var cashSwitch: UISwitch!
    var totalSum : Double = 1000000
    var componentsArray : Array = [String]()
    var nameSelectedPizzaString = String()



    override func viewDidLoad() {
        super.viewDidLoad()
        totalListLabel.text = "1. Pizza \(nameSelectedPizzaString)"
        for (index, value) in componentsArray.enumerated() {
            totalListLabel.text = (totalListLabel.text ?? "") +
            "\n\(index+2). \(value)"
        }
        totalListLabel.sizeToFit()

        forPaymentLabel.text = "For payment: \(Double(round(100 * Double(totalSum)) / 100)) $"
        cardSwitch.addTarget(self, action: #selector(cardSwitchPressed), for: .valueChanged)
        cashSwitch.addTarget(self, action: #selector(cashSwitchPressed), for: .valueChanged)
        applePayImageView.isUserInteractionEnabled = true
        let applePayRecognizer = UITapGestureRecognizer(target: self, action: #selector(applePayPressed))
        applePayImageView.addGestureRecognizer(applePayRecognizer)
    }

    @objc private func cardSwitchPressed() {
        if cardSwitch.isOn == true {
            cashSwitch.isOn = false
            applePayImageView.isUserInteractionEnabled = true
            applePayImageView.isHidden = false
        } else {
            cashSwitch.isOn = true
            applePayImageView.isUserInteractionEnabled = false
            applePayImageView.isHidden = true
        }
    }

    @objc private func cashSwitchPressed() {
        if cashSwitch.isOn == true {
            cardSwitch.isOn = false
            applePayImageView.isUserInteractionEnabled = false
            applePayImageView.isHidden = true
        } else {
            cardSwitch.isOn = true
            applePayImageView.isUserInteractionEnabled = true
            applePayImageView.isHidden = false
        }
    }

    @objc private func applePayPressed() {
        let alertController = UIAlertController(title: "Thank's for order",
                                                message: "Wait your pizza during at 15 minutes, have a good day.",
                                                preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Thank's, and you.",
                                        style: .default) {_ in
            /*
            Способ возврата на главный экран: После нажатия кнопки навигейшн нас вернёт на первый экран (рут контроллер)
            self.navigationController?.popToRootViewController(animated: true)
             */

            //Способ возврата на нужный нам контроллер
            guard let viewControllers = self.navigationController?.viewControllers else {return}
            for vc in viewControllers {
                if vc is Food {
                    self.navigationController?.popToViewController(vc, animated: true)
                }
            }
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
}
