//
//  NSData+DES.m
//  XTSecurityDemo
//
//  Created by yong on 14/10/28.
//  Copyright (c) 2014年 xtcel.com. All rights reserved.
//

#import "NSData+DES.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation NSData (DES)

- (NSData *)DESEncryptWithKey:(NSString *)key {
    
    NSStringEncoding EnC = NSUTF8StringEncoding;
    
    NSMutableData * dKey = [[key dataUsingEncoding:EnC] mutableCopy];
    [dKey setLength:kCCBlockSizeDES];
    uint8_t *bufferPtr1 = NULL;
    size_t bufferPtrSize1 = 0;
    size_t movedBytes1 = 0;
    
    Byte iv[] = {0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF};
    bufferPtrSize1 = ([self length] + kCCKeySizeDES) & ~(kCCKeySizeDES -1);
    bufferPtr1 = malloc(bufferPtrSize1 * sizeof(uint8_t));
    memset((void *)bufferPtr1, 0x00, bufferPtrSize1);
    CCCrypt(kCCEncrypt, // CCOperation op
            kCCAlgorithmDES, // CCAlgorithm alg
            kCCOptionPKCS7Padding, // CCOptions options
            [dKey bytes], // const void *key
            [dKey length], // size_t keyLength
            iv, // const void *iv
            [self bytes], // const void *dataIn
            [self length],  // size_t dataInLength
            (void *)bufferPtr1, // void *dataOut
            bufferPtrSize1,     // size_t dataOutAvailable
            &movedBytes1);      // size_t *dataOutMoved
    
    NSData *sResult = [NSData dataWithBytes:bufferPtr1 length:movedBytes1];
    
    return sResult;
}

- (NSString *)DESDecryptWithKey:(NSString *)sKey {
    NSStringEncoding EnC = NSUTF8StringEncoding;
    const void *dataIn;
    size_t dataInLength;
    
    dataInLength = [self length];
    dataIn = [self bytes];
    
    NSMutableData * dKey = [[sKey dataUsingEncoding:EnC] mutableCopy];
    [dKey setLength:kCCBlockSizeDES];
    uint8_t *bufferPtr1 = NULL;
    size_t bufferPtrSize1 = 0;
    size_t movedBytes1 = 0;
    //uint8_t iv[kCCBlockSizeDES];
    //memset((void *) iv, 0x0, (size_t) sizeof(iv));
    
    Byte iv[] = {0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF};
    bufferPtrSize1 = ([self length] + kCCKeySizeDES) & ~(kCCKeySizeDES -1);
    bufferPtr1 = malloc(bufferPtrSize1 * sizeof(uint8_t));
    memset((void *)bufferPtr1, 0x00, bufferPtrSize1);
    CCCrypt(kCCDecrypt, // CCOperation op
            kCCAlgorithmDES, // CCAlgorithm alg
            kCCOptionPKCS7Padding, // CCOptions options
            [dKey bytes], // const void *key
            [dKey length], // size_t keyLength
            iv, // const void *iv
            dataIn, // const void *dataIn
            dataInLength,  // size_t dataInLength
            (void *)bufferPtr1, // void *dataOut
            bufferPtrSize1,     // size_t dataOutAvailable
            &movedBytes1);      // size_t *dataOutMoved
    
    NSString * sResult;
    
    sResult = [[NSString alloc] initWithData:[NSData dataWithBytes:bufferPtr1
                                                            length:movedBytes1] encoding:EnC];
    
    return sResult;
}

@end
