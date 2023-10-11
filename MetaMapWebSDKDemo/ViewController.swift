//
//  ViewController.swift
//  MetaMapWebSDKDemo
//
//  Created by Avo Sukiasyan on 11.10.23.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView?
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
      
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 0.4
        textField.layer.borderColor = UIColor.black.cgColor
        
        button.backgroundColor = .clear
        textField.layer.cornerRadius = 15
        button.setTitle("MetaMap Start Button", for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 0.4
        
        
        
        
        button.addTarget(self,
                              action:#selector(start),
                              for: .touchUpInside)
    }
    
    @objc func start() {
        if let str = textField.text, !str.isEmpty, let url = URL(string: str) {
            webView = WKWebView()
            guard let webView = webView else { return }
            webView.navigationDelegate = self
            view = webView
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
        }
    }
}

