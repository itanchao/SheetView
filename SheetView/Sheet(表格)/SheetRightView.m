//
//  SheetRightView.m
//  SheetView
//
//  Created by tanchao on 16/2/23.
//  Copyright © 2016年 谈超. All rights reserved.
//

#import "SheetRightView.h"
#import "SheetRightViewCell.h"
@interface SheetRightView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation SheetRightView
- (instancetype)initWithFrame:(CGRect)frame{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    self = [super initWithFrame:frame collectionViewLayout:layout];
    
    //    这里为了解决不同大小cell复用错乱的问题，我注册了两种cell
    [self registerClass:[SheetRightViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.dataSource =self;
    self.delegate = self;
    self.backgroundColor = [UIColor whiteColor];
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.bounces = NO;
    return self;
}
#pragma mark 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  self.dataList.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    SheetRightViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
//    cell.backColor = indexPath.item % 2 == 1 ?Color(@"#f1f1f1"):Color(@"#ffffff");
    cell.title = self.dataList[indexPath.item];
    [cell sizeToFit];
    if (!cell) {
        NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeMake(({
        double width = 65;
        if (IS_IPHONE_4S||IS_IPHONE_5) width = 55;
        width;
    }), ({
        double height = 405;
        if (IS_IPHONE_5) height = 300;
        if (IS_IPHONE_4S)height = 225;
        height;
    }));
    return size;
}
//定义每个UICollectionView 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
- (NSArray *)dataList{
    if (_dataList == nil) {
        _dataList = @[@"机油",
                      @"机油滤清器",
                      @"空气滤清器",
                      @"空调滤清器",
                      @"刹车油",
                      @"手动变速箱油",
                      @"自动变速箱油",
                      @"汽油滤清器",
                      @"火花塞",
                      @"正时皮带"
                    ];
    }
    return _dataList;
}

@end
