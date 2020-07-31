# slider有刻度时间滑杆

#### 介绍
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

#### 软件架构
软件架构说明


#### 安装教程

1.  xxxx
2.  xxxx
3.  xxxx

#### 使用说明

1.  xxxx
2.  xxxx
3.  xxxx

#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request


#### 码云特技

1.  使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
2.  码云官方博客 [blog.gitee.com](https://blog.gitee.com)
3.  你可以 [https://gitee.com/explore](https://gitee.com/explore) 这个地址来了解码云上的优秀开源项目
4.  [GVP](https://gitee.com/gvp) 全称是码云最有价值开源项目，是码云综合评定出的优秀开源项目
5.  码云官方提供的使用手册 [https://gitee.com/help](https://gitee.com/help)
6.  码云封面人物是一档用来展示码云会员风采的栏目 [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)
