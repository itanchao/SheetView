//
//  SheetContainerCell.m
//  SheetView
//
//  Created by tanchao on 16/2/23.
//  Copyright © 2016年 谈超. All rights reserved.
//

#import "SheetContainerCell.h"
#import "SeparationLine.h"
@interface SheetContainerCell ()
@property (nonatomic, strong) UIImageView *iconView;
@end
@implementation SheetContainerCell
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
    self.iconView = ({
        UIImageView *view = [UIImageView new];
        [self.contentView addSubview:view];
        [view setImage:[UIImage imageNamed:@"保养手册_07-3"]];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(0);
            make.top.mas_equalTo(self).offset(0.5);
            make.right.mas_equalTo(self).offset(0);
            make.bottom.mas_equalTo(self).offset(-0.5);
        }];
        view;
    });
    return self;
}
- (void)setBackColor:(UIColor *)backColor{
    _backColor = backColor;
    self.iconView.backgroundColor = backColor;
}
- (void)setKeepFit:(BOOL)keepFit{
    _keepFit = keepFit;
    [self.iconView setImage:[UIImage imageNamed:(keepFit?@"保养手册_07-2":@"保养手册_07-3")]];
}

@end
