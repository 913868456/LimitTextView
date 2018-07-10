# LimitTextView
带有占位文字的textView,能够限制文字|表情输入. Swift 的 String 类型是基于 Unicode 标量 建立的。 获取字符数根据 str.length来获取,关于字符数的详细计算,请参考 [StringsAndCharacters](https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html)

## Requirement
Swift 4.0+ 
Xcode 9.4+

## 引用简单

- 拷贝GFLimitTextView.swift到项目文件
- 按照下面方式引用即可
```
class ViewController: UIViewController, GFLiimitTextViewDelegate {

    var textView : GFLimitTextView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView = GFLimitTextView.init(frame: CGRect.init(x: 10, y: 80, width: 200, height: 50), placeHolder: "test!")
    
        textView?.delegate = self
        self.view.addSubview(textView!)
        
    }
    
    
    func getTextNum(textNum: Int) {
        print(textNum)
    }
```

![测试动画](https://github.com/913868456/LimitTextView/blob/master/limitText.gif)
