//
//  ViewController.swift
//  QRcode
//
//  Created by 홍승재 on 2022/06/27.
//

import UIKit
import WebKit
import AVFoundation
import QRCodeReader

class MainViewController: UIViewController, QRCodeReaderViewControllerDelegate {
    
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var QRcodeBtn: UIButton!
    
    //QR코드 리더 뷰 컨트롤러 만들기
    // Good practice: create the reader lazily to avoid cpu overload during the
    // initialization and each time we need to scan a QRCode
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
            
            // Configure the view controller (optional)
            $0.showTorchButton        = false
            $0.showSwitchCameraButton = false
            $0.showCancelButton       = false
            $0.showOverlayView        = true
            $0.rectOfInterest         = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()

    //MAKR: - 오버라이드 메서드
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
        
        QRcodeBtn.layer.borderWidth = 3
        QRcodeBtn.layer.borderColor = UIColor.blue.cgColor
        QRcodeBtn.layer.cornerRadius = 10
        QRcodeBtn.addTarget(self, action: #selector(QRcodeReaderLaucn), for: .touchUpInside)
    }

    //MARK: - fileprivate 메서드
    @objc fileprivate func QRcodeReaderLaucn(){
        print("MainViewController - QRcodeReaderLaucn() called")
        // Retrieve the QRCode content
          // By using the delegate pattern
          readerVC.delegate = self

          // Or by using the closure pattern
          readerVC.completionBlock = { (result: QRCodeReaderResult?) in
            print(result)
              
              guard let scannedURLString = result?.value else { return }
              
              print("scannedURLString : \(scannedURLString)")
              let scannedURL = URL(string: scannedURLString)
              
              self.webView.load(URLRequest(url: scannedURL!))
          }

          // Presents the readerVC as modal form sheet
          readerVC.modalPresentationStyle = .formSheet
         
          // 설정된 QR코드 뷰 컨트롤러를 보여준다
          present(readerVC, animated: true, completion: nil)
    }
      
    
    //MARK: - QRcode Reader delegate Method
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()

        dismiss(animated: true, completion: nil)
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()

        dismiss(animated: true, completion: nil)
    }
}

