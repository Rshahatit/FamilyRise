//
//  ViewController.swift
//  intuitHackathon
//
//  Created by Rami Shahatit on 10/22/16.
//  Copyright © 2016 Rami Shahatit. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL(string: "https://connect.squareup.com/v2/locations")!
        
        
         
         _ = URLSession.shared.dataTask(with: url as URL) { (data, response, error) -> Void in
         
         // Will happen when task completes
         
         if let urlContent = data {
         
            do {
                let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
                print(jsonResult)
            } catch {
                print("Failed")
            }
            }
        
        }
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

