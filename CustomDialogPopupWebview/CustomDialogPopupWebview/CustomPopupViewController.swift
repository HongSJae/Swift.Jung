//
//  CustomPopupViewController.swift
//  CustomDialogPopupWebview
//
//  Created by 홍승재 on 2022/06/25.
//

import UIKit

class CustomPopupViewController: UIViewController {
    
    @IBOutlet weak var contantView: UIView!
    
    @IBOutlet weak var FollowBtn: UIButton!
    
    @IBOutlet weak var BGBtn: UIButton!
    
    var FollowBtnCompletionClosure: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CustomPopupViewController - viewDidLoad() called")
        contantView.layer.cornerRadius = 30
        FollowBtn.layer.cornerRadius = 10
    }
    @IBAction func onbgBtnclicked(_ sender: UIButton) {
        print("CustomPopupViewController - onbgBtnclicked() called")
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func onFollowBtnClicked(_ sender: UIButton) {
        print("CustomPopupViewController - onFollowBtnClicked() called")
        
        self.dismiss(animated: true, completion: nil)
        
        //컴플레션 블럭 호출
        if let FollowBtnCompletionClosure = FollowBtnCompletionClosure {
            //메인에 알린다
            FollowBtnCompletionClosure()
        }
    }
    
    
}
