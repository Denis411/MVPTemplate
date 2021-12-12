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
    private var text: String?
    
    override func loadView() {
        backgroundView = MainScreenBackground()
        view = backgroundView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presetner.setUpViewDelegate(delegate: self)
        backgroundView.dataSource = self
        view.backgroundColor = .systemGray
        backgroundView.setUpButtonAction(closure: setUpButtonAction)
    }
    
    private func setUpButtonAction() {
        let text = backgroundView.getTextFieldText()
        presetner.setText(text: text)
    }
    
    func updateWord(text: String) {
        self.text = text
    }
}

extension MainScreen: MainScreenBackgroundDataSource {
    func textForLabel(label: UILabel) -> String {
        guard let text = text else { return "" }
        return text
    }
}
