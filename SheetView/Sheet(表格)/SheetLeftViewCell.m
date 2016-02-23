//
//  SheetLeftViewCell.m
//  SheetView
//
//  Created by tanchao on 16/2/23.
//  Copyright © 2016年 谈超. All rights reserved.
//

#import "SheetLeftViewCell.h"
#import "SeparationLine.h"
@interface SheetLeftViewCell ()
@property (nonatomic, strong) UILabel *titleLabel;
@end
@implementation SheetLeftViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    SeparationLine *Separation = ({
        SeparationLine *view = [SeparationLine new];
        [self.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.mas_equalTo(self.contentView);
        }];
        view;
    });
    self.titleLabel = ({
        UILabel *view = [UILabel new];
        [self.contentView addSubview:view];
        view.font =[UIFont systemFontOfSize:14];
        view.backgroundColor = [UIColor whiteColor];
        view.textAlignment = NSTextAlignmentCenter;
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(1);
            make.top.mas_equalTo(self).offset(0.5);
            make.right.mas_equalTo(self).offset(-1);
            make.bottom.mas_equalTo(self).offset(-0.5);
        }];
        view;
    });
    return self;
}
- (void)setBackColor:(UIColor *)backColor{
    _backColor = backColor;
    self.titleLabel.backgroundColor = backColor;
}
- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = title;
}

@end
