//
//  PresenterMainScreen.swift
//  MVPTemplate
//
//  Created by I am the owner on 12/11/21.
//

import UIKit

typealias mainScreenPresenterDelegate = PresenterMainScreenProtocol & UIViewController

class PresenterMainScreen {
    
    private weak var delegate: mainScreenPresenterDelegate?
    
    func setText(text: String) {
        UserDefaults.standard.setValue(text, forKey: "text")
    }
    
    func getText() {
        guard let text = UserDefaults.standard.string(forKey: "text") else {
            return
        }
        
        delegate?.updateWord(text: text)
    }
    
    func setUpViewDelegate(delegate: mainScreenPresenterDelegate) {
        self.delegate = delegate
    }
}

protocol PresenterMainScreenProtocol: AnyObject {
    func updateWord(text: String)
}
