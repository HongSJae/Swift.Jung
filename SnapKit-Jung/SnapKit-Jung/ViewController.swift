//
//  ViewController.swift
//  SnapKit-Jung
//
//  Created by 홍승재 on 2022/07/09.
//

import UIKit

class ViewController: UIViewController {

    lazy var greenBox = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    lazy var yelloBox = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    lazy var redBox = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    lazy var blueBox = { () -> UIView in
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(greenBox)
        self.view.addSubview(yelloBox)
        self.view.addSubview(redBox)
        self.view.addSubview(blueBox)
        
        greenBox.translatesAutoresizingMaskIntoConstraints = false
        yelloBox.translatesAutoresizingMaskIntoConstraints = false
        redBox.translatesAutoresizingMaskIntoConstraints = false
        blueBox.translatesAutoresizingMaskIntoConstraints = false
//
//        yelloBox.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
//        yelloBox.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8).isActive = true
        yelloBox.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true //왼쪽
        yelloBox.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true //오른쪽
        yelloBox.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        yelloBox.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
//        yelloBox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        yelloBox.centerYAnchor.constraint(equalTo:  self.view.centerYAnchor).isActive = true
    }


}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
    ViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
