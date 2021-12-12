//
//  ViewController.swift
//  MVPTemplate
//
//  Created by I am the owner on 12/11/21.
//

import UIKit

class ViewController: UIViewController, PresenterMainScreenProtocol {
    private var presetner = PresenterMainScreen()
    //    UI
    var button: UIButton!
    var textField: UITextField!
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presetner.setUpViewDelegate(delegate: self)
        view.backgroundColor = .systemGray
        setUpButton()
        setUpField()
        setUpLabel()
        presetner.getText()
    }
    
    private func setUpButton() {
        //      Constraints
        button = UIButton()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [ button.heightAnchor.constraint(equalToConstant: 75),
              button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
              button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
              button.centerYAnchor.constraint(equalTo: view.centerYAnchor) ])
        //      Presentation
        button.setTitle("Press to save", for: .normal)
        button.layer.backgroundColor = UIColor.red.cgColor
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    private func setUpField() {
        textField = UITextField()
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [ textField.heightAnchor.constraint(equalToConstant: 50),
              textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
              textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
              textField.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -50) ])
        textField.layer.backgroundColor = UIColor.yellow.cgColor
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textColor = .black
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.rightView = leftView
        textField.rightViewMode = .always
    }
    
    private func setUpLabel() {
        label = UILabel()
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [ label.heightAnchor.constraint(equalToConstant: 50),
              label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
              label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
              label.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -50)
            ])
        label.layer.backgroundColor = UIColor.systemGray.cgColor
        label.textAlignment = .center
    }
    
    @objc private func buttonAction() {
        guard let text = textField.text else { return }
        presetner.setText(text: text)
        presetner.getText()
    }
    
    func updateWord(text: String) {
        label.text = text
    }
}
