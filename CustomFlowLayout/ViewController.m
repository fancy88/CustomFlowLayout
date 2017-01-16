//
//  ViewController.m
//  CustomFlowLayout
//
//  Created by apple on 17/1/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "CustomFlowLayout.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController

NSString *identifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    CustomFlowLayout *flowLayout = [[CustomFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 200) collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor cyanColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [self.view addSubview:collectionView];

    // 注册
    [collectionView registerClass:[CustomCell class] forCellWithReuseIdentifier:identifier];
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UICollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell.ImgView setImage:[UIImage imageNamed:@"scenery"]];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 12;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击第%ld张图片",indexPath.row);
    NSString *titleStr = [NSString stringWithFormat:@"点击了第%ld张图片",indexPath.row];
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:titleStr message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVC addAction:sureAction];
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
