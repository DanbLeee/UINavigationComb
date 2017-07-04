//
//  TabBarButton.h
//  NavigationComb
//
//  Created by 李蛋伯 on 2016/11/15.
//  Copyright © 2016年 李蛋伯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarButton : UIControl

- (instancetype)initWithFrame:(CGRect)frame withImage:(NSString *)imageName withTitle:(NSString *)titleName;

@property (nonatomic, copy) UIImageView *imageView;
@property (nonatomic, copy) UILabel *label;

@end
