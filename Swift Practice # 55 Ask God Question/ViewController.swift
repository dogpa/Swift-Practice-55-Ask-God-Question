//
//  ViewController.swift
//  Swift Practice # 55 Ask God Question
//
//  Created by CHEN PEIHAO on 2021/8/8.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var showGodGifImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //顯示上層gif
        guard let data = NSDataAsset(name: "Header")?.data else { return }
        let cfData = data as CFData
        CGAnimateImageDataWithBlock(cfData, nil) { (_, cgImage, _) in
                 self.showGodGifImageView.image = UIImage(cgImage: cgImage)
        }
    }


}

