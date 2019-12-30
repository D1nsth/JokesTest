//
//  JokesViewActions.swift
//  JokesTest
//
//  Created by Никита on 30.12.2019.
//  Copyright © 2019 Nikita Ananev. All rights reserved.
//

import UIKit

extension JokesTableView {
    
    @IBAction func loadButtonTapped(_ sender: UIButton) {
        let countOfJokes = Int(countTextFiled.text!)
        
        if countOfJokes == nil {
            presentAlertControllerWithTitle("Error", message: "Incorrect input count of jokes. Try again.")
            
        } else {
            loadActivityStartAnimate(true)
            
            JokesNetService.getJokesData(countJokes: countOfJokes!) { (response, error) in
                if error != nil {
                    if let e = error as? URLError, e.code == .notConnectedToInternet {
                        self.presentAlertControllerWithTitle("Error", message: "No internet connection!")
                        
                    } else {
                        self.presentAlertControllerWithTitle("Error", message: error!.localizedDescription)
                    }
                    
                } else {
                    DispatchQueue.main.async {
                        self.jokes = response!.result
                        self.jokesTable.reloadData()
                        
                        self.loadActivityStartAnimate(false)
                    }
                }
            }
        }
        
    }
    
}
