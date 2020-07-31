//
//  ViewController.m
//  SHSetGoalClass
//
//  Created by 石虎  on 2020/7/18.
//  Copyright © 2020 cdel. All rights reserved.
//

#import "ViewController.h"
#import "SHSetGoalView.h"

@interface ViewController ()
@property (nonatomic, strong) SHSetGoalView *setGoalView;

//接收清晰度所有数据
@property (nonatomic, strong) NSDictionary *additionParam;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.view.backgroundColor = [UIColor whiteColor];
     [self.view addSubview:self.setGoalView];
    
    
}
#pragma mark -
#pragma mark - Getter Method
- (SHSetGoalView *)setGoalView{
    if (!_setGoalView) {
        _setGoalView = [[SHSetGoalView alloc] initWithFrame:CGRectMake(0, 100,  [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
        __weak typeof(self) weakSelf = self;
        _setGoalView.datePickerBlock = ^(UIView * _Nonnull datePicker) {
             [weakSelf.view addSubview:datePicker];
        };
    }
    return _setGoalView;
}

@end
