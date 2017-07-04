//
//  TabBarController.m
//  NavigationComb
//
//  Created by 李蛋伯 on 2016/11/7.
//  Copyright © 2016年 李蛋伯. All rights reserved.
//

#import "TabBarController.h"
#import "NavigationController.h"
#import "HeiViewController.h"
#import "JiViewController.h"
#import "LiaoViewController.h"

#import "TabBarButton.h"

@interface TabBarController (){
    
    NSArray *_buttonTitle;
    NSArray *_buttonImage;
}

@end

@implementation TabBarController

#pragma mark -- 设置根视图控制器
- (instancetype)init{
    
    self = [super init];
    if (self) {
        
        //将各视图控制器设为导航控制器NavigationController的一级视图控制器
        HeiViewController *HeiView = [[HeiViewController alloc]init];
        NavigationController *HeiNav = [[NavigationController alloc]initWithRootViewController:HeiView];
        HeiNav.delegate = self;
        JiViewController *JiView = [[JiViewController alloc]init];
        NavigationController *JiNav = [[NavigationController alloc]initWithRootViewController:JiView];
        JiNav.delegate = self;
        LiaoViewController *LiaoView = [[LiaoViewController alloc]init];
        NavigationController *LiaoNav = [[NavigationController alloc]initWithRootViewController:LiaoView];
        LiaoNav.delegate = self;
        
        self.viewControllers = @[HeiNav, JiNav, LiaoNav];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //关闭标签栏透明度
    self.tabBar.translucent = NO;
    //添加按钮方法
    [self _createTabBarButton];
}

#pragma mark -- 视图将要显示时执行的方法
- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    //移除按钮方法
    [self _removeTabBarButton];
}

#pragma mark -- 移除标签栏系统默认按钮
- (void)_removeTabBarButton{
    
    Class class = NSClassFromString(@"UITabBarButton");
    for (UIView *view in self.tabBar.subviews) {
        
        if ([view isKindOfClass:class]) {
            
            [view removeFromSuperview];
        }
    }
}

#pragma mark -- 添加标签栏自定义按钮
- (void)_createTabBarButton{
    
    //按钮宽度
    float buttonWidth = kScreenWidth/3;
    //按钮名
    _buttonTitle = @[@"黑龙江", @"吉林", @"辽宁"];
    //按钮图标
    _buttonImage = @[@"Hei.png", @"Ji.png", @"Liao.png"];
    
    //按钮实现
    for (int i = 0; i < 3; i++) {
        
        TabBarButton *tabBarButton = [[TabBarButton alloc]initWithFrame:CGRectMake(i * buttonWidth, 0, buttonWidth, tabBarHeight) withImage:_buttonImage[i] withTitle:_buttonTitle[i]];
        tabBarButton.tag = i + 1000;
        tabBarButton.imageView.tag = i + 1010;
        tabBarButton.label.tag = i + 1100;
        [tabBarButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        //设置选择位置
        if (i == 0) {
            
            tabBarButton.label.textColor = [UIColor blueColor];
        }
        //按钮添加
        [self.tabBar addSubview:tabBarButton];
    }
}

#pragma mark -- 标签栏按钮点击响应
- (void)buttonAction:(UIControl *)button{
    
    self.selectedIndex = button.tag - 1000;
    for (int i = 0; i < 3; i++) {
        
        UILabel *buttonLabel = [self.tabBar viewWithTag:i + 1100];
        if (i == self.selectedIndex) {
            
            buttonLabel.textColor = [UIColor blueColor];
        }else{
            
            buttonLabel.textColor = [UIColor blackColor];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
