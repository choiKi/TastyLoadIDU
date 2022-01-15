//
//  ViewController.swift
//  TastyLoadIDU
//
//  Created by 최기훈 on 2022/01/14.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var starOnButton: UIButton!

    let cellIdentifier: String = "cell"
    var starSwitch: Bool = false
    
    var starMark: [String] = []
    let cafeteria: [String] = ["하다식당","민들레 초밥","밥은화","갱스터 떡볶이","노랑통닭","곤지암 소머리국밥 & 순대국","토박이 순대국","휘경 곱창","피자굽는 오빠","보배반점"]
    var starMarkImage: [String] = []
    let cafeteriaImage: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func randomChoose(){
        let allCount: Int = cafeteria.count
        let random = Int.random(in: 0 ..< allCount)
        // random으로 뽑은값 배열에 집어넣기
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return starMark.count
        case 1:
            return cafeteria.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        var sectionText: String = ""
        var imageView = ""
        switch indexPath.section {
        case 0:
            sectionText = starMark[indexPath.row]
        case 1:
            sectionText = cafeteria[indexPath.row]
        default:
            sectionText = cafeteria[indexPath.row]
        }
        cell.textLabel?.text = sectionText
        cell.imageView?.image = UIImage(named: "\(imageView)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "오늘의 추천"
        case 1:
            return "주변식당 찾기"
        default:
            return "배달"
        }
    }
    
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

