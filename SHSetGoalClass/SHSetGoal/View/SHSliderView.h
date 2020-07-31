//
//  SHSliderView.h
//  SHSetGoalClass
//
//  Created by 石虎  on 2020/7/15.
//  Copyright © 2020 CDEL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^TimeNumberBlock)(NSString *timeString);
@interface SHSliderView : UIView
@property (nonatomic, copy)TimeNumberBlock timeNumberBlock;
@end

NS_ASSUME_NONNULL_END
