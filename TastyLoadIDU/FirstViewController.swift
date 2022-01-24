//
//  FirstViewController.swift
//  TastyLoadIDU
//
//  Created by 최기훈 on 2022/01/24.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Storage.isFirstTime()
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func nextView(_ sender: UIButton) {
        presentMainVC()
    }
    
    
    private func presentMainVC() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false, completion: nil)
        }

}

public class Storage {
    static func isFirstTime() -> Bool {
        let defaults = UserDefaults.standard
        if defaults.object(forKey: "isFirstTime") == nil {
            defaults.set("No", forKey:"isFirstTime")
            return true
        } else {
            return false
        }
    }
}
