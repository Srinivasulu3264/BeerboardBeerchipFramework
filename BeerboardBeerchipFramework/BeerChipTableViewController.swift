//
//  BeerChipTableViewController.swift
//  BeerboardBeerchipFramework
//
//  Created by Vmoksha on 23/02/18.
//  Copyright © 2018 Vmoksha. All rights reserved.
//

import UIKit

protocol beerchipTableVCProtocol {
    func addBeerinfoVCFromBeerchipTableVC()
}

class BeerChipTableViewController: UIViewController {
    
    var beerNamesArr = [String]()
    var beerCostArr = [String]()
    var beerchipTableDelegate : beerchipTableVCProtocol?

    @IBOutlet weak var beerchipTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        beerchipTable.tableFooterView = UIView()
        beerNamesArr = ["BUD LIGHT","BUD LIGHT LIME","BUDWISER"]
        beerCostArr = ["$11.00","$2.00","$2.00"]
        // Do any additional setup after loading the view.
    }
}
extension BeerChipTableViewController:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  beerNamesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "beerCell", for: indexPath) as! BeerchipTableViewCell
        cell.beerTitleLbl.text = beerNamesArr[indexPath.row]
        cell.beerSubTitleLbl.text = "StLouis,MD"
        cell.beerCostLbl.text =  beerCostArr[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        beerchipTableDelegate?.addBeerinfoVCFromBeerchipTableVC()
    }
    
}
