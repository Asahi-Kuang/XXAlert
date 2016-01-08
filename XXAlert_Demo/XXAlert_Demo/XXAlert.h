//
//  XXAlert.h
//  XXAlertView_Demo
//
//  Created by ; 一生相伴 on 16/1/8.
//  Copyright © 2016年 asahi_kuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XXAlert;

@protocol XXAlertProtocol <NSObject>


@optional
/** @brief 功能按钮点击协议方法
 *  @param alert : alert对象
 *  @param index : 点击的第几个按钮(每个按钮有tag值, 从上到下0...n, 取消按钮tag为1991)
 */
- (void)funcButtonOnAlert:(XXAlert *)alert didPressedAtIndexPath:(NSInteger)index;

@end

@interface XXAlert : UIView
/**
 *  @brief 公共属性
 */
/***功能按钮数组*/
@property (nonatomic, strong)NSArray *funcBtns;
/***是否需要点击空白消失*/
@property (nonatomic, assign)BOOL tapGesEnable;
/*协议代理对象*/
@property (nonatomic, assign)id<XXAlertProtocol> delegate;



#pragma mark - public methods
/**
 *  @brief 初始设置构造.
 */
- (void)originalSetting;

/** @brief 设置功能按钮的标题.(这个方法应该最先调用。在originalSetting之前).
 *  @param funcBtns: 功能按钮的标题数组.
 */
- (void)setFuncBtns:(NSArray *)funcBtns;

/** @brief 设置是否需要开启点击空白处隐藏alert.
 *  @param tapGesEnable : 是否开启(布尔值)
 */
- (void)setTapGesEnable:(BOOL)tapGesEnable;

/**
 *  @brief 隐藏alert.
 */
- (void)dismiss;
@end
