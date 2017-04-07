# LimitTextView
   带有占位文字的textView,能够限制文字|表情输入
   Swift 的 String 类型是基于 Unicode 标量 建立的。 Unicode 标量是对应字符或者修饰符的唯一的21位数字,注意不是所有的21位 Unicode 标量都代表一个字符，因为有一些标量是留作未来分配的。所以部分Unicode标量可能代表两个字符,textView的字符数,是根据textView.text.characters.count来获取的,所以可能一个emoji表情占用两个字符.
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
