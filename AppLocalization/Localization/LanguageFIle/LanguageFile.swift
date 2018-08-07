//
//  LanguageFile.swift
//  Wade7Student
//
//  Created by OSX on 22/12/17.
//  Copyright © 2017 OSX. All rights reserved.
//

import UIKit

internal struct Languages {
    static let Arabic = "ar"
    static let English = "en"
    //static let french = "fr"
}

class LanguageFile: NSObject {
    
    //MARK: SetLanguage
    static let shared = LanguageFile()
  
    //change app laguage
    func changeLanguage(){
        
        if BundleLocalization.sharedInstance().language == Languages.English {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            
        }
        else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
        self.initializeStoryboard()
    }
    
    //Set root view controller when logout in app
    func initializeStoryboard(){
        let delegate = UIApplication.shared.delegate as? AppDelegate
        UIView.transition(with: (delegate?.window)!, duration: 0.5, options:
            
            UIViewAnimationOptions.transitionFlipFromLeft, animations: {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let LocalizationVC = storyBoard.instantiateViewController(withIdentifier: "LocalizationVC") as! LocalizationVC
            let vc : UINavigationController = UINavigationController(rootViewController: LocalizationVC)
            delegate?.window?.rootViewController = vc
            vc.navigationBar.isHidden = true
        }, completion: nil)
    }
}

//UIView localize
extension UIView{
    
    func setTextFields(mainView : [UIView]){
        for view in mainView{
            if view is UITextField {
                let txtField = view as? UITextField
                txtField?.textAlignment = setTexts()
            }else if view is UITextView {
                let txtView = view as? UITextView
                txtView?.textAlignment = setTexts()
            }
            else if view is UIButton{
                    (view as? UIButton)?.setAlignment()
                }
            else if view is UILabel{
                (view as? UILabel)?.setLabelAlignment()
            }else{
                setTextFields(mainView: view.subviews)}
        }
    }
    
    func scaleButton(button : UIButton?){
        if let widthTitle = button?.titleLabel?.frame.size.width, let widthImage = button?.imageView?.frame.size.width{
            button?.titleEdgeInsets = UIEdgeInsetsMake(0, -widthTitle - 4, 0, -widthTitle)
            button?.imageEdgeInsets = UIEdgeInsetsMake(0, -widthImage, 0, -widthImage - 4)
        }
    }
    
    func setTexts() -> NSTextAlignment{
        if BundleLocalization.sharedInstance().language == Languages.Arabic{
            return .right
        }
        else {
            return .left
        }
    }
}

//UIbutton localize
extension UIButton{
    func setAlignment() {
        if(self.contentHorizontalAlignment != .center){
        if BundleLocalization.sharedInstance().language == Languages.Arabic{
            self.contentHorizontalAlignment = .right
        }else {
            self.contentHorizontalAlignment = .left
        }}}
}

//UILabel localize
extension UILabel{
    func setLabelAlignment() {
        if(self.textAlignment != .center){
        if BundleLocalization.sharedInstance().language == Languages.Arabic{
            self.textAlignment = .right
        }else {
            self.textAlignment = .left
        }}}
}

