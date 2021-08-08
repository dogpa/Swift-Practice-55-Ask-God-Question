//
//  DrawStickViewController.swift
//  Swift Practice # 55 Ask God Question
//
//  Created by CHEN PEIHAO on 2021/8/8.
//

import UIKit

class DrawStickViewController: UIViewController {
    //顯示gif
    @IBOutlet weak var drawStickGifUIImageView: UIImageView!
    //求籤的textfield
    @IBOutlet weak var somethingToAskGodTextField: UITextField!
    //顯示求得簽號
    @IBOutlet weak var showStickResultLabel: UILabel!
    //顯示筊杯結果
    @IBOutlet weak var bueImageView: UIImageView!
    //顯示解籤網站的網址
    @IBOutlet weak var websiteTextView: UITextView!
    //定義空的數字類型ARRAY
    var stickNumberArray = [Int]()
    
    
    let buePhotoArray = ["聖筊","聖筊","笑筊","陰筊"]
    
    let alertTitle = ["城隍爺同意","城隍爺同意","城隍爺深思不解","城隍爺略有意見"]
    let alertMessage = ["請點選下方網址解籤","請點選下方網址解籤","可能要重新問清楚","可能要重抽一支"]
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //顯示上層gif
        guard let data = NSDataAsset(name: "Header")?.data else { return }
        let cfData = data as CFData
        CGAnimateImageDataWithBlock(cfData, nil) { (_, cgImage, _) in
                 self.drawStickGifUIImageView.image = UIImage(cgImage: cgImage)
        }


        
        // Do any additional setup after loading the view.
    }

    
    //輸入完後按return離開
    @IBAction func returnToLeave(_ sender: UITextField) {
    }
    //顯示求籤的號碼
    @IBAction func showStickNumber(_ sender: UIButton) {
        for i in 1...100 {
            stickNumberArray.append(i)
        }
        if somethingToAskGodTextField.text == "" {
            showStickResultLabel.text = "請輸入求籤的內容"
            showStickResultLabel.textColor = .white
            websiteTextView.text = ""
        }else{
            let stickRuselt = stickNumberArray.randomElement()
            showStickResultLabel.text = "信徒抽到 \(stickRuselt!) 號籤，請筊杯確認"
            showStickResultLabel.textColor = .black
            var webNumber = ""
            if stickRuselt! < 10 {
                webNumber = "00\(stickRuselt!)"
            }else if stickRuselt! > 9 && stickRuselt! < 100 {
                webNumber = "0\(stickRuselt!)"
            }else{
                webNumber = "\(stickRuselt!)"
            }
            websiteTextView.text = "http://www.weiling.org.tw/xPoem/PoemDetail?PoemID=\(webNumber)"
            
        }
    }
    
    func yesOrNot (index:Int) {

        bueImageView.image = UIImage(named: "\(buePhotoArray[index])圖")

        let alertController = UIAlertController(title: "\(alertTitle[index])", message: "\(alertMessage[index])", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "了解", style: .default)
                    alertController.addAction(okAction)
                    present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func godSayYesOrNo(_ sender: UIButton) {
        let godReuslt = Int.random(in: 0...3)
        if websiteTextView.text == "" {
            websiteTextView.isHidden = true
        }else{
            if godReuslt == 0 {
                yesOrNot(index: 0)
                websiteTextView.isHidden = false
            }else if godReuslt == 1 {
                yesOrNot(index: 1)
                websiteTextView.isHidden = false
            }else if godReuslt == 2 {
                yesOrNot(index: 2)
                websiteTextView.isHidden = true
            }else{
                yesOrNot(index: 3)
                websiteTextView.isHidden = true
            }
        }
    }
    

   
}
