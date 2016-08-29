
//  Created by 张文晏
//  Copyright © 2016年 张文晏. All rights reserved.

#import "PBFlowLayout.h"
#import "PBShop.h"
@interface PBFlowLayout ()

@property (nonatomic, strong) NSArray *atts;

@property (nonatomic, assign) CGSize s;

@end

@implementation PBFlowLayout



- (void)prepareLayout
{
    [super prepareLayout];
    
    
    //列数
    int cols = 3;
    
    //列号
    
    int col;
    
    //间隙
    CGFloat margin = self.minimumInteritemSpacing;
    
    //内容的宽度
    
    CGFloat contentW = self.collectionView.frame.size.width - self.sectionInset.left - self.sectionInset.right - margin * (cols -1);
    
    //宽度
    CGFloat itemW = contentW / cols;
    
    //高度
    CGFloat itemH;
    
    //X
    
    CGFloat itemX;
    
    
    //创建 C语言数组 保存每一列的列高
    
    CGFloat colHeights[cols];
    
    for (int i = 0; i < cols; i++) {
        
        colHeights[i] = self.sectionInset.top;
    }
    
    
    //遍历数组  根据模型的真实宽度和高度 设置 对应的 item
    
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:self.shops.count];
    for (int i = 0; i < self.shops.count; i ++) {
        
        PBShop *shop = self.shops[i];
        
        //根据模型里面的宽高比 计算 高度
        
         itemH = shop.h / shop.w * itemW;
        
        //计算列数
        col = i % 3;
        //计算 X
        itemX = self.sectionInset.left + col * (itemW + margin);
        
        
        //创建UICollectionViewLayoutAttributes 对象
        
        UICollectionViewLayoutAttributes *att = [UICollectionViewLayoutAttributes  layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        
        
        //设置att 的frame  决定最后item 显示在的位置
        
        att.frame = CGRectMake(itemX, colHeights[col], itemW, itemH + 30);
        
        //设置完之后  当前这一列上的高度 做一个累加的操作
        
        colHeights[col] += itemH + 30;
        
        //添加到数组中
        
        [temp addObject:att];
        
    }
    self.atts = temp;
    
    
    //遍历数组 得到最高列
    
    CGFloat h = 0;
    
    for (int i = 0; i < cols; i ++) {
        
        if (h < colHeights[i]) {
            
            h = colHeights[i];
        }
    }
    
    
    //计算行数
    
    int row = (int)self.shops.count / cols;
    
    int yushu = (int)self.shops.count % cols;
    
    if (yushu != 0) {
        row = row + 1;
    }
    
    
    
    self.itemSize = CGSizeMake( itemW,h / row);

}
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    NSArray *arr = [super layoutAttributesForElementsInRect:rect];    
    
    return self.atts;
}


//懒加载数组
- (NSArray *)atts
{
    if (_atts == nil) {
        
        _atts = [NSArray array];
        
    }
    
    return _atts;
}


@end
