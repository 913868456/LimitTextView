//
//  ViewController.swift
//  GFTextViewLimitTextDemo
//
//  Created by ECHINACOOP1 on 2017/4/5.
//  Copyright © 2017年 蔺国防. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GFLiimitTextViewDelegate {

    var textView : GFLimitTextView?
    var label    : UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView = GFLimitTextView.init(frame: CGRect.init(x: 10, y: 80, width: 200, height: 50), placeHolder: "test!")
    
        textView?.delegate = self
        self.view.addSubview(textView!)
        
        label = UILabel.init(frame: CGRect.init(x: 20, y: 150, width: 50, height: 30))
        self.view.addSubview(label!)
        
    }
    
    
    func getTextNum(textNum: Int) {
        label?.text = String(textNum)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

