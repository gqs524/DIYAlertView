//
//  ViewController.m
//  自动布局_自定义alertView
//
//  Created by 高青松 on 16/4/18.
//  Copyright © 2016年 高青松. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *myView = [[UIView alloc]init];
    myView.layer.cornerRadius = 10;
    myView.layer.masksToBounds = YES;
    myView.backgroundColor = [UIColor redColor];
    [self.view addSubview:myView];
    
    NSLayoutConstraint *constranint = nil;
    
    
    myView.translatesAutoresizingMaskIntoConstraints = NO;

    // 设置视图的宽
    constranint = [NSLayoutConstraint constraintWithItem:myView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:250];
    [myView addConstraint:constranint];
    
    
    // 设置视图的高
    constranint = [NSLayoutConstraint constraintWithItem:myView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:200];
    [myView addConstraint:constranint];
    // 设置视图的X
    constranint = [NSLayoutConstraint constraintWithItem:myView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:20];
    [self.view addConstraint:constranint];
    
    
    // 设置视图的Y
    constranint = [NSLayoutConstraint constraintWithItem:myView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0];
    [self.view addConstraint:constranint];
    
    
    
#warning *******提示******
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.backgroundColor = [UIColor grayColor];
    titleLabel.font = [UIFont systemFontOfSize:13];
    titleLabel.text = @"提示";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [myView addSubview:titleLabel];
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 设置视图的宽
    constranint = [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:250];
    [titleLabel addConstraint:constranint];
    
    
    // 设置视图的高
    constranint = [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:30];
    [titleLabel addConstraint:constranint];
    // 设置视图的X
    constranint = [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:myView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0];
    [myView addConstraint:constranint];
    
    
    // 设置视图的Y
    constranint = [NSLayoutConstraint constraintWithItem:titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:myView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:-85];
    [myView addConstraint:constranint];
    
#warning *******详情******
    UILabel *detailLabel = [[UILabel alloc]init];
    detailLabel.backgroundColor = [UIColor yellowColor];
    detailLabel.font = [UIFont systemFontOfSize:12];
    
    
#warning ***detailLabel 颜色标红****
    NSString *detailStr = @"当前账户余额：10.00元，彩金余额：10.00元，差额1800.00元。请充值后继续购彩。";
    NSInteger location1 = 0;
    NSInteger location2 = 0;
    NSInteger lenth;
    NSString *temp = nil;
    for (int i = 0; i < detailStr.length; i++) {
        temp = [detailStr substringWithRange:NSMakeRange(i, 1)];
        if ([temp isEqualToString:@"差"]) {
            location1 = i + 2;
        }
        if ([temp isEqualToString:@"请"]) {
            location2 = i - 1;
        }
    }
    lenth = location2 - location1;
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:detailStr];
    [attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(location1, lenth)];
    detailLabel.attributedText = attributedStr;
    detailLabel.numberOfLines = 0;
    detailLabel.textAlignment = NSTextAlignmentCenter;
    [myView addSubview:detailLabel];
    


    detailLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 设置视图的宽
    constranint = [NSLayoutConstraint constraintWithItem:detailLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:200];
    [detailLabel addConstraint:constranint];
    
    
    // 设置视图的高
    constranint = [NSLayoutConstraint constraintWithItem:detailLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:110];
    [detailLabel addConstraint:constranint];
    // 设置视图的X
    constranint = [NSLayoutConstraint constraintWithItem:detailLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:myView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0];
    [myView addConstraint:constranint];
    
    
    // 设置视图的Y
    constranint = [NSLayoutConstraint constraintWithItem:detailLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0];
    [myView addConstraint:constranint];
   
    
#warning *******确定******
    UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sureButton.backgroundColor = [UIColor greenColor];
    sureButton.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    sureButton.titleLabel.textColor = [UIColor grayColor];
    [sureButton setTitle:@"确定" forState:UIControlStateNormal];
    [sureButton addTarget:self action:@selector(sureBtn:) forControlEvents:UIControlEventTouchUpInside];
    sureButton.titleLabel.numberOfLines = 0;
    sureButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [myView addSubview:sureButton];
    
    sureButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 设置视图的宽
    constranint = [NSLayoutConstraint constraintWithItem:sureButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:125];
    [sureButton addConstraint:constranint];
    
    
    // 设置视图的高
    constranint = [NSLayoutConstraint constraintWithItem:sureButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:60];
    [sureButton addConstraint:constranint];
    // 设置视图的X
    constranint = [NSLayoutConstraint constraintWithItem:sureButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:myView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0];
    [myView addConstraint:constranint];
    
    
    // 设置视图的Y
    constranint = [NSLayoutConstraint constraintWithItem:sureButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:myView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0];
    [myView addConstraint:constranint];
    
#warning *******取消******
    UIButton *cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancleBtn.backgroundColor = [UIColor greenColor];
    cancleBtn.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    cancleBtn.titleLabel.textColor = [UIColor grayColor];
    [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancleBtn addTarget:self action:@selector(cancleBtn:) forControlEvents:UIControlEventTouchUpInside];
    cancleBtn.titleLabel.numberOfLines = 0;
    cancleBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [myView addSubview:cancleBtn];
    
    cancleBtn.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 设置视图的宽
    constranint = [NSLayoutConstraint constraintWithItem:cancleBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:125];
    [cancleBtn addConstraint:constranint];
    
    
    // 设置视图的高
    constranint = [NSLayoutConstraint constraintWithItem:cancleBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:60];
    [cancleBtn addConstraint:constranint];
    // 设置视图的X
    constranint = [NSLayoutConstraint constraintWithItem:cancleBtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:myView attribute:NSLayoutAttributeRight multiplier:1.0f constant:0];
    [myView addConstraint:constranint];
    
    
    // 设置视图的Y
    constranint = [NSLayoutConstraint constraintWithItem:cancleBtn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:myView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0];
    [myView addConstraint:constranint];
    
    
    
#warning ***线条***
    UIView *line1 = [[UIView alloc]init];
    line1.backgroundColor = [UIColor grayColor];
    [myView addSubview:line1];
    
    line1.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 设置视图的宽
    constranint = [NSLayoutConstraint constraintWithItem:line1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:myView attribute:NSLayoutAttributeWidth multiplier:1.0f constant:0];
    [myView addConstraint:constranint];
    
    
    // 设置视图的高
    constranint = [NSLayoutConstraint constraintWithItem:line1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:0.5];
    [line1 addConstraint:constranint];
    // 设置视图的X
    constranint = [NSLayoutConstraint constraintWithItem:line1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:myView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0];
    [myView addConstraint:constranint];
    
    
    // 设置视图的Y
    constranint = [NSLayoutConstraint constraintWithItem:line1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cancleBtn attribute:NSLayoutAttributeTop multiplier:1.0f constant:0];
    [myView addConstraint:constranint];
    
    
    
    UIView *line2 = [[UIView alloc]init];
    line2.backgroundColor = [UIColor grayColor];
    [myView addSubview:line2];
    
    line2.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 设置视图的宽
    constranint = [NSLayoutConstraint constraintWithItem:line2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:0.5];
    [line2 addConstraint:constranint];
    
    
    // 设置视图的高
    constranint = [NSLayoutConstraint constraintWithItem:line2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cancleBtn attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0];
    [myView addConstraint:constranint];
    // 设置视图的X
    constranint = [NSLayoutConstraint constraintWithItem:line2 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:cancleBtn attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0];
    [myView addConstraint:constranint];
    
    
    // 设置视图的Y
    constranint = [NSLayoutConstraint constraintWithItem:line2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cancleBtn attribute:NSLayoutAttributeTop multiplier:1.0f constant:0];
    [myView addConstraint:constranint];
}


- (void)sureBtn:(UIButton *)btn
{
    
}

- (void)cancleBtn:(UIButton *)btn
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
