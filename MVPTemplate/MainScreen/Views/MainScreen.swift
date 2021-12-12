//
//  ViewController.swift
//  MVPTemplate
//
//  Created by I am the owner on 12/11/21.
//

import UIKit

class MainScreen: UIViewController, PresenterMainScreenProtocol {
    private var presetner = PresenterMainScreen()
    var backgroundView: MainScreenBackground!
    
    override func loadView() {
        backgroundView = MainScreenBackground()
        view = backgroundView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presetner.setUpViewDelegate(delegate: self)
        view.backgroundColor = .systemGray
        backgroundView.setUpButtonAction(closure: setUpButtonAction)
    }
    
    private func setUpButtonAction() {
        let text = backgroundView.getTextFieldText()
        presetner.setText(text: text)
        presetner.getText()
    }
    
    func updateWord(text: String) {
        backgroundView.setUpLabelText(text: text)
    }
}
