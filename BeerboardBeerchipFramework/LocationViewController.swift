//
//  LocationViewController.swift
//  BeerboardBeerchipFramework
//
//  Created by Vmoksha on 23/02/18.
//  Copyright © 2018 Vmoksha. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    
    
    @IBOutlet weak var locationTable: UITableView!
    
    
    var locationArr = ["hyderabad","banglore","chennai","mumbai","delhi","vizag"]
     var locationAddreddArr = ["155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension LocationViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "") as! LocationTableViewCell
        
        cell.locationNameLbl.text = locationArr[indexPath.row]
        cell.locationAddessLbl.text = locationAddreddArr[indexPath.row]
        
        return cell
    }
    
}
