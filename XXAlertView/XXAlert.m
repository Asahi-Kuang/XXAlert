//
//  XXAlert.m
//  XXAlertView_Demo
//
//  Created by Kxx.xxQ 一生相伴 on 16/1/8.
//  Copyright © 2016年 asahi_kuang. All rights reserved.
//

#import "XXAlert.h"

#define RECT_MAKE(x, y, w, h) CGRectMake(x, y, w, h)
#define GET_HEIGHT(des) CGRectGetHeight(des)
#define GET_WIDTH(des) CGRectGetWidth(des)
#define GET_MAXY(des) CGRectGetMaxY(des)
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a]

/*功能按钮的高度*/
static CGFloat const funcButtonHeight = 50.f;
/*取消按钮的tag值*/
static NSInteger const cancleButtnTag = 1991;
@interface XXAlert ()
/***keywindow*/
@property (nonatomic, strong)UIWindow *kWindow;
/***背景视图*/
@property (nonatomic, strong)UIView *backgroundView;
/***alert视图*/
@property (nonatomic, strong)UIView *alertView;
/*点击的按钮记录值*/
@property (nonatomic, assign)NSInteger index;
/***取消按钮*/
@property (nonatomic, strong)UIButton *cancleBtn;
/*alert的frame*/
@property (nonatomic, assign)CGRect frame;
/*alert的高度*/
@property (nonatomic, assign)CGFloat alertViewHeight;
@end

@implementation XXAlert

#pragma mark - 构造方法
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //
        _frame = frame;
    }
    return self;
}

- (instancetype)init {
    return nil;
}
#pragma mark --

#pragma mark - private method
- (void)setTapGesEnable:(BOOL)tapGesEnable {
    _tapGesEnable = tapGesEnable;
}

- (void)originalSetting {
    
    // 获取主窗口
    _kWindow = [UIApplication sharedApplication].keyWindow;
    // 元素拼装
    _backgroundView = [[UIView alloc] initWithFrame:_frame];
    [_backgroundView setBackgroundColor:RGBA(0.f, 0.f, 0.f, 0.4f)];
    _alertView = [[UIView alloc] initWithFrame:RECT_MAKE(0, GET_HEIGHT(_backgroundView.frame), GET_WIDTH(_backgroundView.frame), _alertViewHeight)];
    [_alertView setBackgroundColor:RGBA(232.f, 232.f, 232.f, 1)];
    [self addAnimationForView:_alertView];
    [_backgroundView addSubview:_alertView];
    [_kWindow addSubview:_backgroundView];
    [self addFunctionsElements];
    [self addTapGesture];
    
    _tapGesEnable = NO;
}

/**
 *  @brief 给alert添加按钮.
 */
- (void)setFuncBtns:(NSArray *)funcBtns {
    _funcBtns = funcBtns;
    _alertViewHeight = funcButtonHeight * _funcBtns.count + 8 + funcButtonHeight;
}

/**
 *  @brief 构造按钮
 */
- (void)addFunctionsElements {
    // 取消按钮
    _cancleBtn = [self getButtonWithFrame:RECT_MAKE(0, GET_HEIGHT(_alertView.frame) - funcButtonHeight, GET_WIDTH(_alertView.frame), funcButtonHeight) withTitle:@"取消" withTag: cancleButtnTag];
    [_alertView addSubview:_cancleBtn];
    
    for (int i = 0; i < [_funcBtns count]; i ++) {
        UIButton *funcBtn;
        if (i > 0) {
            funcBtn = [self getButtonWithFrame:RECT_MAKE(0, i * (funcButtonHeight + 1), GET_WIDTH(_alertView.frame), funcButtonHeight) withTitle:_funcBtns[i] withTag:i];
        }
        else {
            funcBtn = [self getButtonWithFrame:RECT_MAKE(0, i * funcButtonHeight, GET_WIDTH(_alertView.frame), funcButtonHeight) withTitle:_funcBtns[i] withTag:i];
        }

        [_alertView addSubview:funcBtn];
    }
}

/** @brief 按钮构造方法.
 *  @param frame : 按钮的frame.
 *  @param title : 按钮的标题.
 *  @param tag   : 按钮的tag值.
 */
- (UIButton *)getButtonWithFrame:(CGRect)frame withTitle:(NSString *)title withTag:(NSInteger)tag{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setBackgroundColor:[UIColor whiteColor]];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTag:tag];
    [button setTitleColor:RGBA(0, 0, 0, 1) forState:UIControlStateNormal];
    [button setTitleColor:RGBA(232.f, 232.f, 232.f, 1) forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

/** @brief 当按钮点击后调用协议方法.
 *  @param sender: 点击的按钮.
 */
- (void)buttonPressed:(UIButton *)sender {
    _index = sender.tag;
    [self.delegate funcButtonOnAlert:self didPressedAtIndexPath:_index];
}

/**
 *  @brief 手势操作(点击隐藏alert).
 */
- (void)addTapGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissTheAlert:)];
    
    [_backgroundView addGestureRecognizer:tap];
}

- (void)dismissTheAlert:(UITapGestureRecognizer *)tap {
    if (!_tapGesEnable) {
        return;
    }
    [self dismiss];
}

/**
 *  @brief 隐藏alert的方法.
 */
- (void)dismiss {
    [UIView animateWithDuration:0.3f delay:0.f usingSpringWithDamping:1.f initialSpringVelocity:1.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        //
        [_alertView setFrame:RECT_MAKE(0, GET_HEIGHT(_backgroundView.frame), GET_WIDTH(_backgroundView.frame), _alertViewHeight)];
        [_backgroundView setAlpha:0.0f];
    } completion:^(BOOL finished) {
        //
        [_backgroundView removeFromSuperview];
    }];
}

/** @brief 给alert添加的动画效果.
 *  @param view: 需要添加动画的视图.
 */
- (void)addAnimationForView:(UIView *)view {
    [UIView animateWithDuration:0.3f delay:0.f usingSpringWithDamping:1.f initialSpringVelocity:1.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        //
        [view setFrame:RECT_MAKE(0, GET_HEIGHT(_backgroundView.frame) - _alertViewHeight, GET_WIDTH(_backgroundView.frame), _alertViewHeight)];
    } completion:^(BOOL finished) {
        //
    }];
}
#pragma mark --



@end
