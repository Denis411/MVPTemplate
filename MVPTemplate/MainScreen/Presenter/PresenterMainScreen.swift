//
//  PresenterMainScreen.swift
//  MVPTemplate
//
//  Created by I am the owner on 12/11/21.
//

import UIKit

typealias mainScreenPresenterDelegate = PresenterMainScreenProtocol & UIViewController

final class PresenterMainScreen {
    
    private weak var delegate: mainScreenPresenterDelegate?
    
    internal func setText(text: String) {
        UserDefaults.standard.setValue(text, forKey: "text")
        guard let text = UserDefaults.standard.string(forKey: "text") else {
            return
        }
        
        delegate?.updateWord(text: text)
    }
    
    internal func setUpViewDelegate(delegate: mainScreenPresenterDelegate) {
        self.delegate = delegate
    }
}

protocol PresenterMainScreenProtocol: AnyObject {
    func updateWord(text: String)
}
