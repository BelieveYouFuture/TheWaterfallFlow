
//  Created by 张文晏
//  Copyright © 2016年 张文晏. All rights reserved.

#import "PBShopCell.h"
#import "PBShop.h"
#import "UIImageView+WebCache.h"
@interface  PBShopCell()

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PBShopCell


- (void)setShop:(PBShop *)shop
{

    _shop = shop;
    
    NSURL *url = [NSURL URLWithString:shop.img];
    
    [self.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"123"]];
    
    self.priceLabel.text = shop.price;

}

@end
