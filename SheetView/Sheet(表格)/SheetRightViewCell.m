//
//  SheetRightViewCell.m
//  SheetView
//
//  Created by tanchao on 16/2/23.
//  Copyright © 2016年 谈超. All rights reserved.
//

#import "SheetRightViewCell.h"
#import "SeparationLine.h"
#import "SheetTitleCell.h"
#import "SheetContainerView.h"
@interface SheetRightViewCell ()
@property (nonatomic, strong) SheetTitleCell *titleCell;
@end
@implementation SheetRightViewCell
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
    self.titleCell = ({
        SheetTitleCell *view = [SheetTitleCell new];
        [self.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self);
            make.left.mas_equalTo(self.mas_left);
            make.width.mas_equalTo(self.mas_width);
            make.height.mas_equalTo({
                double Height = 45;
                if (IS_IPHONE_4S) Height = 37.5;
                Height;
            });
        }];
        view;
    });
    SheetContainerView *collectionView = ({
        SheetContainerView *view = [SheetContainerView new];
        [self.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleCell.mas_bottom);
            make.centerX.mas_equalTo(self);
            make.width.mas_equalTo(self.titleCell.mas_width);
            make.bottom.mas_equalTo(self);
        }];
        view;
    });
    return self;
}
- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleCell.title = title;
}
@end
