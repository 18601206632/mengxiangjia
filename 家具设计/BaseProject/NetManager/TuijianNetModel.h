//
//  TuijianNetModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "TuijianModel.h"
@interface TuijianNetModel : BaseNetManager
+(id)getPage:(NSInteger)page completionHandle:(void (^)(NSArray *model,NSError *error))completionHandle;


@end
