//
//  BookDetailViewController.swift
//  Books
//
//  Created by yongseok lee on 2022/07/21.
//

import UIKit

class BookDetailViewController: UIViewController {

    static let identifier = "BookDetailViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func webButtonClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: "BookDetail", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: WebViewController.identifier)
        guard let navi =  self.navigationController else {
            print("navi nil error")
                  return}
        navi.pushViewController(vc, animated: true)
        
    }
    
  

}
