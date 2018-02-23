//
//  RedeemViewController.swift
//  BeerboardBeerchipFramework
//
//  Created by Vmoksha on 20/02/18.
//  Copyright © 2018 Vmoksha. All rights reserved.
//

import UIKit

class RedeemViewController: UIViewController {

    @IBOutlet weak var redeemButtomConatinerView: UIView!
    
    @IBOutlet weak var currentBalancedisplayLbl: UILabel!
    
    @IBOutlet weak var redeemButton: UIButton!
    
    @IBOutlet weak var beerMenuBtn: UIButton!
    
    @IBOutlet weak var myBeerChipsBtn: UIButton!
    
    @IBOutlet weak var locationIndicatorBtn: UIButton!
    
    @IBOutlet weak var beerchipTableview: UITableView!
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var myBalanceDisplayLbl: UILabel!
    
    @IBOutlet weak var cashoutBtn: UIButton!
    
    @IBOutlet weak var cashoutBtnView: UIView!
    
    
    var titleArr = [String]()
    var abvValueArr = [String]()
    
    var beerchipTableVC = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        redeemButtomConatinerView.backgroundColor = UIColor.init(red: 59.0/255.0, green: 26.0/255.0, blue: 14.0/255.0, alpha: 1.0)
        bottomView.backgroundColor =  UIColor.init(red: 59.0/255.0, green: 26.0/255.0, blue: 14.0/255.0, alpha: 1.0)
        cashoutBtn.layer.cornerRadius = 8.0
        redeemButton.layer.cornerRadius = 8.0
        locationIndicatorBtn.layer.cornerRadius = 8.0
        
        titleArr = ["BUD LIGHT" , "BUD LIGHT LIME" ,"BUDWISER"]
        abvValueArr = ["4.2%","4.2%","5%"]
        beerMenuBtn.setTitleColor(UIColor.init(red: 255.0/255.0, green: 83.0/255.0, blue: 43.0/255.0, alpha: 1.0), for: .normal)
        myBeerChipsBtn.setTitleColor(.white, for: .normal)
        
        let beerchipStoryboard = UIStoryboard(name: "BeerchipStoryboard", bundle: Bundle(for: BeerChipTableViewController.self))
        beerchipTableVC =  beerchipStoryboard.instantiateViewController(withIdentifier: "BeerChipTableViewController") as! BeerChipTableViewController
        
        cashoutBtnView.backgroundColor = UIColor.init(red: 59.0/255.0, green: 26.0/255.0, blue: 14.0/255.0, alpha: 1.0)
    }

    @IBAction func redeemBtnAction(_ sender: Any) {
        
    }
    
    @IBAction func cashoutBnAction(_ sender: Any) {
        
    }
    
    @IBAction func locationIndicatorBtnAction(_ sender: Any) {
        
    }
    
    @IBAction func myBeerchipsBtnAction(_ sender: Any) {
        
        myBeerChipsBtn.setTitleColor(UIColor.init(red: 255.0/255.0, green: 83.0/255.0, blue: 43.0/255.0, alpha: 1.0), for: .normal)
        beerMenuBtn.setTitleColor(.white, for: .normal)
        currentBalancedisplayLbl.text = "$15.00"
        myBalanceDisplayLbl.text = "$15.00"
        cashoutBtnView.isHidden = true
        
        self.addChildViewController(beerchipTableVC)
        beerchipTableVC.view.frame = CGRect(x: 0, y: 177, width: 375, height: 410)
        self.view.addSubview(beerchipTableVC.view)
        beerchipTableVC.didMove(toParentViewController: self)
    }
    
    
    @IBAction func beerMenuBtnAction(_ sender: Any) {
        
        beerMenuBtn.setTitleColor(UIColor.init(red: 255.0/255.0, green: 83.0/255.0, blue: 43.0/255.0, alpha: 1.0), for: .normal)
        myBeerChipsBtn.setTitleColor(.white, for: .normal)
        currentBalancedisplayLbl.text = "$7.50"
        myBalanceDisplayLbl.text = "$7.50"
        cashoutBtnView.isHidden = false
        cashoutBtnView.backgroundColor = UIColor.init(red: 59.0/255.0, green: 26.0/255.0, blue: 14.0/255.0, alpha: 1.0)
        
        beerchipTableVC.willMove(toParentViewController: nil)
        beerchipTableVC.view.removeFromSuperview()
        beerchipTableVC.removeFromParentViewController()
    }

}

extension RedeemViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  titleArr.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let   cell  = tableView.dequeueReusableCell(withIdentifier: "titleCell") as!RedeemViewBeerchipTableTitleTableViewCell
            cell.beerchipsLbl.text = "BEERCHIPS"
            cell.abvLabel.text = "ABV"
            return cell
        }
        else{
            let  cell  = tableView.dequeueReusableCell(withIdentifier: "subTitleCell") as! RedeemviewBeerchipTableSubTitlesTableViewCell
            cell.abvValueLbl.text = abvValueArr[indexPath.row-1]
            cell.beerTitleLable.text = titleArr[indexPath.row-1]
            cell.beerSubTitleLbl.text = "StLouis,MD"
            return cell
        }
    }
}

