//
//  SHSetGoalView.h
//  SHSetGoalClass
//
//  Created by 石虎  on 2020/7/12.
//  Copyright © 2020 CDEL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^DatePickerBlock)(UIView *datePicker);
@interface SHSetGoalView : UIScrollView

@property (nonatomic,copy)DatePickerBlock datePickerBlock;
@end

NS_ASSUME_NONNULL_END
