//
//  JokesTableView.swift
//  JokesTest
//
//  Created by Никита on 30.12.2019.
//  Copyright © 2019 Nikita Ananev. All rights reserved.
//

import UIKit

class JokesTableView: UIViewController {

    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    @IBOutlet weak var jokesTable: UITableView!
    @IBOutlet weak var countTextView: UIView!
    @IBOutlet weak var countTextFiled: UITextField!
    @IBOutlet weak var loadButton: UIButton!
        
    let reuseIdCell = "jokesTableViewCell"
    
    var jokes: [Joke] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        jokesTable.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdCell)
        
        elementsLayerConfig()
        registerForKeyboardNotification()
        hideKeyboard()
    }
    
    deinit {
        removeKeyboardNotification()
    }
    
    func elementsLayerConfig() {
        loadButton.layer.cornerRadius = 8
        
        countTextView.layer.borderWidth = 1
        countTextView.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        countTextView.layer.cornerRadius = 8
    }
    
    func presentAlertControllerWithTitle(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancel)
        
        present(alertController, animated: true)
    }
    
    func loadActivityStartAnimate(_ start: Bool) {
        (start) ? loadIndicator.startAnimating() : loadIndicator.stopAnimating()
        
        let alpha: CGFloat = (start) ? 0.0 : 1.0
        UIView.animate(withDuration: 0.2) {
            self.jokesTable.alpha = alpha
        }
    }

}

