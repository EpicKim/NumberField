//
//  NumberKeyboard.swift
//  mos
//
//  Created by Kenneth on 8/12/2016.
//  Copyright © 2016 HCG. All rights reserved.
//

import UIKit

protocol NumberKeyboardDelegate: class {
    func numberTapped(number: Int)
    func specialKeyTapped()
    func backspaceTapped()
    func minusTapped()
    func increasedTapped()
    func confirmTapped()
}

class NumberKeyboard: UIView {
    weak var delegate: NumberKeyboardDelegate?
    
    @IBOutlet weak var specialKeyButton: UIButton!
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet weak var backspaceButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var increasedButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        let bundle = Bundle(for: NumberKeyboard.classForCoder())
        let view = bundle.loadNibNamed("NumberKeyboard", owner: self, options: nil)?.first as! UIView
        self.addSubview(view)
        view.frame = self.bounds
        
        for nButton in numberButtons {
            nButton.titleLabel!.font = UIFont.systemFont(ofSize: 19)
        }
        minusButton.titleLabel!.font = UIFont.systemFont(ofSize: 19)
        increasedButton.titleLabel!.font = UIFont.systemFont(ofSize: 19)
    }
    
    // MARK: Actions
    @IBAction func keyTapped(sender: UIButton) {
        self.delegate?.numberTapped(number: Int(sender.titleLabel!.text!)!)
    }
    
    @IBAction func specialKeyTapped(sender: UIButton) {
        self.delegate?.specialKeyTapped()
    }
    
    @IBAction func backspace(sender: UIButton) {
        self.delegate?.backspaceTapped()
    }
    
    @IBAction func minusTapped(_ sender: UIButton) {
        self.delegate?.minusTapped()
    }
    
    @IBAction func increaseTapped(_ sender: UIButton) {
        self.delegate?.increasedTapped()
    }
    
    @IBAction func confirmTapped(_ sender: UIButton) {
        self.delegate?.confirmTapped()
    }
}
