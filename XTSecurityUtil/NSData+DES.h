//
//  NSData+DES.h
//  XTSecurityDemo
//
//  Created by yong on 14/10/28.
//  Copyright (c) 2014年 xtcel.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (DES)

- (NSData *)DESEncryptWithKey:(NSString *)key;
- (NSString *)DESDecryptWithKey:(NSString *)key;

@end
