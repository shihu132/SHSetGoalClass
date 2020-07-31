//
//  SHSliderView.m
//  SHSetGoalClass
//
//  Created by 石虎 on 2020/7/15.
//  Copyright © 2020 CDEL. All rights reserved.
//

#import "SHSliderView.h"
#import "SHSlider.h"
#import "UIColor+HexString.h"

@interface SHSliderView ()

@property(nonatomic,strong) SHSlider *slider;
@property(nonatomic,strong) NSNumber *number;
@property(nonatomic,assign) CGFloat leftSpace;
@property(nonatomic,assign) CGFloat leftTitleSpace; //标题左间距
@property(nonatomic,assign) CGFloat scaleHeight;
@property(nonatomic,strong) NSMutableArray *titleLabelArray;
@property(nonatomic,strong) NSMutableArray *arrayLine;
@property(nonatomic,strong) NSMutableArray *numberMarray;

@end

@implementation SHSliderView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.leftSpace      = 45;
        self.scaleHeight    = 5.4;
        self.leftTitleSpace = 32;
        
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
        self.backgroundColor = [UIColor whiteColor];
        _slider = [[SHSlider alloc]initWithFrame:CGRectMake(self.leftSpace, self.scaleHeight*2, [[UIScreen mainScreen] bounds].size.width - self.leftSpace*2, 2)];
        for (int i = 0; i <= 12; i++) { //让滑块一次滑动30，总共滑动11次
            [self.numberMarray addObject:@(i * 30)];
        }
        NSInteger numberOfSteps = ((float)[self.numberMarray count] - 1);
        _slider.maximumValue = numberOfSteps;
        _slider.minimumValue = 0.0;
        _slider.continuous = YES;//是否随滑动时候变化
        _slider.maximumTrackTintColor = [UIColor colorWithRed:237/255 green:237/255 blue:237/255 alpha:1];
        _slider.minimumTrackTintColor = [UIColor colorWithHexString:@"#4bb9ff"]; //进度条颜色
        [_slider setThumbImage:[UIImage imageNamed:@"Slider_ellipse_image"] forState:UIControlStateNormal];
        [_slider setThumbImage:[UIImage imageNamed:@"Slider_ellipse_image"] forState:UIControlStateHighlighted];
        [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
        [_slider setValue:1 animated:NO];//设置默认值
        [self addTimeScale];
        [self addSubview:self.slider];
        [self addTimeTitle];
}

#pragma mark ==== 时间刻度====

//测试
- (void)addTimeScale {

        CGFloat lineW = (_slider.frame.size.width-4)/(self.numberMarray.count-1);
        NSLog(@"lineW==== %f  self.numberMarray.count==%lu",
        lineW,self.numberMarray.count);
      for (NSInteger i = 0; i < self.numberMarray.count; i++) {

          
          CGFloat cg = 0.0;
                  if (i==1 ||i==2 || i==3) {
                      cg = 2;
                  } else if (i==8 || i== 9 || i==10 || i== 11 ||i==12) {
                      cg = -3;
                  } else {
                      cg = 0.0;
                  }
                 
          UILabel * line = [[UILabel alloc]initWithFrame:CGRectMake(self.leftSpace+2+cg+(i*lineW),
                                                                            self.scaleHeight,2,self.scaleHeight)];
                  
 
             if (i % 2 == 0) {
                 if (i == 0 || i== 12) { //隐藏最前和最后的刻度
                     line.hidden = YES;
                 } else {
                     line.hidden = NO;
                 }
             } else {line.hidden = YES;
             }

            line.backgroundColor = [UIColor colorWithRed:237/255 green:237/255 blue:237/255 alpha:1];//设置刻度默认颜色
            line.tag = i;
            [self.arrayLine addObject:line];
            [self addSubview:line];

     }
}

#pragma mark ==== 时间标题 ====

- (void)addTimeTitle {
        NSArray *titleArray = [NSArray arrayWithObjects:@"0分钟",@"1小时",@"2小时",@"3小时",@"4小时",@"5小时",@"6小时",nil];
        CGFloat width = titleArray == nil ? 0 : ( [[UIScreen mainScreen] bounds].size.width - self.leftTitleSpace*2)/titleArray.count;//标题宽度
        for (int i = 0; i < titleArray.count; i++) {
            UILabel * titleLabel = [[UILabel alloc] initWithFrame:(CGRect){{i*width+self.leftTitleSpace,CGRectGetMaxY(self.slider.frame)+16},{width,12}}];
            titleLabel.textColor =  [UIColor colorWithRed:153/255 green:153/255 blue:153/255 alpha:1]; //标题默认颜色
            titleLabel.font = [UIFont systemFontOfSize:12];
            titleLabel.tag = i;
            titleLabel.textAlignment = NSTextAlignmentCenter;
            if (0 == i){
                titleLabel.textAlignment = NSTextAlignmentLeft;
            }else if (titleArray.count - 1 == i){
                titleLabel.textAlignment = NSTextAlignmentRight;
            }
            [self addSubview:titleLabel];
            titleLabel.text = [titleArray objectAtIndex:i];
            [self.titleLabelArray addObject:titleLabel];
        }
}

#pragma mark ==== 滑动滑块 ====

- (void)sliderValueChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    NSUInteger index = (NSUInteger)(slider.value);// index = 0 -12
    [slider setValue:index animated:NO];
    self.number = self.numberMarray[index];
    !_timeNumberBlock ? : _timeNumberBlock([NSString stringWithFormat:@"%@",self.number]);
    [UIView animateWithDuration:0.3 animations:^{

          for (UILabel * label in self.titleLabelArray) {    //改变title的颜色
            if (( index / 2) == label.tag) { //lab = 0-6
                 if (index < 2) {
                     label.textColor = [UIColor colorWithRed:153/255 green:153/255 blue:153/255 alpha:1]; //title - 默认颜色
                 } else {
                     label.textColor =[UIColor colorWithHexString:@"#4bb9ff"];   //title -选中颜色
                 }
            }else{   label.textColor = [UIColor colorWithRed:153/255 green:153/255 blue:153/255 alpha:1]; //title -默认颜色
            }
          }
      
          for (UILabel * lineLabel in self.arrayLine) {      //改变刻度的颜色
                if (lineLabel.tag <= index) {
                    lineLabel.backgroundColor = [UIColor colorWithHexString:@"#4bb9ff"];  //刻度 - 选中颜色
                }else{
                    lineLabel.backgroundColor = [UIColor colorWithRed:237/255 green:237/255 blue:237/255 alpha:1];//刻度 - 默认颜色
                }
            }
      } completion:^(BOOL finished){
      }];
}


#pragma mark ===== lazy =====

- (NSMutableArray *)titleLabelArray {
    if (!_titleLabelArray) {
        _titleLabelArray = [NSMutableArray array];
    }
    return _titleLabelArray;
}

- (NSMutableArray *)arrayLine {
    if (!_arrayLine) {
        _arrayLine = [NSMutableArray array];
    }
    return _arrayLine;
}

- (NSMutableArray *)numberMarray {
    if (!_numberMarray) {
        _numberMarray = [NSMutableArray array];
    }
    return _numberMarray;
}

@end

