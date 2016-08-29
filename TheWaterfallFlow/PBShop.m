
//  Created by 张文晏
//  Copyright © 2016年 张文晏. All rights reserved.

#import "PBShop.h"

@implementation PBShop


- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        [self  setValuesForKeysWithDictionary:dict];
    }

    return self;
}

+ (instancetype)shopWithDict:(NSDictionary *)dict
{
    return  [[self alloc]initWithDict:dict];

}

@end
