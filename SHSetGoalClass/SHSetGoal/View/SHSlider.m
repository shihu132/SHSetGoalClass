//
//  SHSlider.m
//  SHSetGoalClass
//
//  Created by 石虎 on 2020/7/12.
//  Copyright © 2020 CDEL. All rights reserved.
//

#import "SHSlider.h"

#define SLIDER_X_BOUND 30
#define SLIDER_Y_BOUND 40
@interface SHSlider ()
{
    CGRect lastBounds;
}
@end
@implementation SHSlider

- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value {

    rect.origin.x = rect.origin.x;
    rect.size.width = rect.size.width;
    CGRect result = [super thumbRectForBounds:bounds trackRect:rect value:value];
    //记录下最终的frame
    lastBounds = result;
    return result;
}

//检查点击事件点击范围是否能够交给self处理
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    //调用父类方法,找到能够处理event的view
    UIView* result = [super hitTest:point withEvent:event];
    if (result != self) {
        /*如果这个view不是self,我们给slider扩充一下响应范围,
          这里的扩充范围数据就可以自己设置了
        */
        if ((point.y >= -15) &&
            (point.y < (lastBounds.size.height + SLIDER_Y_BOUND)) &&
            (point.x >= 0 && point.x < CGRectGetWidth(self.bounds))) {
            //如果在扩充的范围类,就将event的处理权交给self
            result = self;
        }
    }
    //否则,返回能够处理的view
    return result;
}

//检查是点击事件的点是否在slider范围内
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    //调用父类判断
    BOOL result = [super pointInside:point withEvent:event];
    if (!result) {
        //同理,如果不在slider范围类,扩充响应范围
        if ((point.x >= (lastBounds.origin.x - SLIDER_X_BOUND)) && (point.x <= (lastBounds.origin.x + lastBounds.size.width + SLIDER_X_BOUND))
            && (point.y >= -SLIDER_Y_BOUND) && (point.y < (lastBounds.size.height + SLIDER_Y_BOUND))) {
            //在扩充范围内,返回yes
            result = YES;
        }
    }
    //NSLog(@"UISlider(%@).pointInside: (%f, %f) result=%d", self, point.x, point.y, result);
    //否则返回父类的结果
    return result;
}

@end
