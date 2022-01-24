//
//  DetailView.swift
//  TastyLoadIDU
//
//  Created by 최기훈 on 2022/01/15.
//

import UIKit

class DetailView: UIViewController{
    
    
    //MARK: - Info Property
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var foodTypeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tellLabel: UILabel!
    @IBOutlet weak var tellButton: UIButton!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    var textToSet: String?
    var imageToSet: UIImage?
    var tell: Int = 0
    var type: Int = 0
    
    //MARK: - collectionView Property
    @IBOutlet weak var collectionView: UICollectionView!
    var menus =  Menu.fetchMenu1()
    
    //MARK: - Memos
    @IBOutlet weak var MyCommentTextFiled: UITextField!
    
    var memo1: String = ""
    var memo2: String = ""
    var memo3: String = ""
    var memo4: String = ""
    var memo5: String = ""
    var memo6: String = ""
    var memo7: String = ""
    var memo8: String = ""
    var memo9: String = ""
    var memo10: String = ""
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

      
        detailInfo()
        labelBorder()
        takeValue()
        self.collectionView.dataSource = self
        
        navigationItem.title = textToSet
        showMemo()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        titleLabel.text = self.textToSet
        mainImageView.image = self.imageToSet
        
    }
    
    func labelBorder() {
        mainLabel.layer.borderColor = UIColor.black.cgColor
        mainLabel.layer.borderWidth = 2
        
    }
    
    func detailInfo() {
        switch textToSet{
        case "하다식당":
            foodTypeLabel.text = "돈까스"
            addressLabel.text = "서울 노원구 초안산로2길 122 1층"
            timeLabel.text = "일요일 휴무"
            tellLabel.text = "tel 0507-1304-4609"
            tell = 050713044609
            type = 1
        case "민들레 초밥":
            foodTypeLabel.text = "초밥"
            addressLabel.text = "서울 노원구 초안산로 2길 109 1층"
            timeLabel.text = "-"
            tellLabel.text = "tel 0507-1438-8286"
            tell = 050714388286
            type = 2
        case "밥은화":
            foodTypeLabel.text = "덮밥"
            addressLabel.text = "서울 노원구 초안산로2길 123 1층"
            timeLabel.text = "토요일 휴무"
            tellLabel.text = "tel 02-902-2822"
            tell = 029022822
            type = 3
        case "갱스터 떡볶이":
            foodTypeLabel.text = "분식"
            addressLabel.text = "서울 노원구 초안산로2길 124"
            timeLabel.text = "토요일 휴무"
            tellLabel.text = "tel 02-980-9987"
            tell = 029809987
            type = 4
        case "노랑통닭":
            foodTypeLabel.text = "치킨"
            addressLabel.text = "서울 노원구 초안산로2라길 35"
            timeLabel.text = "16:00 - 02:00"
            tellLabel.text = "tel 0507-1324-2793"
            tell = 050713242793
            type = 5
        case "곤지암 소머리국밥 & 순대국":
            foodTypeLabel.text = "국밥"
            addressLabel.text = "서울 노원구 광운로 132 월계역신도브래뉴"
            timeLabel.text = "-"
            tellLabel.text = "tel 02-942-2252"
            tell = 029422252
            type = 6
        case "토박이 순대국":
            foodTypeLabel.text = "국밥"
            addressLabel.text = "서울 노원구 초안산로2라길 26 211호"
            timeLabel.text = "22:00 종료"
            tellLabel.text = "tel 02-995-8002"
            tell = 029958992
            type = 7
        case "휘경 곱창":
            foodTypeLabel.text = "곱창"
            addressLabel.text = "서울 노원구 초안산로2길 106-18"
            timeLabel.text = "15:00 - 00:00"
            tellLabel.text = "tel 0507-1392-4866"
            tell = 05071392486
            type = 8
        case "피자굽는 오빠":
            foodTypeLabel.text = "피자"
            addressLabel.text = "서울 노원구 초안산로5길 12 월계프라자2층"
            timeLabel.text = "11:30 시작"
            tellLabel.text = "tel 0507-1337-5940"
            tell = 050713375940
            type = 9
        case "보배반점":
            foodTypeLabel.text = "중식"
            addressLabel.text = "서울 노원구 초안산로5길 12 월계프라자"
            timeLabel.text = "11:00 시작"
            tellLabel.text = "02-990-8319"
            tell = 029908319
            type = 10
        default:
            return
        }
        
    }
    
    
    //MARK: - 전화거는 버튼
  
    @IBAction func callButton(_ sender: Any) {
        let number:Int = tell
                
                // URLScheme 문자열을 통해 URL 인스턴스를 만들어 줍니다.
                if let url = NSURL(string: "tel://" + "\(number)"),
                
                   //canOpenURL(_:) 메소드를 통해서 URL 체계를 처리하는 데 앱을 사용할 수 있는지 여부를 확인
                   UIApplication.shared.canOpenURL(url as URL) {
                   
                   //사용가능한 URLScheme이라면 open(_:options:completionHandler:) 메소드를 호출해서
                   //만들어둔 URL 인스턴스를 열어줍니다.
                    UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                }
    }
    
    
    //MARK: - MYmemo
    func showMemo() {
        switch type{
        case 1:
            MyCommentTextFiled.text = UserDefaults.standard.string(forKey: "memo1")
        case 2:
            MyCommentTextFiled.text = UserDefaults.standard.string(forKey: "memo2")
        case 3:
            MyCommentTextFiled.text = UserDefaults.standard.string(forKey: "memo3")
        case 4:
            MyCommentTextFiled.text = UserDefaults.standard.string(forKey: "memo4")
        case 5:
            MyCommentTextFiled.text = UserDefaults.standard.string(forKey: "memo5")
        case 6:
            MyCommentTextFiled.text = UserDefaults.standard.string(forKey: "memo6")
        case 7:
            MyCommentTextFiled.text = UserDefaults.standard.string(forKey: "memo7")
        case 8:
            MyCommentTextFiled.text = UserDefaults.standard.string(forKey: "memo8")
        case 9:
            MyCommentTextFiled.text = UserDefaults.standard.string(forKey: "memo9")
        case 10:
            MyCommentTextFiled.text = UserDefaults.standard.string(forKey: "memo10")
        default:
            return MyCommentTextFiled.text = ""
        }
        
    }
    
    @IBAction func saveComment(_ sender: UIButton) {
        switch type{
        case 1:
            memo1 = MyCommentTextFiled.text ?? ""
            UserDefaults.standard.set(memo1, forKey: "memo1")
        case 2:
            memo2 = MyCommentTextFiled.text ?? ""
            UserDefaults.standard.set(memo2, forKey: "memo2")
        case 3:
            memo3 = MyCommentTextFiled.text ?? ""
            UserDefaults.standard.set(memo3, forKey: "memo3")
        case 4:
            memo4 = MyCommentTextFiled.text ?? ""
            UserDefaults.standard.set(memo4, forKey: "memo4")
        case 5:
            memo5 = MyCommentTextFiled.text ?? ""
            UserDefaults.standard.set(memo5, forKey: "memo5")
        case 6:
            memo6 = MyCommentTextFiled.text ?? ""
            UserDefaults.standard.set(memo6, forKey: "memo6")
        case 7:
            memo7 = MyCommentTextFiled.text ?? ""
            UserDefaults.standard.set(memo7, forKey: "memo7")
        case 8:
            memo8 = MyCommentTextFiled.text ?? ""
            UserDefaults.standard.set(memo8, forKey: "memo8")
        case 9:
            memo9 = MyCommentTextFiled.text ?? ""
            UserDefaults.standard.set(memo9, forKey: "memo9")
        case 10:
            memo10 = MyCommentTextFiled.text ?? ""
            UserDefaults.standard.set(memo10, forKey: "memo10")
        default :
            return
        }
    }
    
    
    //MARK: - collectionView
    
    func takeValue() {
        switch type {
        case 1:
            menus = Menu.fetchMenu1()
        case 2:
            menus = Menu.fetchMenu2()
        case 3:
            menus = Menu.fetchMenu3()
        case 4:
            menus = Menu.fetchMenu4()
        case 5:
            menus = Menu.fetchMenu5()
        case 6:
            menus = Menu.fetchMenu6()
        case 7:
            menus = Menu.fetchMenu7()
        case 8:
            menus = Menu.fetchMenu8()
        case 9:
            menus = Menu.fetchMenu9()
        case 10:
            menus = Menu.fetchMenu10()
        default:
            menus = Menu.fetchMenu1()
        }
    }
   
    // mapbutton
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let nextViewController: MapView = segue.destination as? MapView else {
            return
        }
        nextViewController.type = type
        nextViewController.mapText = addressLabel.text
        nextViewController.destination = titleLabel.text
      
    }

}


extension DetailView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as! MenuCollectionViewCell
        
        let menued = menus[indexPath.item]
        cell.menu = menued
        
        return cell
    }
}


