//
//  ViewController.m
//  ZHKeyBoardToolBar
//
//  Created by gallon on 2019/8/27.
//  Copyright © 2019年 gallon. All rights reserved.
//

#import "ViewController.h"
#import "ZHKeyBoardToolBar.h"

@interface ViewController ()<ZHKeyBoardToolBarDelegate,UITextFieldDelegate,UITextViewDelegate>

@property (nonatomic, strong) ZHKeyBoardToolBar *keyboardToolBar;
@property (strong,nonatomic) UITextField*titleTF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self.view addSubview:self.titleTF];
    
     _titleTF.inputAccessoryView=self.keyboardToolBar;
}

- (void)toolbar:(ZHKeyBoardToolBar *)toolbar DidClicked:(ZHKeyBoardToolBarItem)item
{
    
    if (item == ZHKeyBoardToolBarItemDone) {
        [self.view endEditing:YES];
    }
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    //标题
   
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    //内容
    
}

- (ZHKeyBoardToolBar *)keyboardToolBar
{
    if (!_keyboardToolBar) {
        _keyboardToolBar = [ZHKeyBoardToolBar keyboardToolbar];
        _keyboardToolBar.toolbarDelegate = self;
    }
    return _keyboardToolBar;
}
-(UITextField*)titleTF{
    if (!_titleTF) {
        _titleTF=[[UITextField alloc]initWithFrame:CGRectMake(30, 123, 250, 40)];
        _titleTF.clearButtonMode=UITextFieldViewModeWhileEditing;
        _titleTF.placeholder=@"请在此输入";
        _titleTF.delegate=self;
        _titleTF.borderStyle=UITextBorderStyleRoundedRect;
        _titleTF.layer.cornerRadius=5.0f;
        _titleTF.backgroundColor=[UIColor whiteColor];
        _titleTF.font=[UIFont systemFontOfSize:15];
        _titleTF.textColor=[UIColor blackColor];
    }return _titleTF;
}
@end
