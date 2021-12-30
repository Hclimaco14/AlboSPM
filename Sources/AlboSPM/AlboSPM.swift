import UIKit

public enum Colours {

    public static let indigo       = UIColor(red:0.22, green:0.26, blue:0.67, alpha:1.0)
    public static let cellHeader   = UIColor(red: (250/255.0), green: (250/255.0), blue: (250/255.0), alpha: 1.0)
    public static let neutral =  UIColor(red:0.59, green:0.61, blue:0.63, alpha:1.0)
}

public enum SpaceUnits {
    public static let one:CGFloat = 8
    public static let two:CGFloat = 16
}

public class HeaderView: UIView {
        
    public lazy var textView:UITextView = {
        let tView                = UITextView()
        tView.isEditable         = false
        tView.isSelectable       = false
        tView.textContainerInset = UIEdgeInsets.zero
        tView.isScrollEnabled    = false
        tView.textContainer.lineFragmentPadding = 0
        tView.backgroundColor = .clear
        return tView
    }()

    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment    = .bottom
        stackView.distribution = .fill
        stackView.spacing      = SpaceUnits.two
        return stackView
    }()
    

    
    public init(text: NSAttributedString?, atY y: CGFloat, width: CGFloat) {
        
        let theframe = CGRect(x: 0, y: y, width: width, height: CGFloat(SpaceUnits.one * 6))
        super.init(frame: theframe)
        backgroundColor = Colours.cellHeader
        addComponents()
        layoutComponents()
        if let attribute = text {
            textView.attributedText = attribute
            textView.textColor = Colours.neutral
        }
    }
    override public init(frame: CGRect) { super.init(frame: frame) }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }


    private func addComponents() {
        rootStackView.addArrangedSubview(textView)
        addSubview(rootStackView)
    }


    private func layoutComponents() {
        NSLayoutConstraint.activate([
            rootStackView.heightAnchor.constraint(equalToConstant: SpaceUnits.one * 6),
            rootStackView.leadingAnchor.constraint(equalTo:  leadingAnchor,  constant: SpaceUnits.two),
            rootStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(SpaceUnits.two)),
            rootStackView.topAnchor.constraint(equalTo:      topAnchor,      constant: 0),
            rootStackView.bottomAnchor.constraint(equalTo:   bottomAnchor,   constant: 0),
            textView.heightAnchor.constraint(equalToConstant: SpaceUnits.one * 3),
            textView.bottomAnchor.constraint(equalTo:  bottomAnchor,   constant: 0),
        ])
    }
}
