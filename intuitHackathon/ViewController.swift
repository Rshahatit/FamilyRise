//
//  ViewController.swift
//  intuitHackathon
//
//  Created by Rami Shahatit on 10/22/16.
//  Copyright © 2016 Rami Shahatit. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let headers: HTTPHeaders = [
//            "Authorization": "Bearer sandbox-sq0atb-EXlRi0W-GxwwgVtgAmfOnw",
//            "Accept": "application/json"
//        ]
//        
//       let jsonData = Alamofire.request("https://connect.squareup.com/v2/locations", headers: headers).responseJSON { response in
//            debugPrint(response)
//        }
//
//        
//        do {
//            let jsonData2 = try JSONSerialization.data(withJSONObject: parameters, options: <#T##JSONSerialization.WritingOptions#>)
//        } catch {
//            print("failed")
//        }
//        
//        let jsonData2 = Alamofire.request("https://connect.squareup.com/v2/locations/CBASEEkXHolGdpEi6pkTrMwiZSY/transactions", headers: headers, parameter:jsonData).responseJSON { response in
//            debugPrint(response)
//        }
        
        let headers = [
            "authorization": "Bearer sandbox-sq0atb-EXlRi0W-GxwwgVtgAmfOnw",
            "content-type": "application/json",
            "cache-control": "no-cache",
            "postman-token": "b5c14019-a948-e60e-2f9a-fe17ebcd6abb"
        ]
        let parameters = [
            "idempotency_key": "8bd7e96a-5f66-2213-91a0-bed66c3b8c2b",
            "shipping_address": [
                "address_line_1": "123 Main St",
                "locality": "San Francisco",
                "administrative_district_level_1": "CA",
                "postal_code": "94114",
                "country": "US"
            ],
            "billing_address": [
                "address_line_1": "500 Electric Ave",
                "address_line_2": "Suite 600",
                "administrative_district_level_1": "NY",
                "locality": "New York",
                "postal_code": "10003",
                "country": "US"
            ],
            "amount_money": [
                "amount": 5000,
                "currency": "USD"
            ],
            "card_nonce": "fake-card-nonce-ok",
            "reference_id": "some optional reference id",
            "note": "Matthew : Cappuccino",
            "delay_capture": ""
        ] as [String : Any]
        
        var postData: AnyObject? =  nil
        do {
            let postData = try JSONSerialization.data(withJSONObject: parameters, options:JSONSerialization.WritingOptions.prettyPrinted)
        } catch {
            print("Failed getting JSON")
            
       }
        if (postData == nil) {
            EXIT_FAILURE
        }
        var request = NSMutableURLRequest(url: NSURL(string: "https://connect.squareup.com/v2/locations/CBASEEkXHolGdpEi6pkTrMwiZSY/transactions")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as! Data?
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })
        
        dataTask.resume()
        
        
        let headers1 = [
            "authorization": "Bearer sandbox-sq0atb-EXlRi0W-GxwwgVtgAmfOnw",
            "cache-control": "no-cache",
            "postman-token": "dd250332-5ec9-aa80-4396-b2b1dc6191a9"
        ]
        
        var request1 = NSMutableURLRequest(url: NSURL(string: "https://connect.squareup.com/v2/locations/CBASEEkXHolGdpEi6pkTrMwiZSY/transactions")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers1
        
        let session1 = URLSession.shared
        let dataTask1 = session1.dataTask(with: request1 as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })
        
        dataTask1.resume()
        
     
    }
    
    @IBAction func update(_ sender: AnyObject) {
        dataLabel.text = "Rami Shahatit, Large Cappuccino"
    }
    
        


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

