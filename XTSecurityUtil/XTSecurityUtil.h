//
//  XTSecurityUtil.h
//  XTSecurityDemo
//
//  Created by yong on 14/10/28.
//  Copyright (c) 2014年 xtcel.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XTSecurityUtil : NSObject

#pragma mark - AES加密、解密
//将string转成带密码的data
+ (NSData*)encryptAESData:(NSString*)string;
//将带密码的data转成string
+ (NSString*)decryptAESData:(NSData*)data;

#pragma mark - DES加密、解密
+ (NSData *)encryptDESData:(NSString *)string;
+ (NSString *)decryptDESData:(NSData *)data;

#pragma mark - Base64 加密、解密
+ (NSString*)encodeBase64String:(NSString *)input;
+ (NSString*)decodeBase64String:(NSString *)input;
+ (NSString*)encodeBase64Data:(NSData *)data;
+ (NSString*)decodeBase64Data:(NSData *)data;

#pragma mark - MD5 加密
+ (NSString *)md5:(NSString *)str;

#pragma mark - SHA512加密
+ (NSString*) getSHA512String:(NSString*)s;

@end
