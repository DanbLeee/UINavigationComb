//
//  TabBarButton.m
//  NavigationComb
//
//  Created by 李蛋伯 on 2016/11/15.
//  Copyright © 2016年 李蛋伯. All rights reserved.
//

#import "TabBarButton.h"

@implementation TabBarButton

//重写标签栏按钮构造方法
- (instancetype)initWithFrame:(CGRect)frame withImage:(NSString *)imageName withTitle:(NSString *)titleName{
    
    //self = [super initWithFrame:frame];
    if (self = [super init]) {
        
        self.frame = frame;
        
        //按钮图片
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake((self.frame.size.width - 30)/2, 6, 30, 20)];
        _imageView.image = [UIImage imageNamed:imageName];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imageView];
        
        //按钮标题
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(_imageView.frame) + 8.5, self.frame.size.width, 20)];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:14];
        _label.text = titleName;
        [self addSubview:_label];
    }
    
    return self;
}

@end
