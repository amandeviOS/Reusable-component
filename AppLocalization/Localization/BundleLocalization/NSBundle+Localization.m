//
//  ViewController.swift
//  AppLocalization
//
//  Created by AmanDev on 07/08/18.
//  Copyright © 2018 AmanDev. All rights reserved.
//

#import "NSBundle+Localization.h"
#import <objc/runtime.h>
#import "BundleLocalization.h"

@implementation NSBundle (Localization)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        SEL originalSelector = @selector(localizedStringForKey:value:table:);
        SEL swizzledSelector = @selector(customLocaLizedStringForKey:value:table:);
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

#pragma mark - Method Swizzling

-(NSString*) customLocaLizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
    NSBundle* bundle = [BundleLocalization sharedInstance].localizationBundle;
    return [bundle customLocaLizedStringForKey:key value:value table:tableName];
}

@end
