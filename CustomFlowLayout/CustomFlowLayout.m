//
//  CustomFlowLayout.m
//  CustomFlowLayout
//
//  Created by apple on 17/1/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "CustomFlowLayout.h"

#define kItem 100

@implementation CustomFlowLayout

// 做一些初始化工作, 准备布局
- (void)prepareLayout{
    // 设置大小
    self.itemSize = CGSizeMake(kItem, kItem);
    // 设置滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 最小行间距
    self.minimumLineSpacing = 50;
}

// 是否时刻改变并重新布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

// 数组里放置的是每一个item设置的属性(例如: frame)
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    // 从父类中获取item 放置属性的数组
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    // 获取屏幕的中心点
    CGFloat centerX = self.collectionView.frame.size.width * 0.5 + self.collectionView.contentOffset.x;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        // item的中心点
        CGFloat itemCenterX = attrs.center.x;
        CGFloat scale = 1 + 0.5 * (1 - ABS(itemCenterX - centerX) / 200);
        attrs.transform3D = CATransform3DMakeScale(scale, scale, 1.0);
    }
    return array;
}


@end
