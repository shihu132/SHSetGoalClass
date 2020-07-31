# slider有刻度时间滑杆

#### Description
slider有刻度时间滑杆，适配iPad ,适用于教育行业的一个时间使用

/**
* 使用示例说明:
*

       #import "SHSetGoalView.h"
       @property (nonatomic, strong) SHSetGoalView *setGoalView;

       - (void)viewDidLoad {
           [super viewDidLoad];
            self.view.backgroundColor = [UIColor whiteColor];
            [self.view addSubview:self.setGoalView];
       }
 
 
       #pragma mark -
       #pragma mark - Getter Method
       - (SHSetGoalView *)setGoalView{
           if (!_setGoalView) {
               _setGoalView = [[SHSetGoalView alloc] initWithFrame:CGRectMake(0, 100, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
               __weak typeof(self) weakSelf = self;
               _setGoalView.datePickerBlock = ^(UIView * _Nonnull datePicker) {
                    [weakSelf.view addSubview:datePicker];
               };
           }
           return _setGoalView;
       }

    
/**
* 注意点 - 布局为 dome 布局,项目使用要x调细节
        - 依赖 第三方 轻量级 布局 Masonry ,很低,可以不用
        -

* 反馈及联系方式:
*          QQ群号:  807236138
*          Email : 1224614774@qq.com

**/

#### Software Architecture
Software architecture description

#### Installation

1.  xxxx
2.  xxxx
3.  xxxx

#### Instructions

1.  xxxx
2.  xxxx
3.  xxxx

#### Contribution

1.  Fork the repository
2.  Create Feat_xxx branch
3.  Commit your code
4.  Create Pull Request


#### Gitee Feature

1.  You can use Readme\_XXX.md to support different languages, such as Readme\_en.md, Readme\_zh.md
2.  Gitee blog [blog.gitee.com](https://blog.gitee.com)
3.  Explore open source project [https://gitee.com/explore](https://gitee.com/explore)
4.  The most valuable open source project [GVP](https://gitee.com/gvp)
5.  The manual of Gitee [https://gitee.com/help](https://gitee.com/help)
6.  The most popular members  [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)
