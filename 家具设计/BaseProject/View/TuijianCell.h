//
//  TuijianCell.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ScrollDisplayViewController.h"
@interface TuijianCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UIView *greenView;

@property (weak, nonatomic) IBOutlet UILabel *descLb;
@property (weak, nonatomic) IBOutlet UILabel *priceLb;
@property (weak, nonatomic) IBOutlet UILabel *buildLb;
@property (weak, nonatomic) IBOutlet UIView *yellowView;



@end
