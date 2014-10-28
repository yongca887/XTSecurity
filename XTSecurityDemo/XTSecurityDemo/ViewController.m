//
//  ViewController.m
//  XTSecurityDemo
//
//  Created by yong on 14/10/28.
//  Copyright (c) 2014年 xtcel.com. All rights reserved.
//

#import "ViewController.h"
#include "XTSecurityUtil.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AES:(id)sender {
    NSString *content = _contentTextField.text;
    //进行加密
    NSData *encryptedData = [XTSecurityUtil encryptAESData:content];
    //再进行base64位编码，不能直接转成String输出
    NSString *encryptedString = [XTSecurityUtil encodeBase64Data:encryptedData];

    _resultLabel.text = encryptedString;
}

- (IBAction)DES:(id)sender {
    NSString *content = _contentTextField.text;
    //进行加密
    NSData *encryptedData = [XTSecurityUtil encryptDESData:content];
    //再进行base64位编码，不能直接转成String输出
    NSString *encryptedString = [XTSecurityUtil encodeBase64Data:encryptedData];
    
    _resultLabel.text = encryptedString;
}

- (IBAction)MD5:(id)sender {
    NSString *content = _contentTextField.text;
    NSString *encryptedString = [XTSecurityUtil md5:content];
    
    _resultLabel.text = encryptedString;
}

- (IBAction)Base64:(id)sender {
    NSString *content = _contentTextField.text;

    NSString *encryptedString = [XTSecurityUtil encodeBase64String:content];
    
    _resultLabel.text = encryptedString;
}

- (IBAction)SHA512:(id)sender {
    NSString *content = _contentTextField.text;
    NSString *encryptedString = [XTSecurityUtil getSHA512String:content];
    
    _resultLabel.text = encryptedString;
}

@end
