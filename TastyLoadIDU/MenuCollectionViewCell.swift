//
//  MenuCollectionViewCell.swift
//  TastyLoadIDU
//
//  Created by 최기훈 on 2022/01/22.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellPrice: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var uiView: UIView!
    
    let identifier = "MenuCollectionViewCell"
    
    var menu: Menu! {
        didSet {
            self.updateUI()
        }
    }
    func updateUI(){
        if let menu = menu{
            cellTitle.text = menu.menuTitle
            cellPrice.text = menu.menuPrice
            cellImage.image = menu.menuImage
            
        }else {
            cellImage.image = nil
            cellTitle.text = nil
            cellPrice.text = nil
        }
        cellImage.layer.cornerRadius = cellImage.frame.width/8
        cellImage.clipsToBounds = true
        uiView.layer.cornerRadius = uiView.frame.width/8
        uiView.clipsToBounds = true
    }
}
