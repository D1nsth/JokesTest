//
//  ApiView.swift
//  JokesTest
//
//  Created by Никита on 30.12.2019.
//  Copyright © 2019 Nikita Ananev. All rights reserved.
//

import UIKit

class ApiView: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.delegate = self
        let url = URL(string: "http://www.icndb.com/api")
        webView.loadRequest(URLRequest(url: url!))
        
    }
    
}
