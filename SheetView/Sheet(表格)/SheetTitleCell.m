//
//  SheetTitleCell.m
//  SheetView
//
//  Created by tanchao on 16/2/23.
//  Copyright © 2016年 谈超. All rights reserved.
//

#import "SheetTitleCell.h"
#import "SeparationLine.h"
@interface SheetTitleCell ()
@property (nonatomic, strong) UILabel *label;
@end
@implementation SheetTitleCell
- (instancetype)init{
    self = [super init];
    [self initSubViews];
    return  self;
}
- (void)initSubViews{
    SeparationLine *Separation = ({
        SeparationLine *view = [SeparationLine new];
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.mas_equalTo(self);
        }];
        view;
    });
    self.label = ({
        UILabel *view = [UILabel new];
        view.text = @"周期/项目   (公里)";
        view.textColor = Color(@"#000000");
        view.backgroundColor = Color(@"#f1f1f1");
        view.font = [UIFont systemFontOfSize:({
            CGFloat size = 14;
            if (IS_IPHONE_4S) size = 8;
            if (IS_IPHONE_5 ) size = 12;
            size;
        })];
        view.numberOfLines = 0;
        view.textAlignment = NSTextAlignmentCenter;
        //自动折行设置
        view.lineBreakMode = NSLineBreakByWordWrapping;
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self).offset(1);
                make.top.mas_equalTo(self).offset(0.5);
                make.right.mas_equalTo(self).offset(-1);
                make.bottom.mas_equalTo(self).offset(-0.5);
        }];
        view;
    });
}
- (void)setTitle:(NSString *)title{
    _title = title;
    self.label.text = title;
}
@end
