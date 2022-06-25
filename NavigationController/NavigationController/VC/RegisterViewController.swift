//
//  RegisterViewController.swift
//  NavigationController
//
//  Created by 홍승재 on 2022/06/25.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var BtnForLoginViewController: UIButton!
    
    //뷰가 생성되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //상단 네비게이션 바를 숨긴다
        self.navigationController?.isNavigationBarHidden = true
    }
    @IBAction func onLoginViewControllerBtnClicked(_ sender: UIButton) {
        
        print("RegisterViewController - onLoginViewControllerBtnClicked() called ")
        
        //네비게이션 뷰 컨트롤러를 팝한다
        self.navigationController?.popViewController(animated: true)
    }
    

}

