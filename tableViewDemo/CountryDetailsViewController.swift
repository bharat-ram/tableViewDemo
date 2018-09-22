//
//  CountryDetailsViewController.swift
//  tableViewDemo
//
//  Created by Bharat Ram Rupenaguntla on 22/9/18.
//  Copyright © 2018 Bharat Ram Rupenaguntla. All rights reserved.
//

import UIKit
import WebKit

class CountryDetailsViewController: UIViewController, WKNavigationDelegate {
    var countryName: String!
    @IBOutlet weak var weView: WKWebView!
    
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let url = URL(string: "https://en.wikipedia.org/wiki/\(countryName!)")!
//        let urlString = "https://en.wikipedia.org/wiki/\(countryName!)"
        title = countryName
//        print("URL: \(urlString)")
        let request = URLRequest(url: url)
        weView.navigationDelegate = self
        weView.load(request)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        spinnerView.startAnimating()


    }



    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinnerView.stopAnimating()

    }
}
