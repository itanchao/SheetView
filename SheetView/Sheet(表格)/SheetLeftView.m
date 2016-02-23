//
//  SheetLeftView.m
//  SheetView
//
//  Created by tanchao on 16/2/22.
//  Copyright © 2016年 谈超. All rights reserved.
//

#import "SheetLeftView.h"
#import "SheetLeftViewCell.h"
@interface SheetLeftView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation SheetLeftView
- (instancetype)initWithFrame:(CGRect)frame{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    self = [super initWithFrame:frame collectionViewLayout:layout];
    //    这里为了解决不同大小cell复用错乱的问题，我注册了两种cell
    [self registerClass:[SheetLeftViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.dataSource =self;
    self.delegate = self;
    self.backgroundColor = [UIColor whiteColor];
    self.showsVerticalScrollIndicator = NO;
    self.bounces = NO;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shouldScroll:) name:@"tanchaoScroll" object:nil];
    return self;
}
- (void)shouldScroll:(NSNotification *)not{
    if ([self isEqual:not.object])return;
    UIScrollView *scrolleView = [not.userInfo objectForKey:@"scrollView"];
    [self setContentOffset:scrolleView.contentOffset];
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"tanchaoScroll" object:nil];
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
    SheetLeftViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.backColor = indexPath.item % 2 == 1 ?Color(@"#f1f1f1"):Color(@"#ffffff");
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
        double width = 85;
        if (IS_IPHONE_4S) width = 70;
        width;
    }), ({
        double height = 45;
        if (IS_IPHONE_4S) height = 37.5;
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
    [[NSNotificationCenter defaultCenter] postNotificationName:@"tanchaoScroll" object:self userInfo:dic];
}
- (NSArray *)dataList{
    if (_dataList == nil) {
        _dataList = @[@"5000",
                      @"15000",
                      @"20000",
                      @"25000",
                      @"30000",
                      @"35000",
                      @"40000",
                      @"45000",
                      @"50000",
                      @"55000",
                      @"60000",
                      @"65000",
                      @"70000",
                      @"75000",
                      @"80000",
                      @"85000",
                      @"90000",
                      @"95000",
                      @"10000"
                      ];
    }
    return _dataList;
}


@end
