//
//  DetailView.swift
//  TastyLoadIDU
//
//  Created by 최기훈 on 2022/01/15.
//

import UIKit

class DetailView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var foodTypeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tellLabel: UILabel!
    @IBOutlet weak var tellButton: UIButton!
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    var textToSet: String?
    var imageToSet: UIImage?
    var tell: Int = 0
    var type: Int = 0
    
    let numberOfCell: Int = 4
    let cellIdentifier = "cell"
    
    var mainTitle: [String] = [String]()
    var mainPrice: [String] = [String]()

    var mainImage: [String] = [String]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    
        
        detailInfo()
        typeInstinct()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        titleLabel.text = self.textToSet
        mainImageView.image = self.imageToSet
        
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
            addressLabel.text = "서울 노원구 초안산로2길 109 1층"
            timeLabel.text = "-"
            tellLabel.text = "tel 0507-1438-8286"
            tell = 050714388286
            type = 2
        case "밥은화":
            foodTypeLabel.text = "덮밥"
            addressLabel.text = "서울 노원구 초안산로 2길 123 1층"
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
        case "":
            foodTypeLabel.text = ""
            addressLabel.text = ""
            timeLabel.text = ""
            tellLabel.text = ""
        default:
            return
        }
        
    }
    func typeInstinct() {
        switch type {
            case 1:
                mainTitle = ["등심하다","안심하다","카레우동","카레하다"]
                mainPrice = ["9,000원","10,000원","8,500원","8,500원"]
                mainImage = []
            case 2:
                mainTitle = []
                mainPrice = []
                mainImage = []
            case 3:
                mainTitle = []
                mainPrice = []
                mainImage = []
            case 4:
                mainTitle = []
                mainPrice = []
                mainImage = []
            case 5:
                mainTitle = []
                mainPrice = []
                mainImage = []
            default:
                return
                
            }
        
    }
    
    //MARK:- 전화거는 버튼
  
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
    
    
    // collectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.numberOfCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! MenuCollectionViewCell
        //menucollectionviewcell에서 메소드 setUp으로 cell의 레이블,이미지뷰를 데이터 넘겨오기
        // ...ㅜㅜㅜㅜ

        
        
        
        return cell
    }
    
    

    
}


