//
//  SHSetGoalView.m
//  SHSetGoalClass
//
//  Created by 石虎  on 2020/7/12.
//  Copyright © 2020 CDEL. All rights reserved.
//

#import "SHSetGoalView.h"
#import "SHSliderView.h"
#import "Masonry.h"
#import "UIView+Frame.h"
#import "UIColor+HexString.h"

@interface SHSetGoalView ()

@property (nonatomic, strong) UIView        *backgroundTimeView;
@property (nonatomic, strong) UIImageView   *backgroundImageView;
@property (nonatomic, strong) SHSliderView  *shSlider;
@property (nonatomic, strong) UIView        *lineView;

@property (nonatomic, strong) UILabel *timeTitel;
@property (nonatomic, strong) UILabel *timeNumber;
@property (nonatomic, strong) UILabel *timeMinute;
@end

@implementation SHSetGoalView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpViews];
        [self setupLayout];
    }
    return self;
}

- (void)setUpViews {

//    [self addSubview:self.scrollView];
    [self addSubview:self.backgroundTimeView];
    [self addSubview:self.lineView];
    [self.backgroundTimeView addSubview:self.backgroundImageView];
    [self.backgroundImageView addSubview:self.timeTitel];
    [self.backgroundImageView addSubview:self.timeNumber];
    [self.backgroundImageView addSubview:self.timeMinute];
    [self.backgroundTimeView addSubview:self.shSlider];
}

- (void)setupLayout {

    [self.backgroundTimeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.width.mas_equalTo(self.width);
        make.height.mas_equalTo(334);
    }];
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(184);
        make.top.mas_equalTo(40);
    }];
    [self.shSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(34+30);
        make.top.mas_equalTo(self.backgroundImageView.bottom).offset(280);
    }];
    [self.timeTitel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(12);
        make.top.mas_equalTo(self.backgroundImageView.top).offset(46);
    }];
    [self.timeNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(53);
        make.top.mas_equalTo(self.timeTitel.bottom).offset(70);
    }];
    [self.timeMinute mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(12);
        make.top.mas_equalTo(self.timeNumber.bottom).offset(130);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(1.0);
        make.bottom.mas_equalTo(self.backgroundTimeView.bottom).offset(-1);
    }];
     
}
- (void)layoutSubviews {
    [super layoutSubviews];
       self.contentSize = CGSizeMake(self.tz_width, CGRectGetMaxY(self.backgroundImageView.frame)+100);
    NSLog(@"==== %f",CGRectGetMaxY(self.backgroundImageView.frame));
}
#pragma mark -
#pragma mark - getter Method
- (UIView *)backgroundTimeView {
    
    if (!_backgroundTimeView) {
        _backgroundTimeView = [[UIView alloc] init];
    }
    return _backgroundTimeView;
}

- (UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sz_img"]];
        _backgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _backgroundImageView;
}

- (UILabel *)timeTitel{
    if (!_timeTitel) {
        _timeTitel = [[UILabel alloc] init];
        _timeTitel.textAlignment = NSTextAlignmentCenter;
        _timeTitel.numberOfLines = 1;
        _timeTitel.textColor = [UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:1];
        _timeTitel.font = [UIFont systemFontOfSize:18];
        _timeTitel.text = [NSString stringWithFormat:@"%@",@"每日学习时长"];
    }
    return _timeTitel;
}

- (UILabel *)timeNumber {
    if (!_timeNumber) {
        _timeNumber = [[UILabel alloc] init];
        _timeNumber.textAlignment = NSTextAlignmentCenter;
        _timeNumber.numberOfLines = 1;
        _timeNumber.textColor = [UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:1];
        _timeNumber.font = [UIFont systemFontOfSize:48];
        _timeNumber.text = [NSString stringWithFormat:@"%@",@"30"];
    }
    return _timeNumber;
}

- (UILabel *)timeMinute {
    if (!_timeMinute) {
        _timeMinute = [[UILabel alloc] init];
        _timeMinute.textAlignment = NSTextAlignmentCenter;
        _timeMinute.numberOfLines = 1;
        _timeMinute.textColor = [UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:1];
        _timeMinute.font = [UIFont systemFontOfSize:18];
        _timeMinute.text = [NSString stringWithFormat:@"%@",@"分钟"];
    }
    return _timeMinute;
}

- (SHSliderView *)shSlider {
    if (!_shSlider) {
        _shSlider = [[SHSliderView alloc] init];
        __weak typeof(self) weakSelf  = self;
        _shSlider.timeNumberBlock = ^(NSString * _Nonnull timeString) {
            if ([timeString intValue] <= 60) {
                 weakSelf.timeNumber.text = [NSString stringWithFormat:@"%@",timeString];
                 weakSelf.timeMinute.text = [NSString stringWithFormat:@"%@",@"分钟"];
            } else {
                if ([timeString intValue]/60 == [timeString floatValue]/60 ) {
                    weakSelf.timeNumber.text = [NSString stringWithFormat:@"%d",[timeString intValue]/60];
                } else {
                    weakSelf.timeNumber.text = [NSString stringWithFormat:@"%.1f",[timeString floatValue]/60];
                }
                weakSelf.timeMinute.text = [NSString stringWithFormat:@"%@",@"小时"];
            }
        };
    }
    return _shSlider;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor colorWithRed:237/255 green:237/255 blue:237/255 alpha:1];
    }
    return _lineView;
}

@end
