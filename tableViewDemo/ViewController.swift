//
//  ViewController.swift
//  tableViewDemo
//
//  Created by Bharat Ram Rupenaguntla on 22/9/18.
//  Copyright © 2018 Bharat Ram Rupenaguntla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //step 1 for countries
    var countries = [String]()
    //above should be var. if it is let you'll get an error when calling NSArray

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //step 3 for countries
        guard let path = Bundle.main.path(forResource: "countries", ofType: "plist") else {
        print("countries.plistfile missing")
        return
    }
        //step 2 for countries
        countries = NSArray(contentsOfFile: path) as! [String]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
        
        //step 4 for countries
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//            return 2
//        }
//
//        if section == 1 {
//            return 5
//        }
//        if section == 2 {
//            return 7
//        }
//        return 0 //the last return 0 is to protect from app crash in case someone changes the number of sections from 3 to something else
//        //to practise, change the last return to 10 and remove the if loops
//    }
        
        //below is for countries code
        //step 5 for countries
        return countries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        let section = indexPath.section
//        let row = indexPath.row
//        cell.textLabel?.text = "Hello Bharat! [\(section), \(row)]"
        
        //step 6 for countries
//        let countryName = countries[indexPath.row]
        
        //step 7 for countries
        //change the above to countryFileName because technically countryName is the countryFileName
        let countryFileName = countries[indexPath.row]
        //below is to delete the path extension png for all the flag images
        let countryName = (countryFileName as NSString).deletingPathExtension
        let flagImage = UIImage(named: countryFileName)
        
        cell.textLabel?.text = countryName
        cell.textLabel?.textColor = UIColor.red
        
        //step 8 in countries
        cell.imageView?.image = flagImage
        
        
        return cell
    }
    //step 9 in countries
    //to display header
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Countries"
    }
    
    //step 10 in countries
    //to print a log when a country is tapped
    //click on TableView, connect delegate to view

    //step 11 create a nav control and name the segue as showcountry and write below
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let countryFileName = countries[indexPath.row]
        let countryName = (countryFileName as NSString).deletingPathExtension
        print("Selected Country is: \(countryName)")
        performSegue(withIdentifier: "showCountry", sender: nil)
    }
    
    //step 12 you want to pass the country name to other screen
    //prepare for segue will be called when user taped on a country (performSegue is called when user tapped on a country). So when
    //performSegue is called prepare for Segue is called
    //UIStoryboardSegue is the segue that will be performed
    
    //sequence: 1. on story board, create a view controller
    //2. create a Coca Touch class of type View Controller
    //3. Inside the class create a string called country name
    //4. name the view controller class in story board with the name of the cocoa class file
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showCountry" {
            //a segue connects to view controller. you have a source vc and dest vc. it has to be from source to des
        
     
        let destination = segue.destination as! CountryDetailsViewController
            destination.countryName = "Australia"
        print("Selected Country is: \(destination.countryName)")
        
//        }
    }
}

