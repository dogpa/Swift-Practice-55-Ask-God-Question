//
//  AskSoethingViewController.swift
//  Swift Practice # 55 Ask God Question
//
//  Created by CHEN PEIHAO on 2021/8/8.
//

import UIKit

class AskSoethingViewController: UIViewController {
    //上面顯示gif的uiimage
    @IBOutlet weak var askSomgthingGifUIImageView: UIImageView!
    //輸入問事的內容textField
    @IBOutlet weak var questionTextField: UITextField!
    //輸入城隍爺的回答
    @IBOutlet weak var showAnswerLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //顯示Gif
        guard let data = NSDataAsset(name: "Header")?.data else { return }
        let cfData = data as CFData
        CGAnimateImageDataWithBlock(cfData, nil) { (_, cgImage, _) in
                 self.askSomgthingGifUIImageView.image = UIImage(cgImage: cgImage)
        }

        // Do any additional setup after loading the view.
    }
    
    //return收鍵盤
    @IBAction func closeKeyboard(_ sender: UITextField) {
    }
    
    
    //buttonAction透過輸入內容判斷label顯示的內容
    @IBAction func startToAskGod(_ sender: UIButton) {
        let questionToAsk = questionTextField.text
        if questionToAsk?.contains("疫情") == true {
            showAnswerLabel.text = "需要疫苗"
        }else if questionToAsk?.contains("愛情") == true {
            showAnswerLabel.text = "好好珍惜"
        }else if questionToAsk?.contains("事業") == true {
            showAnswerLabel.text = "事在人為"
        }else if questionToAsk?.contains("家庭") == true {
            showAnswerLabel.text = "努力維持"
        }else if questionToAsk?.contains("生命") == true {
            showAnswerLabel.text = "持續探索"
        }else if questionToAsk?.contains("學業") == true {
            showAnswerLabel.text = "用功唸書"
        }else{
            showAnswerLabel.text = "信徒請自思"
        }
    }
    



}
