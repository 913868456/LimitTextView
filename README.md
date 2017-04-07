# LimitTextView
带有占位文字的textView,能够限制文字输入,支持emoji表情输入,表情输入按一个字符处理
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

