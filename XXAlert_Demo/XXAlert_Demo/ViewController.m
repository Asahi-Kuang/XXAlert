//
//  ViewController.m
//  XXAlert_Demo
//
//  Created by Kxx.xxQ 一生相伴 on 16/1/8.
//  Copyright © 2016年 asahi_kuang. All rights reserved.
//

#import "ViewController.h"
#import "XXAlert.h"
#import "TestViewController.h"

@interface ViewController ()<XXAlertProtocol>
@property (nonatomic, strong)XXAlert *alert;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(150, 300, 100, 40)];
    [btn setBackgroundColor:[UIColor orangeColor]];
    [btn.layer setCornerRadius:20.f];
    [btn setTitle:@"两个按钮" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(setUpAlert) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setFrame:CGRectMake(150, 360, 100, 40)];
    [btn2 setBackgroundColor:[UIColor orangeColor]];
    [btn2.layer setCornerRadius:20.f];
    [btn2 setTitle:@"四个按钮" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    [btn2 addTarget:self action:@selector(setUpAlert2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 
- (void)setUpAlert {
    _alert = [[XXAlert alloc] initWithFrame:self.view.bounds];
    [_alert setFuncBtns:@[@"button1", @"button2"]];
    [_alert originalSetting];
    [_alert setTapGesEnable:YES];
    [_alert setDelegate:self];
}

- (void)setUpAlert2 {
    _alert = [[XXAlert alloc] initWithFrame:self.view.bounds];
    [_alert setFuncBtns:@[@"button1", @"button2", @"button3", @"button4"]];
    [_alert originalSetting];
    [_alert setTapGesEnable:YES];
    [_alert setDelegate:self];
}

#pragma mark - XXAlertProtocol
- (void)funcButtonOnAlert:(XXAlert *)alert didPressedAtIndexPath:(NSInteger)index {
    if (index == 0) {
        TestViewController *tvc = [[TestViewController alloc] init];
        [_alert dismiss];
        [self.navigationController pushViewController:tvc animated:YES];
    }else {
        //
    }
}

@end
