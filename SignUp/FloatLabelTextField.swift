import UIKit

@IBDesignable class FloatLabelTextField: UITextField {
    var titleLabel = UILabel()
    let bottomLineView = UIView()
    
    // MARK:- Properties
    override var accessibilityLabel:String? {
        get {
            if let txt = text , txt.isEmpty {
                return titleLabel.text
            } else {
                return text
            }
        }
        set {
            self.accessibilityLabel = newValue
        }
    }
    
    override var placeholder:String? {
        didSet {
            titleLabel.text = placeholder
            titleLabel.sizeToFit()
        }
    }
    
    override var attributedPlaceholder:NSAttributedString? {
        didSet {
            titleLabel.text = attributedPlaceholder?.string
            titleLabel.sizeToFit()
        }
    }
    
    var titleFont:UIFont = UIFont.boldSystemFont(ofSize: 15.0) {
        didSet {
            titleLabel.font = titleFont
            titleLabel.sizeToFit()
        }
    }
    
    @IBInspectable var hintLabelYPadding:CGFloat = 0.0
    
    @IBInspectable var titleLabelYPadding:CGFloat = 0.0 {
        didSet {
            var r = titleLabel.frame
            r.origin.y = titleLabelYPadding
            titleLabel.frame = r
        }
    }
    
    @IBInspectable var titleTextColour:UIColor = UIColor.gray {
        didSet {
            if !isFirstResponder {
                titleLabel.textColor = titleTextColour
                bottomLineView.backgroundColor = titleLabel.textColor
            }
        }
    }
    @IBInspectable var titleActiveTextColour:UIColor! {
        didSet {
            if isFirstResponder {
                titleLabel.textColor = titleActiveTextColour
                bottomLineView.backgroundColor = titleLabel.textColor

            }
        }
    }
    
    // MARK:- Init
    required init?(coder aDecoder:NSCoder) {
        super.init(coder:aDecoder)
        setup()
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        setup()
    }
    
    // MARK:- Overrides
    override func layoutSubviews() {
        super.layoutSubviews()
        setTitlePositionForTextAlignment()
        setViewPosition()
        let isResp = isFirstResponder
        if let _ = text ,  isResp {
            titleLabel.textColor = titleActiveTextColour
        } else {
            titleLabel.textColor = titleTextColour
        }
        bottomLineView.backgroundColor = titleLabel.textColor
        // Should we show or hide the title label?
        if let txt = text , txt.isEmpty {
            // Hide
            if isResp {
                showTitleLabel(isResp)
            } else {
                hideTitleLabel(isResp)
            }
        } else {
            // Show
            showTitleLabel(isResp)
        }
    }
    
    override func textRect(forBounds bounds:CGRect) -> CGRect {
        var r = super.textRect(forBounds: bounds)
            var top = ceil(titleLabel.font.lineHeight + hintLabelYPadding)
            top = min(top, maxTopInset())
            r = UIEdgeInsetsInsetRect(r, UIEdgeInsetsMake(top, 0.0, 0.0, 0.0))
        return r.integral
    }
    
    override func editingRect(forBounds bounds:CGRect) -> CGRect {
        var r = super.editingRect(forBounds: bounds)
            var top = ceil(titleLabel.font.lineHeight + hintLabelYPadding)
            top = min(top, maxTopInset())
            r = UIEdgeInsetsInsetRect(r, UIEdgeInsetsMake(top, 0.0, 0.0, 0.0))
        return r.integral
    }
    
    override func clearButtonRect(forBounds bounds:CGRect) -> CGRect {
        var r = super.clearButtonRect(forBounds: bounds)
            var top = ceil(titleLabel.font.lineHeight + hintLabelYPadding)
            top = min(top, maxTopInset())
            r = CGRect(x:r.origin.x, y:r.origin.y + (top * 0.5), width:r.size.width, height:r.size.height)
        return r.integral
    }
    
    // MARK:- Public Methods
    
    // MARK:- Private Methods
    fileprivate func setup() {
        borderStyle = UITextBorderStyle.none
        titleActiveTextColour = tintColor
        // Set up title label
        titleLabel.alpha = 0.0
        titleLabel.font = titleFont
        titleLabel.textColor = titleTextColour
        bottomLineView.backgroundColor = titleLabel.textColor
        if let str = placeholder , !str.isEmpty {
            titleLabel.text = str
            titleLabel.sizeToFit()
        }
        self.addSubview(titleLabel)
        self.addSubview(bottomLineView)
        self.layer.masksToBounds = true

    }
    fileprivate func maxTopInset()->CGFloat {
        if let fnt = font {
            return max(0, floor(bounds.size.height - fnt.lineHeight - 4.0))
        }
        return 0
    }
    
    fileprivate func setTitlePositionForTextAlignment() {
        let r = textRect(forBounds: bounds)
        var x = r.origin.x
        if textAlignment == NSTextAlignment.center {
            x = r.origin.x + (r.size.width * 0.5) - titleLabel.frame.size.width
        } else if textAlignment == NSTextAlignment.right {
            x = r.origin.x + r.size.width - titleLabel.frame.size.width
        }
        titleLabel.frame = CGRect(x:x, y:titleLabel.frame.origin.y, width:titleLabel.frame.size.width, height:titleLabel.frame.size.height)
    }
    fileprivate func setViewPosition() {
        let width = CGFloat(2.0)
        bottomLineView.frame = CGRect(x: 0, y: self.frame.size.height - width - 5, width:  self.frame.size.width, height: 1)
    }
    fileprivate func showTitleLabel(_ animated:Bool) {
        
        let dur = animated ? 0.3 : 0
        UIView.animate(withDuration: dur, delay:0, options: [UIViewAnimationOptions.beginFromCurrentState, UIViewAnimationOptions.curveEaseOut], animations:{
            // Animation
            self.titleLabel.alpha = 1.0
            var r = self.titleLabel.frame
            r.origin.y = self.titleLabelYPadding
            self.titleLabel.frame = r
        }, completion:nil)
    }
    
    fileprivate func hideTitleLabel(_ animated:Bool) {
        let dur = animated ? 0.3 : 0
        UIView.animate(withDuration: dur, delay:0, options: [UIViewAnimationOptions.beginFromCurrentState, UIViewAnimationOptions.curveEaseIn], animations:{
            // Animation
            self.titleLabel.alpha = 0.0
            var r = self.titleLabel.frame
            r.origin.y = self.titleLabel.font.lineHeight + self.hintLabelYPadding
            self.titleLabel.frame = r
        }, completion:nil)
    }
}
