//
//  GFLimitTextView.swift
//  GFTextViewLimitTextDemo
//
//  Created by ECHINACOOP1 on 2017/4/6.
//  Copyright © 2017年 蔺国防. All rights reserved.
//

import UIKit

let limitTextNum = 10  //限制文字字数
let textFont = UIFont.systemFont(ofSize: 17) //文本字体
let placeHeight = 30  //占位label的高度


///return textView.text.Characters.count 返回textView的字数
@objc protocol GFLiimitTextViewDelegate: NSObjectProtocol{

    @objc optional func getTextNum(textNum: Int)

}

class GFLimitTextView: UIView, UITextViewDelegate {
    
    //MARK: - Properties
    var textView: UITextView!
    var placeLabel: UILabel!
    
    var placeText : String?
    var characterNum = 0
    weak var delegate: GFLiimitTextViewDelegate?
    
    //MARK: - LifeCycle
    init(frame: CGRect, placeHolder: String?) {
        
        super.init(frame: frame)
        placeText = placeHolder
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Actions
    func setup() {
    
        textView = UITextView.init(frame: CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        textView.font = textFont
        textView.layer.cornerRadius = 5
        textView.layer.masksToBounds = true
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 1
        textView.tintColor = UIColor.lightGray
        textView.delegate = self
        
        addSubview(textView!)
        
        placeLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: self.frame.width, height: CGFloat(placeHeight)))
        placeLabel?.text = placeText
        placeLabel.font = textFont
        placeLabel.textColor = UIColor.lightGray
        addSubview(placeLabel!)
    }
    
    //MARK: - UITextViewDelegate
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        
        placeLabel.isHidden = true
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if characterNum == 0 {
            placeLabel!.isHidden = false
        }else{
            placeLabel!.isHidden = true
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        let str = textView.text ?? "";
        characterNum = str.count;
        
        if characterNum > limitTextNum {
            let startIndex = str.startIndex;
            let endIndex = str.index(startIndex, offsetBy: limitTextNum);
            let range = startIndex..<endIndex;
            textView.text = String(str[range]);
            
            characterNum = limitTextNum
        }
        self.delegate?.getTextNum!(textNum: characterNum)
    }
    
    //重写hitTest方法,来处理在View点击外区域收回键盘
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        if self.isUserInteractionEnabled == false && self.alpha <= 0.01 && self.isHidden == true {
            
            return nil
        }
        
        if self.point(inside: point, with: event) == false {
            textView?.resignFirstResponder()
            return nil
        }else{
            
            for subView in self.subviews.reversed() {
                
                let convertPoint = subView.convert(point, from: self)
                let hitTestView = subView.hitTest(convertPoint, with: event)
                if (hitTestView != nil) {
                    return hitTestView
                }
            }
            return self
        }
    }
    
}
