//
//  SheetContainerView.m
//  SheetView
//
//  Created by tanchao on 16/2/23.
//  Copyright © 2016年 谈超. All rights reserved.
//

#import "SheetContainerView.h"
#import "SheetContainerCell.h"
@interface SheetContainerView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation SheetContainerView
- (instancetype)initWithFrame:(CGRect)frame{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    self = [super initWithFrame:frame collectionViewLayout:layout];
    //    这里为了解决不同大小cell复用错乱的问题，我注册了两种cell
    [self registerClass:[SheetContainerCell class] forCellWithReuseIdentifier:@"cell"];
    self.dataSource =self;
    self.delegate = self;
    self.backgroundColor = [UIColor whiteColor];
    self.showsVerticalScrollIndicator = NO;
    self.bounces = NO;
    self.pagingEnabled = YES;
    [NOTIFICATION_CENTER addObserver:self selector:@selector(shouldScroll:) name:SHEETVIEWSCROLL object:nil];
    return self;
}
- (void)shouldScroll:(NSNotification *)not{
    if ([self isEqual:not.object]) return;
    UIScrollView *scrolleView = [not.userInfo objectForKey:@"scrollView"];
    [self setContentOffset:scrolleView.contentOffset];
}
- (void)dealloc{
    [NOTIFICATION_CENTER removeObserver:self name:@"tanchaoScroll" object:nil];
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
    SheetContainerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.backColor = indexPath.item % 2 == 1 ?Color(@"#f1f1f1"):Color(@"#ffffff");
    cell.keepFit = [self.dataList[indexPath.item] boolValue];
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
        double height = 45;
        if (IS_IPHONE_4S||IS_IPHONE_5) height = 37.5;
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
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSDictionary *dic = [NSDictionary dictionaryWithObject:scrollView forKey:@"scrollView"];
    [NOTIFICATION_CENTER postNotificationName:SHEETVIEWSCROLL object:self userInfo:dic];
}
- (NSArray *)dataList{
    if (_dataList == nil) {
        _dataList = @[@true,@false,@true,@false,@false,@false,@false,@false,@false,@false,@false,@false,@false,@true,@false,@false,@false,@true,@false
            ];
    }
    return _dataList;
}

@end
