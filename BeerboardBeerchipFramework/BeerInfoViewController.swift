//
//  BeerInfoViewController.swift
//  BeerboardBeerchipFramework
//
//  Created by Vmoksha on 05/03/18.
//

import UIKit

protocol beerInfoVCProtocol {
    func removeBeerinfoVC()
     func displayRedeemBeerchipVC()
}

class BeerInfoViewController: UIViewController {
    
 var beerInfoDelegate : beerInfoVCProtocol?
    
    
    @IBOutlet weak var redeemBeerchipBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redeemBeerchipBtn.layer.cornerRadius = 8.0
        
        // Do any additional setup after loading the view.
    }

    @IBAction func navigationBackBtnAction(_ sender: Any) {
         beerInfoDelegate?.removeBeerinfoVC()
    }
    
    @IBAction func redeemBeerchipBtnAction(_ sender: Any) {
        
         beerInfoDelegate?.displayRedeemBeerchipVC()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
