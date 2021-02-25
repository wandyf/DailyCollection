//
//  RSAViewController.m
//  DailyCollection
//
//  Created by 王云峰 on 2021/2/25.
//

#import "RSAViewController.h"

#import <Masonry.h>
#import "RSACryptor.h"

@interface RSAViewController ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *encryptBtn;
@property (nonatomic, strong) UIButton *decryptBtn;
@property (nonatomic, strong) UILabel *resultLbl;

@property (nonatomic, strong) NSData *data;

@end

@implementation RSAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createSubviews];
    [self loadRSAKeys];
}

- (void)createSubviews {
    [self.view addSubview:self.textField];
    [self.view addSubview:self.encryptBtn];
    [self.view addSubview:self.decryptBtn];
    [self.view addSubview:self.resultLbl];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.left.right.equalTo(self.view);
    }];
    
    [self.encryptBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textField.mas_bottom).offset(20.0);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(44.0);
    }];
    
    [self.decryptBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.encryptBtn.mas_bottom).offset(20.0);
        make.left.right.height.equalTo(self.encryptBtn);
    }];
    
    [self.resultLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.decryptBtn.mas_bottom).offset(20.0);
        make.left.right.equalTo(self.view);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - Private Method

- (void)loadRSAKeys {
    // 1.加载公钥
    [[RSACryptor sharedRSACryptor] loadPublicKey:[[NSBundle mainBundle] pathForResource:@"rsacert.der" ofType:nil]];
    // 2.加载私钥
    [[RSACryptor sharedRSACryptor] loadPrivateKey:[[NSBundle mainBundle] pathForResource:@"p.p12" ofType:nil] password:@"123456"];
}

- (NSData *)encryptData:(NSData *)data {
    return [[RSACryptor sharedRSACryptor] encryptData:data];
}

- (NSData *)decryptData:(NSData *)data {
    return [[RSACryptor sharedRSACryptor] decryptData:data];
}

- (void)onclickEncryptButtonAction:(UIButton *)button {
    if (!self.textField.text.length) { return; }
    self.data = [self encryptData:[self.textField.text dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *result = [self.data base64EncodedStringWithOptions:0];
    self.resultLbl.text = [NSString stringWithFormat:@"加密结果:\n%@", result];
    NSLog(@"%@", [NSString stringWithFormat:@"加密结果:\n%@", result]);
}

- (void)onclickDecryptButtonAction:(UIButton *)button {
    if (!self.textField.text.length) { return; }
    NSData *data = [self decryptData:self.data];
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    self.resultLbl.text = [NSString stringWithFormat:@"解密结果:\n%@", result];
    NSLog(@"%@", [NSString stringWithFormat:@"解密结果:\n%@", result]);
}

#pragma mark - Get

- (UITextField *)textField {
    if (!_textField) {
        _textField = [UITextField.alloc init];
        _textField.placeholder = @"输入文字";
        _textField.textAlignment = NSTextAlignmentCenter;
    }
    return _textField;
}

- (UIButton *)encryptBtn {
    if (!_encryptBtn) {
        _encryptBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_encryptBtn setTitle:@"加密" forState:UIControlStateNormal];
        [_encryptBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [_encryptBtn addTarget:self action:@selector(onclickEncryptButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _encryptBtn;
}

- (UIButton *)decryptBtn {
    if (!_decryptBtn) {
        _decryptBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_decryptBtn setTitle:@"解密" forState:UIControlStateNormal];
        [_decryptBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        [_decryptBtn addTarget:self action:@selector(onclickDecryptButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _decryptBtn;
}

- (UILabel *)resultLbl {
    if (!_resultLbl) {
        _resultLbl = [UILabel new];
        _resultLbl.numberOfLines = 0;
    }
    return _resultLbl;
}

@end
