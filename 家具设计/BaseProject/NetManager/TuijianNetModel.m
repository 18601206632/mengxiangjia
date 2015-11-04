//
//  TuijianNetModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuijianNetModel.h"

@implementation TuijianNetModel
+(id)getPage:(NSInteger)page completionHandle:(void (^)(NSArray *model,NSError *error))completionHandle
{
    NSString *path=[NSString stringWithFormat:@"http://ihome.cmfmobile.com:8080/sp/custom/getIndexProjectList.do?pn=%ld",page];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([TuijianModel objectArrayWithKeyValuesArray:responseObj],error);
        
    }];
    
}
@end
