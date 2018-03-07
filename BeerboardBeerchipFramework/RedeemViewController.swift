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
    
    var isRedeemBeerchipVC = false
    var isCashoutVC = false
    var isTableClicked = false
    
    var isBeerinfoVCAdding = false
    var isBeerinfoVCRemoving = false
    
    var isMyBeerChipsSelected = false
    var isBeerMenuSelected = false
    
     var isRedeemBeerchipLocation = false
     var usedefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        redeemButtomConatinerView.backgroundColor = UIColor.init(red: 59.0/255.0, green: 26.0/255.0, blue: 14.0/255.0, alpha: 1.0)
        bottomView.backgroundColor =  UIColor.init(red: 59.0/255.0, green: 26.0/255.0, blue: 14.0/255.0, alpha: 1.0)
        cashoutBtn.layer.cornerRadius = 8.0
        redeemButton.layer.cornerRadius = 8.0
        locationIndicatorBtn.layer.cornerRadius = 8.0
        
        titleArr = ["BUD LIGHT" , "BUD LIGHT LIME" ,"BUDWISER"]
        beerMenuImagesArr = ["beer-logo-bud-light" , "beer-logo-bud-light-lime" ,"beer-logo-budweiser"]
        abvValueArr = ["4.2%","4.2%","5%"]
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
        
        locationArr = ["hyderabad","banglore","chennai","mumbai","delhi","vizag","MANHATHAN"]
        locationAddreddArr = ["155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001"]
        
        alphaView.isHidden = true
        locationtableConatinerView.isHidden = true
        externalCashoutBtnContainerView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let  userdefaultsLocation = UserDefaults.standard.string(forKey: "location")
        locationIndicatorBtn.setTitle(userdefaultsLocation, for: .normal)
    }

    @IBAction func redeemBtnAction(_ sender: Any) {
        if redeemButton.currentTitle == "REDEEM"
        {
            isRedeemBeerchipVC = true
            self.addChildViewController(redeemBeerchipVC)
            redeemBeerchipVC.view.frame = CGRect(x: 0, y: 120, width: 375, height: 487)
            self.view.addSubview(redeemBeerchipVC.view)
            redeemBeerchipVC.didMove(toParentViewController: self)
            externalCashoutBtnContainerView.isHidden = false
            externalCashoutBtn.setTitle("REDEEM", for: .normal)
            redeemButton.setImage(nil, for: .normal)
            redeemButton.setTitle("CASH OUT", for: .normal)
            currentBalancedisplayLbl.text = "$15.00"
        }
        else{
            isCashoutVC = true
            redeemButton.setTitle("REDEEM", for: .normal)
            guard let imageObj  = UIImage(named:"view-redeem-icon.png") else{ return  }
            redeemButton.setImage( imageObj  , for: .normal)
            externalCashoutBtn.setTitle("CASH OUT", for: .normal)
            
            externalCashoutBtnContainerView.isHidden = false
            self.addChildViewController(cashOutVC)
            cashOutVC.view.frame = CGRect(x: 0, y: 120, width: 375, height: 487)
            self.view.addSubview(cashOutVC.view)
            cashOutVC.didMove(toParentViewController: self)
        }
    }

    @IBAction func externalCashoutBtnAction(_ sender: Any) {
        
        if externalCashoutBtn.currentTitle == "REDEEM"
        {
            if isRedeemBeerchipVC
            {
                redeemBeerchipVC.willMove(toParentViewController: nil)
                redeemBeerchipVC.view.removeFromSuperview()
                redeemBeerchipVC.removeFromParentViewController()
                externalCashoutBtnContainerView.isHidden = true
                redeemButton.setTitle("REDEEM", for: .normal)
                guard let imageObj  = UIImage(named:"view-redeem-icon.png") else{ return  }
                redeemButton.setImage( imageObj  , for: .normal)
                currentBalancedisplayLbl.text = "$15.00"
                isRedeemBeerchipVC = false
                
                isMyBeerChipsSelected = true
            }
            
            if isCashoutVC
            {
                cashOutVC.willMove(toParentViewController: nil)
                cashOutVC.view.removeFromSuperview()
                cashOutVC.removeFromParentViewController()
                externalCashoutBtnContainerView.isHidden = true
                isCashoutVC = false
                
                isBeerMenuSelected = true
            }
            
        }else{
            if isRedeemBeerchipVC
            {
                redeemBeerchipVC.willMove(toParentViewController: nil)
                redeemBeerchipVC.view.removeFromSuperview()
                redeemBeerchipVC.removeFromParentViewController()
                isRedeemBeerchipVC = false
                isMyBeerChipsSelected = true
            }
            if isCashoutVC{
                cashOutVC.willMove(toParentViewController: nil)
                cashOutVC.view.removeFromSuperview()
                cashOutVC.removeFromParentViewController()
                externalCashoutBtnContainerView.isHidden = true
                isCashoutVC = false
                isBeerMenuSelected = true
            }
        }
        
        if isTableClicked {
            isBeerinfoVCRemoving = true
            beerInfoVCAddingAndRemoving()
            isTableClicked = false
        }
        getSelectedMenu()
    }
    
    func getSelectedMenu() {
        
        if isMyBeerChipsSelected {
            myBeerChipsBtn.setTitleColor(UIColor.init(red: 255.0/255.0, green: 83.0/255.0, blue: 43.0/255.0, alpha: 1.0), for: .normal)
            beerMenuBtn.setTitleColor(.white, for: .normal)
            currentBalancedisplayLbl.text = "$15.00"
            myBalanceDisplayLbl.text = "$15.00"
            cashoutBtnView.isHidden = true
            isMyBeerChipsSelected = false
            
            self.addChildViewController(beerchipTableVC)
            beerchipTableVC.view.frame = CGRect(x: 0, y: 177, width: 375, height: 410)
            self.view.addSubview(beerchipTableVC.view)
            beerchipTableVC.didMove(toParentViewController: self)
        }
        
        if isBeerMenuSelected {
            beerMenuBtn.setTitleColor(UIColor.init(red: 255.0/255.0, green: 83.0/255.0, blue: 43.0/255.0, alpha: 1.0), for: .normal)
            myBeerChipsBtn.setTitleColor(.white, for: .normal)
            currentBalancedisplayLbl.text = "$7.50"
            myBalanceDisplayLbl.text = "$7.50"
            cashoutBtnView.isHidden = false
            cashoutBtnView.backgroundColor = UIColor.init(red: 59.0/255.0, green: 26.0/255.0, blue: 14.0/255.0, alpha: 1.0)
            isBeerMenuSelected = false
            
            beerchipTableVC.willMove(toParentViewController: nil)
            beerchipTableVC.view.removeFromSuperview()
            beerchipTableVC.removeFromParentViewController()
        }
    }
    
    func beerInfoVCAddingAndRemoving()  {
        
        if isBeerinfoVCAdding {
            self.addChildViewController(beerInfoVC)
            beerInfoVC.view.frame = CGRect(x: 0, y: 177, width: 375, height: 410)
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
    
    @IBAction func cashoutBnAction(_ sender: Any) {
        isCashoutVC = true
        externalCashoutBtnContainerView.isHidden = false
        self.addChildViewController(cashOutVC)
        cashOutVC.view.frame = CGRect(x: 0, y: 120, width: 375, height: 487)
        self.view.addSubview(cashOutVC.view)
        cashOutVC.didMove(toParentViewController: self)
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
        
        if isTableClicked{
            isBeerinfoVCRemoving = true
            beerInfoVCAddingAndRemoving()
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
        beerchipTableVC.willMove(toParentViewController: nil)
        beerchipTableVC.view.removeFromSuperview()
        beerchipTableVC.removeFromParentViewController()
    }
}

extension RedeemViewController:redeemBeerchipVCProtocol{
    
    func displayLocationTable() {
        print( " location tablecalled ")
        alphaView.isHidden = false
        locationtableConatinerView.isHidden = false
        
        redeemBeerchipVC.willMove(toParentViewController: nil)
        redeemBeerchipVC.view.removeFromSuperview()
        redeemBeerchipVC.removeFromParentViewController()
        externalCashoutBtnContainerView.isHidden = true
        
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

