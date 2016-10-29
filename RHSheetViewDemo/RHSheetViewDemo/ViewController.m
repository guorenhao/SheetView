//
//  ViewController.m
//  RHSheetViewDemo
//
//  Created by 郭人豪 on 2016/10/29.
//  Copyright © 2016年 Abner_G. All rights reserved.
//

#import "ViewController.h"
#import "RHSheetView.h"

@interface ViewController () <RHSheetViewDelegate>

@property (nonatomic, strong) UIButton * btn;

@property (nonatomic, strong) RHSheetView * sheet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self test];
}

- (void)test {
    
    _btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    
    _btn.center = self.view.center;
    
    _btn.backgroundColor = [UIColor lightGrayColor];
    
    [_btn setTitle:@"选择更改" forState:UIControlStateNormal];
    
    [_btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_btn];
}

- (void)btnClick:(UIButton *)btn {
    
    [self.sheet showWithController:self];
}

- (RHSheetView *)sheet {
    
    if (!_sheet) {
        
        _sheet = [[RHSheetView alloc] initWithTitle:@"请选择支付方式" message:@""];
        
        _sheet.delegate = self;
        
        _sheet.actionTitles = @[@"支付宝支付", @"微信支付", @"取消"];
    }
    return _sheet;
}

#pragma mark - RHSheetView delegate

- (UIAlertActionStyle)sheetView:(RHSheetView *)sheetView actionStyleAtIndex:(NSInteger)index {
    
    if (index == 0) {
        
        return UIAlertActionStyleDestructive;
    }else if (index == sheetView.actionTitles.count - 1) {
        
        return UIAlertActionStyleCancel;
    }
    
    return UIAlertActionStyleDefault;
}

- (void)sheetView:(RHSheetView *)sheetView didSelectedAtIndex:(NSInteger)index {

    if (index < sheetView.actionTitles.count - 1) {
        
        [_btn setTitle:sheetView.actionTitles[index] forState:UIControlStateNormal];
    }
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
