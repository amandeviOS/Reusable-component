//
//  ViewController.swift
//  AppLocalization
//
//  Created by AmanDev on 07/08/18.
//  Copyright © 2018 AmanDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSBundle+Localization.h"

@interface BundleLocalization : NSObject

+ (BundleLocalization*) sharedInstance;
- (void) setLanguage:(NSString*) lang;
// get/set application language
@property (strong, nonatomic) NSString* language;

// get selected localization bundle
@property (weak, readonly) NSBundle* localizationBundle;

@end
