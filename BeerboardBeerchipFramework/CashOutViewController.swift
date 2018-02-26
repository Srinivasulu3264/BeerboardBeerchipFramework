//
//  CashOutViewController.swift
//  BeerboardBeerchipFramework
//
//  Created by Vmoksha on 26/02/18.
//  Copyright © 2018 Vmoksha. All rights reserved.
//

import UIKit

class CashOutViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cashoutCell", for: indexPath)
        let cashoutImgView = cell .viewWithTag(99) as! UIImageView
        cashoutImgView.image = #imageLiteral(resourceName: "beer-logo-schells")
        return cell
        
    }
}


