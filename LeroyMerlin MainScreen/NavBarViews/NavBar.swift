//
//  NavBar.swift
//  LeroyMerlin MainScreen
//
//  Created by Артём on 4/26/21.
//

import UIKit

@objc protocol NavBarDelegate: class {
    @objc optional func leftAction()
    @objc optional func rightAction()
}

//@IBDesignable
class NavBar: UIView{
    
    weak var delegate: NavBarDelegate?
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UIView!
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var barcodeButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
//        let bundle = Bundle(for: NavBar.self)
        Bundle.main.loadNibNamed("NavBar", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    

    @IBAction func startSearch(_ sender: Any) {
    }
    
}
