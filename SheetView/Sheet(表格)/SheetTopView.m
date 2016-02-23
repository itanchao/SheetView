//
//  SheetTopView.m
//  SheetView
//
//  Created by tanchao on 16/2/22.
//  Copyright © 2016年 谈超. All rights reserved.
//

#import "SheetTopView.h"
#import "SeparationLine.h"
@interface SheetTopView ()
@property (nonatomic, strong) UILabel *titleLabel;
@end
@implementation SheetTopView
- (instancetype)init{
    self = [super init];
    [self initSubViews];
    return self;
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
    UIView *back = ({
        UIView *view = [UIView new];
        view.backgroundColor = Color(@"#d3e7fa");
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(1);
            make.top.mas_equalTo(self).offset(0.5);
            make.right.mas_equalTo(self).offset(-1);
            make.bottom.mas_equalTo(self).offset(-0.5);
        }];
        view;
    });
    self.titleLabel = ({
        UILabel *view = [UILabel new];
        [back addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(self);
            make.centerX.mas_equalTo(self.mas_centerX);
        }];
        view.text = @"上海大众POLO 1.4L／1.6L车型厂家保养项目表";
        view.textColor = Color(@"#000000");
        view.font = [UIFont systemFontOfSize:({
            CGFloat size = 14;
            if (IS_IPHONE_4S) size = 8;
            if (IS_IPHONE_5 ) size = 12;
            size;
        }) weight:1];
        [view sizeToFit];
        view;
    });
}
- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = title;
}
@end
