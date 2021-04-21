//
//  ZHKeyBoardToolBar.m
//  智慧社区
//
//  Created by gallon on 2019/8/26.
//  Copyright © 2017年 zhsq. All rights reserved.
//
#define  SCREEN_WIDTH     [[UIScreen mainScreen] bounds].size.width
#define  Screen_HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define  TOOLBAR_HEIGHT   44.0f

#import "ZHKeyBoardToolBar.h"

@interface ZHKeyBoardToolBar ()

@end

@implementation ZHKeyBoardToolBar

+ (instancetype)keyboardToolbar {
    return [[[self class] alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TOOLBAR_HEIGHT)];
}


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        //上一个
        UIBarButtonItem *previousItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"home-keyboardItem-up"] style:UIBarButtonItemStylePlain target:self action:@selector(itemDidClick:)];
        _previousItem = previousItem;
        //下一个
        UIBarButtonItem *nextItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"home-keyboardIem-down"] style:UIBarButtonItemStylePlain target:self action:@selector(itemDidClick:)];
        _nextItem = nextItem;
        //完成
        UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(itemDidClick:)];
        [doneItem setTintColor:[UIColor blackColor]];
        _doneItem = doneItem;
        //弹簧
        UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        //填充
        UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        
        self.items = [NSArray arrayWithObjects:self.previousItem,self.nextItem,flexibleSpace,self.doneItem,fixedSpace, nil];
        [self setItems:self.items];
    }
    return self;
}


- (void)itemDidClick:(UIBarButtonItem *)item {
    
    NSInteger itemIndex = [self.items indexOfObject:item];
    
    if ([self.toolbarDelegate respondsToSelector:@selector(toolbar:DidClicked:)] == NO) {
        return;
    }else {
        if (itemIndex == 0) {
            [self.toolbarDelegate toolbar:self DidClicked:ZHKeyBoardToolBarItemPrevious];
        }
        if (itemIndex == 1) {
            [self.toolbarDelegate toolbar:self DidClicked:ZHKeyBoardToolBarItemNext];
        }
        if (itemIndex == 3) {
            [self.toolbarDelegate toolbar:self DidClicked:ZHKeyBoardToolBarItemDone];
        }
    }
}




@end
