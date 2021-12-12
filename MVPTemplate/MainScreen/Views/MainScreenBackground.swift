//
//  MainScreenBackground.swift
//  MVPTemplate
//
//  Created by I am the owner on 12/12/21.
//

import UIKit

final class MainScreenBackground: UIView {
    private var button: UIButton!
    private var textField: UITextField!
    private var label: UILabel!
    private var closure: (() -> Void)?
    
    init() {
        super.init(frame: .zero)
        setUpButton()
        setUpField()
        setUpLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpButton()
        setUpField()
        setUpLabel()
    }
//    MARK: - Constraint methods
    
    private func setUpButton() {
        //      Constraints
        button = UIButton()
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [ button.heightAnchor.constraint(equalToConstant: 75),
              button.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
              button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
              button.centerYAnchor.constraint(equalTo: self.centerYAnchor) ])
        //      Presentation
        button.setTitle("Press to save", for: .normal)
        button.layer.backgroundColor = UIColor.red.cgColor
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    private func setUpField() {
        textField = UITextField()
        self.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [ textField.heightAnchor.constraint(equalToConstant: 50),
              textField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
              textField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
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
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [ label.heightAnchor.constraint(equalToConstant: 50),
              label.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
              label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
              label.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -50)
            ])
        label.layer.backgroundColor = UIColor.systemGray.cgColor
        label.textAlignment = .center
    }
// MARK: - Logic methods
    
    @objc private func buttonAction() {
        guard let closureNotNil = closure else { return }
        closureNotNil()
    }
    
    internal func setUpButtonAction(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    internal func setUpLabelText(text: String) {
        self.label.text = text
    }
    
    internal func getTextFieldText() -> String {
        guard let text = textField.text else { return "No text was entered." }
        return text
    }
}
