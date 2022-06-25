//
//  ViewController.swift
//  CustomDialogPopupWebview
//
//  Created by 홍승재 on 2022/06/25.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var MyWebView: WKWebView!
    @IBOutlet weak var creatPopupBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onCreatPopupBtnClicked(_ sender: UIButton) {
        print("ViewController - onCreatPopupBtnClicked() called")
        
        //스토리보드 가져오기
        let storyboard = UIStoryboard.init(name: "Popup", bundle: nil)
        //스토리보드를 통해 뷰 컨트롤러 가져오기
        let customPopupVC = storyboard.instantiateViewController(withIdentifier: "AlertPopupVC") as! CustomPopupViewController
        //뷰 컨트롤러가 보여지는 스타일
        customPopupVC.modalPresentationStyle = .overCurrentContext
        //뷰 컨트롤러가 사라지는 스타일
        customPopupVC.modalTransitionStyle = .crossDissolve
        
        customPopupVC.FollowBtnCompletionClosure = {
            print("컴플레션 블럭이 호출되었다")
            let MyChennelUrl = URL(string: "https://github.com/HongSJae")
            self.MyWebView.load(URLRequest(url: MyChennelUrl!))
        }
        
        self.present(customPopupVC, animated: true, completion: nil)
    }
    
}

