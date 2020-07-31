//
//  UIColor+HexString.h
//  SHSetGoalClass
//
//  Created by 石虎  on 2020/7/18.
//  Copyright © 2020 cdel. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (HexString)

+ (UIColor *) colorWithHexString: (NSString *) hexString;
@end

NS_ASSUME_NONNULL_END
