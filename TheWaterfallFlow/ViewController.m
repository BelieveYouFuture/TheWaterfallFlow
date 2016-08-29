
//  Created by 张文晏
//  Copyright © 2016年 张文晏. All rights reserved.


#import "ViewController.h"
#import "PBShop.h"
#import "PBShopCell.h"
#import "PBFlowLayout.h"
@interface ViewController ()

@property (nonatomic, strong) NSArray *shops;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //获取当前的流水布局
    
    PBFlowLayout *flowLayout = (PBFlowLayout *)self.collectionView.collectionViewLayout;
    
    flowLayout.shops = self.shops;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.shops.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    PBShopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"shop" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0];
    
    cell.shop = self.shops[indexPath.row];
    
    return cell;
}


//懒加载
- (NSArray *)shops
{
    if (_shops == nil) {
        
        NSMutableArray *a = [NSMutableArray array];
        
        NSString *path = [[NSBundle mainBundle]pathForResource:@"1.plist" ofType:nil];
        NSArray *temp = [NSArray arrayWithContentsOfFile:path];
        
        //遍历数组进行字典转模型
        
        for (NSDictionary *dict  in temp) {
            
            PBShop *shop = [PBShop shopWithDict:dict];
            [a addObject:shop];
        }
        
        _shops = a;
    }
    
    return _shops;
}

@end
