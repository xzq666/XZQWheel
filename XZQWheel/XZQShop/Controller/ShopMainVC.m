//
//  ShopMainVC.m
//  XZQWheel
//
//  Created by 许卓权 on 2018/3/7.
//  Copyright © 2018年 许卓权. All rights reserved.
//

#import "ShopMainVC.h"
#import "Useful_Define.h"
#import "TopToolView.h"
#import "SlideShowHeaderView.h"
#import "GoodGridCell.h"
#import "GoodGridItem.h"
#import <MJExtension.h>

#define GoodsHomeSilderImagesArray @[@"http://gfs5.gomein.net.cn/T1obZ_BmLT1RCvBVdK.jpg",@"http://gfs9.gomein.net.cn/T1C3J_B5LT1RCvBVdK.jpg",@"http://gfs5.gomein.net.cn/T1CwYjBCCT1RCvBVdK.jpg",@"http://gfs7.gomein.net.cn/T1u8V_B4ET1RCvBVdK.jpg",@"http://gfs7.gomein.net.cn/T1zODgB5CT1RCvBVdK.jpg"]

@interface ShopMainVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) UICollectionView *collectionView;
// 顶部View
@property(nonatomic, strong) TopToolView *topView;
// 10个商品选项
@property(nonatomic, strong) GoodGridCell *goodGridCell;
// 10个商品item数组
@property(nonatomic, strong) NSMutableArray *gridItemArray;

@end

// header
static NSString *const SlideShowHeaderViewID = @"SlideShowHeaderView";
// cell
static NSString *const GoodGridCellID = @"GoodGridCell";

@implementation ShopMainVC

// 懒加载
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        if (@available(iOS 11.0, *)) {
            _collectionView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        } else {
            _collectionView.frame = CGRectMake(0, -20, SCREEN_WIDTH, SCREEN_HEIGHT);
        }
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        // 注册Header
        [_collectionView registerClass:[SlideShowHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SlideShowHeaderViewID];
        // 注册Cell
        [_collectionView registerClass:[GoodGridCell class] forCellWithReuseIdentifier:GoodGridCellID];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置基础页面
    [self setUpBaseUI];
    // 设置顶部视图
    [self setUpTopView];
    // 加载数据
    [self setUpData];
    // 返回按钮
    [self backView];
}

// 页面初始化
- (void)setUpBaseUI {
    self.collectionView.backgroundColor = hexStringToColor(@"#f5f5f5");
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

// 顶部视图
- (void)setUpTopView {
    _topView = [[TopToolView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, Top_Height)];
    _topView.leftItemClickBlock = ^{
        AlertWithMessage(@"扫一扫");
    };
    _topView.rightItemFirstClickBlock = ^{
        AlertWithMessage(@"分类");
    };
    _topView.rightItemSecondClickBlock = ^{
        AlertWithMessage(@"购物车");
    };
    _topView.searchButtonClickBlock = ^{
        AlertWithMessage(@"搜索");
    };
    _topView.voiceButtonClickBlock = ^{
        AlertWithMessage(@"语音");
    };
    [self.view addSubview:_topView];
}

// 返回
- (void)backView {
    
}

// 数据加载
- (void)setUpData {
    _gridItemArray = [GoodGridItem mj_objectArrayWithFilename:@"GoodsGrid.plist"];
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return _gridItemArray.count;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *gridcell = nil;
    if (indexPath.section == 0) {
        GoodGridCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:GoodGridCellID forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        cell.gridItem = _gridItemArray[indexPath.row];
        gridcell = cell;
    }
    return gridcell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
        if (indexPath.section == 0) {
            SlideShowHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SlideShowHeaderViewID forIndexPath:indexPath];
            headerView.imageGroupArray = GoodsHomeSilderImagesArray;
            reusableview = headerView;
        }
    }
    if (kind == UICollectionElementKindSectionFooter) {
        if (indexPath.section == 0) {
            
        }
    }
    return reusableview;
}

#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(SCREEN_WIDTH/5 , SCREEN_WIDTH/5 + 10);
    }
    return CGSizeZero;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    return layoutAttributes;
}

#pragma mark - head宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeMake(SCREEN_WIDTH, 230); //图片滚动的宽高
    }
    return CGSizeZero;
}

#pragma mark - foot宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
}

#pragma mark - <UICollectionViewDelegateFlowLayout>
#pragma mark - X间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return (section == 5) ? 4 : 0;
}
#pragma mark - Y间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return (section == 5) ? 4 : 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
