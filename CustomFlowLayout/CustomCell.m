//
//  CustomCell.m
//  CustomFlowLayout
//
//  Created by apple on 17/1/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.ImgView = [[UIImageView alloc] initWithFrame:self.contentView.frame];
        [self.contentView addSubview:self.ImgView];
    }
    return self;
}

@end
