//
//  RoundButton.swift
//  FaceEngineMobileDemo
//
//  Created on 31.10.16.
//  Copyright © 2016 Vision Labs. All rights reserved.
//

import UIKit

class RoundButton: UIButton {

    let bgColor: UIColor = Colors.blue
    let highlightedBgColor: UIColor = Colors.lavender
    let disabledBgColor: UIColor = Colors.alto
    let borderWidth: CGFloat = 2
    let cornerEnabled: Bool = true
    let borderColor: UIColor = Colors.blue
    let shadowColor: UIColor = .black
    let shadowRadius: CGFloat = 12
    let shadowOpacity: Float = 0.2
    let shadowOffset: CGSize = CGSize(width: 0, height: 4)
    
    override func awakeFromNib() {
        setupUI()
        
        addTarget(self, action: #selector(touchDown), for: .touchDown)
        addTarget(self, action: #selector(touchUp), for: [.touchUpInside, .touchCancel, .touchUpOutside])
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if cornerEnabled {
            layer.cornerRadius = min(frame.width, frame.height) / 2.0
        }
    }
    
    func setupUI() {
        backgroundColor = isEnabled ? bgColor : disabledBgColor
        layer.borderWidth   = borderWidth
        layer.borderColor   = borderColor.cgColor
        layer.shadowRadius  = shadowRadius
        layer.shadowOffset  = shadowOffset
        layer.shadowColor   = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        if cornerEnabled {
            layer.cornerRadius = min(frame.width, frame.height) / 2.0
        }
    }
    
    override var isEnabled: Bool {
        get {
            return super.isEnabled
        }
        set {
            if newValue != isEnabled {
                UIView.animate(withDuration: 0.1) {
                    self.backgroundColor = newValue ? self.bgColor : self.disabledBgColor
                    self.layer.borderColor = newValue ? self.borderColor.cgColor : self.disabledBgColor.cgColor
                    self.layer.shadowOpacity = newValue ? self.shadowOpacity : 0
                }
                if newValue {
                    showShadow()
                } else {
                    hideShadow()
                }
            }
            super.isEnabled = newValue
        }
    }
    
    @objc
    private func touchDown() {
        hideShadow()
        UIView.animate(withDuration: 0.2) {
            self.backgroundColor = self.highlightedBgColor
        }
    }
    
    @objc
    private func touchUp() {
        showShadow()
        UIView.animate(withDuration: 0.2) {
            self.backgroundColor = self.bgColor
        }
    }
    
    private func hideShadow() {
        let animation = CABasicAnimation(keyPath: "shadowOpacity")
        animation.fromValue = shadowOpacity
        animation.toValue = 0
        animation.duration = 0.2
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        layer.add(animation, forKey: "basic")
    }
    
    private func showShadow() {
        let animation = CABasicAnimation(keyPath: "shadowOpacity")
        animation.fromValue = 0
        animation.toValue = shadowOpacity
        animation.duration = 0.25
        animation.isRemovedOnCompletion = true
        layer.add(animation, forKey: "basic")
    }

}
