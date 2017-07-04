//
//  ModalViewController.m
//  NavigationComb
//
//  Created by 李蛋伯 on 2016/11/15.
//  Copyright © 2016年 李蛋伯. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //“保存”按钮
    UIBarButtonItem *saveBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = saveBarButtonItem;
    //“取消”按钮
    UIBarButtonItem *cancelBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
    self.navigationItem.leftBarButtonItem = cancelBarButtonItem;
    
    //添加编辑视图
    //UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(([[UIScreen mainScreen]bounds].size.width - 320)/2, 100, 320, 200)];
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height)];

    textView.text = @"TextView";
    [self.view addSubview:textView];
}

//"保存"按钮事件
- (void)save:(id)sender{
    
   
}
//“取消”按钮事件
- (void)cancel:(id)sender{
    
    //关闭当前视图操作
    [self dismissViewControllerAnimated:TRUE completion:^{
        
        NSLog(@"关闭模态视图");
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
