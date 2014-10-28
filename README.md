XTSecurity
==========
XTSecurityUtil是一个iOS加密、解密算法工具库，里面包含DES、AES、MD5、SHA512、Base64等加密、解密、编码算法。

使用方法：
导入XTSecurityUtil文件下的所有文件，
import "XTSecurityUtil.h"

各个方法：
#pragma mark - AES加密、解密
+ (NSData*)encryptAESData:(NSString*)string;
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
