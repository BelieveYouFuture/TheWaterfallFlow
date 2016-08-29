
//  Created by 张文晏
//  Copyright © 2016年 张文晏. All rights reserved.

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface PBShop : NSObject

/*
 
 <key>h</key>
 <integer>301</integer>
 <key>img</key>
 <string>http://s13.mogujie.cn/b7/bao/130926/h259h_kqyucvcbkfbhmrcugfjeg5sckzsew_700x1051.jpg_200x999.jpg</string>
 <key>price</key>
 <string>¥89</string>
 <key>w</key>
 <integer>200</integer>
 
 */
/**
*  高度
*/
@property (nonatomic, assign) CGFloat h;
/**
 *  宽度
 */
@property (nonatomic, assign) CGFloat w;

/**
 * 图片
 */

@property (nonatomic, copy) NSString *img;
/**
 *  价格
 */
@property (nonatomic, copy) NSString *price;


- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)shopWithDict:(NSDictionary *)dict;


@end
