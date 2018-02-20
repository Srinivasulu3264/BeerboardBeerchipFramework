//
//  BeerchipViewController.swift
//  BeerboardBeerchipFramework
//
//  Created by Vmoksha on 20/02/18.
//  Copyright © 2018 Vmoksha. All rights reserved.
//

import UIKit

public class BeerchipViewController: UIViewController {

    @IBOutlet weak var viewRedeemBtn: UIButton!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
      let   window = UIWindow(frame: UIScreen.main.bounds)
        let nav1 = UINavigationController()
        let mainView = BeerchipViewController(nibName: nil, bundle: nil) //ViewController = Name of your controller
        nav1.viewControllers = [mainView]
        window.rootViewController = nav1
        window.makeKeyAndVisible()

        viewRedeemBtn.layer.cornerRadius = 8.0
        // Do any additional setup after loading the view.
    }

    @IBAction func viewRedeemBtnAction(_ sender: Any) {
        
       performSegue(withIdentifier: "toRedeemVCSegue", sender: self)
    }
    
}
