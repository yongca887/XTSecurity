//
//  NSData+AES.h
//  XTSecurityDemo
//
//  Created by yong on 14/10/28.
//  Copyright (c) 2014年 xtcel.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES)

- (NSData *)AES256EncryptWithKey:(NSString *)key;   //加密
- (NSData *)AES256DecryptWithKey:(NSString *)key;   //解密

@end
