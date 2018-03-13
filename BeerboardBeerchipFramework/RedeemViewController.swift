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
    
     @IBOutlet weak var locationtableConatinerView: UIView!
    
     @IBOutlet weak var locationTableView: UITableView!
    
    @IBOutlet weak var alphaView: UIView!
    
    @IBOutlet weak var externalCashoutBtnContainerView: UIView!
    
    @IBOutlet weak var externalCashoutBtn: UIButton!
    
    var titleArr = [String]()
    var abvValueArr = [String]()
    var locationArr = [String]()
    var locationAddreddArr = [String]()
    var beerMenuImagesArr = [String]()
    
    var beerchipTableVC = BeerChipTableViewController()
    var cashOutVC = UIViewController()
    var redeemBeerchipVC = RedeemBeerchipViewController()
    var beerInfoVC = BeerInfoViewController()
    
    var isTableClicked = false
    
    var isBeerchipTableVCAdding = false
    var isBeerchipTableVCRemoving = false
    
    var isCashoutVCAdding = false
    var isCashoutVCRemoving = false
    
    var isRedeemBeerchipVCAdding = false
    var isRedeemBeerchipVCRemoving = false
    
    var isBeerinfoVCAdding = false
    var isBeerinfoVCRemoving = false
    
    var isRedeemBeerchipLocation = false
    var usedefaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()

        redeemButtomConatinerView.backgroundColor = UIColor.init(red: 59.0/255.0, green: 26.0/255.0, blue: 14.0/255.0, alpha: 1.0)
        bottomView.backgroundColor =  UIColor.init(red: 59.0/255.0, green: 26.0/255.0, blue: 14.0/255.0, alpha: 1.0)
        cashoutBtn.layer.cornerRadius = 8.0
        redeemButton.layer.cornerRadius = 8.0
        locationIndicatorBtn.layer.cornerRadius = 8.0
        
        titleArr = ["BUD LIGHT" , "BUD LIGHT LIME" ,"BUDWISER","COORS LIGHT" ,"RECKARD'S RED"]
        beerMenuImagesArr = ["beer-logo-bud-light","beer-logo-bud-light-lime" ,"beer-logo-budweiser","beer-logo-bud-light","beer-logo-bud-light-lime"]
        abvValueArr = ["4.2%","4.2%","5%","4.2%","5.2%"]
        beerMenuBtn.setTitleColor(UIColor.init(red: 255.0/255.0, green: 83.0/255.0, blue: 43.0/255.0, alpha: 1.0), for: .normal)
        myBeerChipsBtn.setTitleColor(.white, for: .normal)
        
        let beerchipStoryboard = UIStoryboard(name: "BeerchipStoryboard", bundle: Bundle(for: BeerchipViewController.self))
        beerchipTableVC =  beerchipStoryboard.instantiateViewController(withIdentifier: "BeerChipTableViewController") as! BeerChipTableViewController
        cashOutVC =  beerchipStoryboard.instantiateViewController(withIdentifier: "CashOutViewController") as! CashOutViewController
        redeemBeerchipVC =  beerchipStoryboard.instantiateViewController(withIdentifier: "RedeemBeerchipViewController") as! RedeemBeerchipViewController
        beerInfoVC =  beerchipStoryboard.instantiateViewController(withIdentifier: "BeerInfoViewController") as! BeerInfoViewController
        
        beerInfoVC.beerInfoDelegate = self
        beerchipTableVC.beerchipTableDelegate = self
        redeemBeerchipVC.redeemBeerchipVCDelegate = self
        
        cashoutBtnView.backgroundColor = UIColor.init(red: 59.0/255.0, green: 26.0/255.0, blue: 14.0/255.0, alpha: 1.0)
        beerchipTableview.tableFooterView = UIView()
        
        locationArr = ["Hyderabad, HYD","Banglore,BNG ","Chennai ,CN","Mumbai ,MB","Delhi,DL","Vizag,VZ","MANHATHAN,NY","Kolkatta,KK","Pune,Pn","Surath,SR","Nagpur,NP","Kanpur,KP"]
        
        locationAddreddArr = ["155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001"]
        
        alphaView.isHidden = true
        locationtableConatinerView.isHidden = true
        externalCashoutBtnContainerView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var userdefaultsLocation = UserDefaults.standard.string(forKey: "location")
        
        if userdefaultsLocation == nil {
            userdefaultsLocation = "MANHATTAN, NY"
        }
        
        locationIndicatorBtn.setTitle(userdefaultsLocation, for: .normal)
    }
    
    
    
    @IBAction func cashoutBnAction(_ sender: Any) {
        
        externalCashoutBtnContainerView.isHidden = false
        isBeerchipTableVCRemoving = true
        beerChipTableVCAddingAndRemoving()
        isCashoutVCAdding = true
        cashoutVCAddingAndRemoving()
        externalCashoutBtn.setTitle("CASH OUT", for: .normal)
    }
    
    @IBAction func locationIndicatorBtnAction(_ sender: Any) {
        alphaView.isHidden = false
        locationtableConatinerView.isHidden = false
    }
    
    @IBAction func myBeerchipsBtnAction(_ sender: Any) {
        
        myBeerChipsBtn.setTitleColor(UIColor.init(red: 255.0/255.0, green: 83.0/255.0, blue: 43.0/255.0, alpha: 1.0), for: .normal)
        beerMenuBtn.setTitleColor(.white, for: .normal)
        currentBalancedisplayLbl.text = "$15.00"
        myBalanceDisplayLbl.text = "$15.00"
        cashoutBtnView.isHidden = true
        
        isBeerchipTableVCAdding = true
        beerChipTableVCAddingAndRemoving()
        
        isBeerinfoVCRemoving = true
        beerInfoVCAddingAndRemoving()
    }
    
    
    @IBAction func beerMenuBtnAction(_ sender: Any) {
        
        beerMenuBtn.setTitleColor(UIColor.init(red: 255.0/255.0, green: 83.0/255.0, blue: 43.0/255.0, alpha: 1.0), for: .normal)
        myBeerChipsBtn.setTitleColor(.white, for: .normal)
        currentBalancedisplayLbl.text = "$7.50"
        myBalanceDisplayLbl.text = "$7.50"
        cashoutBtnView.isHidden = false
        cashoutBtnView.backgroundColor = UIColor.init(red: 59.0/255.0, green: 26.0/255.0, blue: 14.0/255.0, alpha: 1.0)
        isBeerchipTableVCRemoving = true
        beerChipTableVCAddingAndRemoving()
        
    }

    @IBAction func redeemBtnAction(_ sender: Any) {
        
        if redeemButton.currentTitle == "REDEEM"
        {
            isBeerchipTableVCRemoving = true
            beerChipTableVCAddingAndRemoving()
            
            isRedeemBeerchipVCAdding = true
            redeemBeerchipVCAddingAndRemoving()
            
            isCashoutVCRemoving = true
            cashoutVCAddingAndRemoving()
            
            externalCashoutBtnContainerView.isHidden = false
            externalCashoutBtn.setTitle("REDEEM", for: .normal)
            redeemButton.setImage(nil, for: .normal)
            redeemButton.setTitle("CASH OUT", for: .normal)
            currentBalancedisplayLbl.text = "$15.00"
        }
        else{
            
            redeemButton.setTitle("REDEEM", for: .normal)
            guard let imageObj  = UIImage(named:"view-redeem-icon.png") else{ return  }
            redeemButton.setImage( imageObj  , for: .normal)
            externalCashoutBtn.setTitle("CASH OUT", for: .normal)
            
            externalCashoutBtnContainerView.isHidden = false
            
            isRedeemBeerchipVCRemoving = true
            redeemBeerchipVCAddingAndRemoving()
            
            isCashoutVCAdding = true
            cashoutVCAddingAndRemoving()
        }
    }

    @IBAction func externalCashoutBtnAction(_ sender: Any) {
        
        
        if externalCashoutBtn.currentTitle == "REDEEM"
        {
            
            isRedeemBeerchipVCRemoving = true
            redeemBeerchipVCAddingAndRemoving()
            
            isBeerchipTableVCAdding = true
            beerChipTableVCAddingAndRemoving()
            
            externalCashoutBtnContainerView.isHidden = true
            redeemButton.setTitle("REDEEM", for: .normal)
            guard let imageObj  = UIImage(named:"view-redeem-icon.png") else{ return  }
            redeemButton.setImage( imageObj  , for: .normal)
            currentBalancedisplayLbl.text = "$15.00"
            myBeerChipsBtn.setTitleColor(UIColor.init(red: 255.0/255.0, green: 83.0/255.0, blue: 43.0/255.0, alpha: 1.0), for: .normal)
            beerMenuBtn.setTitleColor(.white, for: .normal)
            myBalanceDisplayLbl.text = "$15.00"
            
            cashoutBtnView.isHidden = true
            
        }else{
            
            isCashoutVCRemoving = true
            cashoutVCAddingAndRemoving()
            
            beerMenuBtn.setTitleColor(UIColor.init(red: 255.0/255.0, green: 83.0/255.0, blue: 43.0/255.0, alpha: 1.0), for: .normal)
            myBeerChipsBtn.setTitleColor(.white, for: .normal)
            currentBalancedisplayLbl.text = "$7.50"
            myBalanceDisplayLbl.text = "$7.50"
            
            externalCashoutBtnContainerView.isHidden = true
            cashoutBtnView.isHidden = false
        }
        
        if isTableClicked {
            isBeerinfoVCRemoving = true
            beerInfoVCAddingAndRemoving()
            isTableClicked = false
        }
    }
    
    
    func beerChipTableVCAddingAndRemoving()  {
        
        if isBeerchipTableVCAdding {
            self.addChildViewController(beerchipTableVC)
             beerchipTableVC.view.frame = CGRect(x: 0, y: 177, width:  UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height-257))
            self.view.addSubview(beerchipTableVC.view)
            beerchipTableVC.didMove(toParentViewController: self)
            isBeerchipTableVCAdding = false
        }
        
        if isBeerchipTableVCRemoving{
            beerchipTableVC.willMove(toParentViewController: nil)
            beerchipTableVC.view.removeFromSuperview()
            beerchipTableVC.removeFromParentViewController()
            isBeerchipTableVCRemoving = false
        }
    }
    
    func cashoutVCAddingAndRemoving()  {
        
        if isCashoutVCAdding {
            self.addChildViewController(cashOutVC)
            cashOutVC.view.frame = CGRect(x: 0, y: 120, width:  UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height-180))
            self.view.addSubview(cashOutVC.view)
            cashOutVC.didMove(toParentViewController: self)
            isCashoutVCAdding = false
        }
        if isCashoutVCRemoving{
            cashOutVC.willMove(toParentViewController: nil)
            cashOutVC.view.removeFromSuperview()
            cashOutVC.removeFromParentViewController()
            isCashoutVCRemoving = false
        }
    }
    
    
    func redeemBeerchipVCAddingAndRemoving()  {
        
        if isRedeemBeerchipVCAdding {
            self.addChildViewController(redeemBeerchipVC)
            redeemBeerchipVC.view.frame = CGRect(x: 0, y: 120, width: UIScreen.main.bounds.width, height:  (UIScreen.main.bounds.height-180))
            self.view.addSubview(redeemBeerchipVC.view)
            redeemBeerchipVC.didMove(toParentViewController: self)
            isRedeemBeerchipVCAdding = false
        }
        if isRedeemBeerchipVCRemoving{
            redeemBeerchipVC.willMove(toParentViewController: nil)
            redeemBeerchipVC.view.removeFromSuperview()
            redeemBeerchipVC.removeFromParentViewController()
            isRedeemBeerchipVCRemoving = false
        }
    }
    
    func beerInfoVCAddingAndRemoving()  {
        
        if isBeerinfoVCAdding {
            self.addChildViewController(beerInfoVC)
           beerInfoVC.view.frame = CGRect(x: 0, y: 177, width:  UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height-257))
            self.view.addSubview(beerInfoVC.view)
            beerInfoVC.didMove(toParentViewController: self)
            isBeerinfoVCAdding = false
        }
        if isBeerinfoVCRemoving{
            beerInfoVC.willMove(toParentViewController: nil)
            beerInfoVC.view.removeFromSuperview()
            beerInfoVC.removeFromParentViewController()
            isBeerinfoVCRemoving = false
        }
    }
}


extension RedeemViewController:beerInfoVCProtocol{
    func displayRedeemBeerchipVC() {
        isBeerinfoVCRemoving = true
        beerInfoVCAddingAndRemoving()
        redeemBtnAction(self)
    }
    
    func removeBeerinfoVC() {
        print("beerinfo Backbtn Called")
        isBeerinfoVCRemoving = true
        beerInfoVCAddingAndRemoving()
    }
}

extension RedeemViewController:beerchipTableVCProtocol{
    func addBeerinfoVCFromBeerchipTableVC() {
        print(" beerchipTableVC  table clicked")
        isBeerinfoVCAdding = true
        beerInfoVCAddingAndRemoving()
        setBeerMenubtnSelected()
        isTableClicked = true
    }
    
    func setBeerMenubtnSelected()  {
        beerMenuBtn.setTitleColor(UIColor.init(red: 255.0/255.0, green: 83.0/255.0, blue: 43.0/255.0, alpha: 1.0), for: .normal)
        myBeerChipsBtn.setTitleColor(.white, for: .normal)
        currentBalancedisplayLbl.text = "$7.50"
        myBalanceDisplayLbl.text = "$7.50"
        cashoutBtnView.isHidden = false
        cashoutBtnView.backgroundColor = UIColor.init(red: 59.0/255.0, green: 26.0/255.0, blue: 14.0/255.0, alpha: 1.0)
        isBeerchipTableVCRemoving = true
        beerChipTableVCAddingAndRemoving()
    }
}

extension RedeemViewController:redeemBeerchipVCProtocol{
    
    func displayLocationTable() {
        print( " location tablecalled ")
        alphaView.isHidden = false
        locationtableConatinerView.isHidden = false
        isRedeemBeerchipVCRemoving = true
        redeemBeerchipVCAddingAndRemoving()
        externalCashoutBtnContainerView.isHidden = true
        isCashoutVCRemoving = true
        cashoutVCAddingAndRemoving()
       isBeerchipTableVCRemoving = true
        beerChipTableVCAddingAndRemoving()
        isBeerinfoVCRemoving = true
        beerInfoVCAddingAndRemoving()
        isRedeemBeerchipLocation = true
    }
}



extension RedeemViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == beerchipTableview {
            return  titleArr.count+1
        }else{
            return locationArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == beerchipTableview {
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
                let imgName = beerMenuImagesArr[indexPath.row-1]
                cell.beerDisplayImageView.image = UIImage(named: imgName)
                
                if indexPath.row == 3{
                 cell.beerchipsImageView.image = nil
                }
                
                cell.beerSubTitleLbl.text = "StLouis,MD"
                return cell
            }
        }
        else{
            let   cell  = tableView.dequeueReusableCell(withIdentifier: "locationCell") as!LocationTableViewCell
            cell.locationNameLbl.text = locationArr[indexPath.row]
            cell.locationAddessLbl.text = locationAddreddArr[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == beerchipTableview {
            isBeerinfoVCAdding = true
            beerInfoVCAddingAndRemoving()
            isTableClicked = true
        }else{
            let locationName = locationArr[indexPath.row]
            locationIndicatorBtn.setTitle(locationName, for: .normal)
            alphaView.isHidden = true
            locationtableConatinerView.isHidden = true
            
            usedefaults.set(locationName, forKey: "location")
            
            if isRedeemBeerchipLocation{
                UserDefaults.standard.set(locationName, forKey: "location")
                redeemButton.setTitle("REDEEM", for: .normal)
                redeemBtnAction(self)
            }
        }
    }
}

