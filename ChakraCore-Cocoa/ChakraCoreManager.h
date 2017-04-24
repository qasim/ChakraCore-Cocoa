//
//  ChakraCoreManager.h
//  ChakraCore-Cocoa
//
//  Created by Qasim Iqbal on 2017-04-24.
//  Copyright © 2017 Qasim Iqbal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChakraCoreManager : NSObject

- (nonnull NSString *)executeJavaScriptFromSourcePath:(nonnull NSString *)sourcePath;

@end
