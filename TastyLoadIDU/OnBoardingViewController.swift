//
//  OnBoardingViewController.swift
//  TastyLoadIDU
//
//  Created by 최기훈 on 2022/01/24.
//

import UIKit

class OnBoardingViewController: ViewController {
    
    @IBOutlet weak var mainImage : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mainImage.layer.cornerRadius = mainImage.frame.width/8
        mainImage.clipsToBounds = true
        
    }
    
}
