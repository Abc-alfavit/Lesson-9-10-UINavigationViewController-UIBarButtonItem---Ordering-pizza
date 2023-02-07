//
//  Food.swift
//  Lesson 9-10 UINavigationViewController + UIBarButtonItem - Ordering pizza
//
//  Created by Валентин Ремизов on 05.02.2023.
//

import UIKit

class Food: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Скрываем кнопку назад
        navigationItem.hidesBackButton = true
    }

    @IBAction private func sushiPressed(_ sender: Any) {
        showAlertError()
    }

    @IBAction private func osetianPiePressed(_ sender: Any) {
        showAlertError()
    }

    private func showAlertError() {
        let alertController = UIAlertController(title: "Sorry, something going wrong", message: "We not haven't added it to our menu", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }

    @IBAction private func feedbackPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Your feedback", message: "Hello, write us your feedback", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel)
        alertController.addTextField()
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }

}
