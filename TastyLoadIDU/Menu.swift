//
//  Menu.swift
//  TastyLoadIDU
//
//  Created by 최기훈 on 2022/01/22.
//

import UIKit
import Foundation

class Menu{
    
    var menuTitle = ""
    var menuPrice = ""
    var menuImage: UIImage
    var type: Int = 0

    
   
    init(menuTitle: String, menuPrice: String, menuImage: UIImage) {
        self.menuTitle = menuTitle
        self.menuPrice = menuPrice
        self.menuImage = menuImage
    }
    
    
    static func fetchMenu1() -> [Menu] {
            return [
                Menu(menuTitle: "등심하다", menuPrice: "9,000원", menuImage: UIImage(named: "hada1")!),
                Menu(menuTitle: "안심하다", menuPrice: "10,000원", menuImage: UIImage(named: "hada2")!),
                Menu(menuTitle: "카래우동", menuPrice: "8,500원", menuImage: UIImage(named: "hada3")!),
                Menu(menuTitle: "카레하다", menuPrice: "8,500원", menuImage: UIImage(named: "hada4")!)
            ]
    }
    static func fetchMenu2() -> [Menu] {
            return [
                Menu(menuTitle: "특 초밥", menuPrice: "15,000원", menuImage: UIImage(named: "mindle1")!),
                Menu(menuTitle: "민들레 초밥", menuPrice: "19,000원", menuImage: UIImage(named: "mindle2")!),
                Menu(menuTitle: "모둠 초밥", menuPrice: "12,000원", menuImage: UIImage(named: "mindle3")!),
                Menu(menuTitle: "연어 10p", menuPrice: "14,000원", menuImage: UIImage(named: "mindle4")!)
            ]
    }
    static func fetchMenu3() -> [Menu] {
            return [
                Menu(menuTitle: "돼지숙주", menuPrice: "6,000원", menuImage: UIImage(named: "bob1")!),
                Menu(menuTitle: "치킨마요", menuPrice: "5,500원", menuImage: UIImage(named: "bob2")!),
                Menu(menuTitle: "직화제육", menuPrice: "6,000원", menuImage: UIImage(named: "bob3")!),
                Menu(menuTitle: "숙주라면", menuPrice: "4,000원", menuImage: UIImage(named: "bob4")!)
            ]
    }
    static func fetchMenu4() -> [Menu] {
            return [
                Menu(menuTitle: "옛날쌀떡볶이", menuPrice: "3,500원", menuImage: UIImage(named: "gang1")!),
                Menu(menuTitle: "등심돈까스", menuPrice: "3,500원", menuImage: UIImage(named: "gang2")!),
                Menu(menuTitle: "국물떡볶이", menuPrice: "3,500원", menuImage: UIImage(named: "gang3")!),
                Menu(menuTitle: "눈꽃치즈떡볶이", menuPrice: "4,500원", menuImage: UIImage(named: "gang4")!)
            ]
    }
    static func fetchMenu5() -> [Menu] {
            return [
                Menu(menuTitle: "엄청큰후라이드치킨", menuPrice: "18,000원", menuImage: UIImage(named: "no1")!),
                Menu(menuTitle: "엄청큰양념치킨", menuPrice: "17,000원", menuImage: UIImage(named: "no2")!),
                Menu(menuTitle: "바삭누룽지치킨", menuPrice: "19,000원", menuImage: UIImage(named: "no3")!),
                Menu(menuTitle: "알싸한마늘치킨", menuPrice: "15,000원", menuImage: UIImage(named: "no4")!)
            ]
    }
    static func fetchMenu6() -> [Menu] {
            return [
                Menu(menuTitle: "한우소머리국밥", menuPrice: "7,000원", menuImage: UIImage(named: "gon1")!),
                Menu(menuTitle: "뚝배기불고기", menuPrice: "6,000원", menuImage: UIImage(named: "gon2")!),
                Menu(menuTitle: "뼈해장국", menuPrice: "7,000원", menuImage: UIImage(named: "gon3")!),
                Menu(menuTitle: "나주곰탕", menuPrice: "7,000원", menuImage: UIImage(named: "gon4")!)
            ]
    }
    static func fetchMenu7() -> [Menu] {
            return [
                Menu(menuTitle: "순대국", menuPrice: "6,000원", menuImage: UIImage(named: "to1")!),
                Menu(menuTitle: "냉면", menuPrice: "7,000원", menuImage: UIImage(named: "to2")!),
                Menu(menuTitle: "뼈해장국", menuPrice: "8,000원", menuImage: UIImage(named: "to3")!),
                Menu(menuTitle: "순대곱창전골(중)", menuPrice: "23,000원", menuImage: UIImage(named: "to4")!)
            ]
    }
    static func fetchMenu8() -> [Menu] {
            return [
                Menu(menuTitle: "야채곱창", menuPrice: "10,000원", menuImage: UIImage(named: "whi1")!),
                Menu(menuTitle: "알곱창", menuPrice: "11,000원", menuImage: UIImage(named: "whi2")!),
                Menu(menuTitle: "눈꽃치즈곱창", menuPrice: "11,000원", menuImage: UIImage(named: "whi3")!),
                Menu(menuTitle: "순대곱창", menuPrice: "13,000원", menuImage: UIImage(named: "whi4")!)
            ]
    }
    static func fetchMenu9() -> [Menu] {
            return [
                Menu(menuTitle: "피자+볶음밥세트", menuPrice: "21,000원", menuImage: UIImage(named: "pizza1")!),
                Menu(menuTitle: "고르곤졸라", menuPrice: "14,000원", menuImage: UIImage(named: "pizza2")!),
                Menu(menuTitle: "파스타", menuPrice: "9,000원", menuImage: UIImage(named: "pizza3")!),
                Menu(menuTitle: "볶음밥", menuPrice: "8,000원", menuImage: UIImage(named: "pizza4")!)
            ]
    }
    static func fetchMenu10() -> [Menu] {
            return [
                Menu(menuTitle: "짜장면", menuPrice: "5,000원", menuImage: UIImage(named: "bo1")!),
                Menu(menuTitle: "짬뽕", menuPrice: "7,000원", menuImage: UIImage(named: "bo2")!),
                Menu(menuTitle: "소고기짬뽕", menuPrice: "9,000원", menuImage: UIImage(named: "bo3")!),
                Menu(menuTitle: "탕수육", menuPrice: "11,000원", menuImage: UIImage(named: "bo4")!)
            ]
    }

}

