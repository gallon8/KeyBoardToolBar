//
//  ZHKeyBoardToolBar.h
//  智慧社区
//
//  Created by gallon on 2019/8/26.
//  Copyright © 2017年 zhsq. All rights reserved.
//
typedef enum {
    ZHKeyBoardToolBarItemPrevious = 0,      //工具条 "上一个" 按钮
    ZHKeyBoardToolBarItemNext,              //工具条 "下一个" 按钮
    ZHKeyBoardToolBarItemDone,              //工具条 "完成" 按钮
} ZHKeyBoardToolBarItem;

#import <UIKit/UIKit.h>
@class ZHKeyBoardToolBar;


@protocol ZHKeyBoardToolBarDelegate <NSObject>
@optional
- (void)toolbar:(ZHKeyBoardToolBar *)toolbar DidClicked:(ZHKeyBoardToolBarItem)item;
@end

@interface ZHKeyBoardToolBar : UIToolbar
@property (nonatomic, weak, readonly) UIBarButtonItem *previousItem;
@property (nonatomic, weak, readonly) UIBarButtonItem *nextItem;
@property (nonatomic, weak, readonly) UIBarButtonItem *doneItem;
/**代理*/
@property (nonatomic, weak) id <ZHKeyBoardToolBarDelegate> toolbarDelegate;
/**快速构造键盘工具条*/
+ (instancetype)keyboardToolbar;
@end
