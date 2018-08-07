//
//  ViewController.swift
//  AppLocalization
//
//  Created by AmanDev on 07/08/18.
//  Copyright © 2018 AmanDev. All rights reserved.
//

#import "BundleLocalization.h"
#import "NSBundle+Localization.h"


@implementation BundleLocalization
{
    NSString* selectedLanguage;
}

+ (BundleLocalization*) sharedInstance {
    @synchronized(self) {
        static BundleLocalization* instance = nil;
        if (instance == nil) {
            instance = [[BundleLocalization alloc] init];
        }
        return instance;
    }
}

- (id) init {
    self = [super init];
    if (self) {
        // use systems main bundle as default bundle
        _localizationBundle = [NSBundle mainBundle];
    }
    return self;
}

- (void) setLanguage:(NSString*) lang {
    // path to this languages bundle
    NSString *path = [[NSBundle mainBundle] pathForResource:lang ofType:@"lproj"];
    if (path == nil) {
        // there is no bundle for that language
        // use main bundle instead
        _localizationBundle = [NSBundle mainBundle];
    } else {
        // use this bundle as my bundle from now on:
        _localizationBundle = [NSBundle bundleWithPath:path];
        // to be absolutely sure (this is probably unnecessary):
        if (_localizationBundle == nil) {
            _localizationBundle = [NSBundle mainBundle];
        }
        selectedLanguage = lang;
    }
}

- (NSString*) language{
    if(_localizationBundle == [NSBundle mainBundle]) {
        return [[NSBundle mainBundle] preferredLocalizations].firstObject;
    }else {
        return selectedLanguage;
    }
}

@end
