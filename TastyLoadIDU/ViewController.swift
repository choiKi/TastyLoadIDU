//
//  ViewController.swift
//  TastyLoadIDU
//
//  Created by 최기훈 on 2022/01/14.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  , UISearchBarDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!

    var cellIdentifier: String = "cell"
    
    var recommenation: [String] = [String]()
    let cafeteria: [String] = ["하다식당","민들레 초밥","밥은화","갱스터 떡볶이","노랑통닭","곤지암 소머리국밥 & 순대국","토박이 순대국","휘경 곱창","피자굽는 오빠","보배반점"]
    var recommenationImage: [String] = [String]()
    let cafeteriaImage: [String] = ["하다식당","민들레 초밥","밥은화","갱스터 떡볶이","노랑통닭","곤지암 소머리국밥 & 순대국","토박이 순대국","휘경 곱창","피자굽는 오빠","보배반점"]
    
    var filteredData: [String]!
    var filteredDataImage: [String]!
    var searchOn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.searchBar.delegate = self
        
        filteredData = cafeteria
        filteredDataImage = cafeteriaImage
        
        randomChoose()
    }
    
    func randomChoose(){
        let allCount: Int = cafeteria.count
        let random1 = Int.random(in: 0 ..< allCount)
        var random2 = Int.random(in: 0 ..< allCount)
        var random3 = Int.random(in: 0 ..< allCount)
        
        // 서로 다른 값이 나올 때 까지
        while random1 == random2 || random1 == random3 || random2 == random3 {
            random2 = Int.random(in: 0 ..< allCount)
            random3 = Int.random(in: 0 ..< allCount)
        }
        // random으로 뽑은값 배열에 집어넣
        recommenation.insert(cafeteria[random1], at: 0)
        recommenation.insert(cafeteria[random2], at: 1)
        recommenation.insert(cafeteria[random3], at: 2)
        recommenationImage.insert(cafeteriaImage[random1], at: 0)
        recommenationImage.insert(cafeteriaImage[random2], at: 1)
        recommenationImage.insert(cafeteriaImage[random3], at: 2)
        
    }
    

     
     
   // section의 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    // section별 cell 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            guard searchOn == false else {
                return 0
            }
            return recommenation.count
        case 1:
            return filteredData.count
        default:
            return 0
        }
    }

    // cell 별 나타내어지는 값
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        var sectionText: String = ""
        var imageView = ""
        switch indexPath.section {
        case 0:
            if searchOn == false {
                sectionText = recommenation[indexPath.row]
                imageView = recommenationImage[indexPath.row]
            }else {
                sectionText = ""
                imageView = ""
            }
        case 1:
            sectionText = filteredData[indexPath.row]
            imageView = filteredDataImage[indexPath.row]
        default:
            sectionText = filteredData[indexPath.row]
            imageView = filteredDataImage[indexPath.row]
        }
        cell.textLabel?.text = sectionText
        cell.imageView?.image = UIImage(named: "\(imageView)")
        return cell
    }
    // section title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            guard searchOn == true else {
               return  "오늘의 추천"
            }
            return ""
        case 1:
            guard searchOn == true else {
                return "주변식당 찾기"
            }
            return "검색 결과"
        default:
            return "배달"
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        filteredDataImage = []
        
        if searchText == "" {
            filteredData = cafeteria
            filteredDataImage = cafeteriaImage
            searchOn = false
        }else {
            searchOn = true
            for i in cafeteria {
                if i.lowercased().contains(searchText.lowercased()){
                    filteredData.append(i)
                    filteredDataImage.append(i)

                }
            }
        }
        self.tableView.reloadData()
    }
    
     // 다른 페이지로 값 넘기기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    
        guard let nextViewController: DetailView = segue.destination as? DetailView else {
            return
        }
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        nextViewController.textToSet = cell.textLabel?.text
        nextViewController.imageToSet = cell.imageView?.image
    }


    
}

