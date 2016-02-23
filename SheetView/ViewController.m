//
//  ViewController.m
//  SheetView
//
//  Created by tanchao on 16/2/23.
//  Copyright © 2016年 谈超. All rights reserved.
//

#import "ViewController.h"
#import "SheetTopView.h"
#import "SheetLeftView.h"
#import "SheetTitleCell.h"
#import "SheetRightView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
    self.view.backgroundColor = Color(@"#f6f6f6");
}
- (void)prepareUI{
    UIView *nav = ({
        UIView *view = [UIView new];
        //        view.titleLabel.text = self.title;
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(self.view);
            make.height.equalTo(@(NAVIGATIONBAR_HEIGHT));
        }];
        view;
    });
    SheetTopView *tpView = ({
        SheetTopView *view = [SheetTopView new];
        view.title = @"上海大众POLO  1.4L／1.6L车型厂家保养项目表";
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(nav.mas_bottom).offset(({
                double offset = 40;
                if (IS_IPHONE_5) offset = 30;
                offset;
            }));
            make.centerX.mas_equalTo(self.view);
            make.width.mas_equalTo({
                double Width = 345.0;
                if (IS_IPHONE_4S) Width = 320.0;
                if (IS_IPHONE_5) Width = 300.0;
                Width;
            });
            make.height.mas_equalTo({
                double height = 45.0;
                if (IS_IPHONE_5) height = 40;
                height;
            });
        }];
        view;
    });
    SheetTitleCell *leftTitleCell = ({
        SheetTitleCell *view = [SheetTitleCell new];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(tpView.mas_bottom);
            make.left.mas_equalTo(tpView.mas_left);
            //            make.width.equalTo(@85);
            make.width.mas_equalTo({
                double Width = 85;
                if (IS_IPHONE_5) Width = 70;
                Width;
            });
            //            make.height.equalTo(@45);
            make.height.mas_equalTo({
                double Height = 45;
                if (IS_IPHONE_5) Height = 30;
                Height;
            });
        }];
        view;
    });
    SheetLeftView *leftView = ({
        SheetLeftView *view = [SheetLeftView new];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(leftTitleCell.mas_bottom);
            make.left.mas_equalTo(leftTitleCell.mas_left);
            make.height.equalTo(@360);
            make.width.equalTo(@85);
        }];
        view;
    });
    SheetRightView *rightView = ({
        SheetRightView *view = [SheetRightView new];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftView.mas_right);
            make.top.mas_equalTo(tpView.mas_bottom);
            make.bottom.mas_equalTo(leftView);
            make.right.mas_equalTo(tpView);
        }];
        view;
    });
    UILabel *tipsLbl = ({
        UILabel *lbl = [UILabel new];
        [self.view addSubview:lbl];
        [lbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(tpView);
            make.top.mas_equalTo(leftView.mas_bottom).offset(4);
        }];
        lbl.text = @"整车保质期为3年或10公里";
        lbl.textColor = Color(@"#000000");
        lbl.font = [UIFont systemFontOfSize:12];
        lbl;
    });
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end