//
//  ViewController.swift
//  AppLocalization
//
//  Created by AmanDev on 07/08/18.
//  Copyright © 2018 AmanDev. All rights reserved.
//

import UIKit

class LocalizationVC: UIViewController {

    //IBOutlet
    @IBOutlet weak var viewChange: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnEnglish(_ sender: UIButton) {
        
        BundleLocalization.sharedInstance().language = Languages.English
        LanguageFile.shared.changeLanguage()
        self.view.setTextFields(mainView:self.viewChange.subviews)
    }
    
    @IBAction func btnArabic(_ sender: UIButton) {
        
        BundleLocalization.sharedInstance().language = Languages.Arabic
        LanguageFile.shared.changeLanguage()
        self.view.setTextFields(mainView:self.viewChange.subviews)
    }
}
