//
//  MJCDropdownView.m
//  MJC项目大杂烩
//
//  Created by mjc on 16/11/24.
//
//

#import "MJCDropdownView.h"



//图片宽度
static const CGFloat MJCImageW = 160;
//图片高度
static const CGFloat MJCImageH = 200;


static UIImageView *containerImage_;
static UIWindow *window;
static UIViewController *controller;
static UIButton *button;
static UIView *contentView;


@implementation MJCDropdownView


/** 创建窗口菜单的方法 */
+(void)showFromView:(UIView *)fromView mainImage:(UIImage*)mainImage imagenewMarginX:(CGFloat)imagenewX imagenewMarginY:(CGFloat)imagenewMarginY imagenewWidth:(CGFloat)imagenewWidth imagenewHeight:(CGFloat)imagenewHeight;
{
    [self setupWindow];//添加窗口
    [self setupButton];//添加按钮
    [self setupContainerImageView:mainImage];//添加图片容器
    [self setupImagenewFrame:fromView imagenewMarginX:imagenewX imagenewMarginY:imagenewMarginY imagenewWidth:imagenewWidth imagenewHeight:imagenewHeight];//重新根据外面的子控件的frame,转换坐标系
}



//创建一个窗口
+(void)setupWindow
{
    
    //实例化窗口
    window = [[UIWindow alloc]init];
    
    //先让窗口位置等于负的它的本身高度,那就能从上方显示出来,如果让窗口的Y值一上来等于它的整个屏幕的高度,那就会从下方出来
    CGFloat windowH = MJCScreenHeight;
    CGRect frame = CGRectMake(0,windowH,MJCScreenWidth,windowH);
    window.frame = frame;
    window.backgroundColor = [UIColor clearColor];
    window.windowLevel = UIWindowLevelAlert;//窗口显示位置
    window.hidden = NO;
    
    // 动画效果的实现思路,可以先将窗口位置设置在整个屏幕外,然后再给重新设置它的Y值等于0也就是整个屏幕的Y值,再给动画延迟效果,就能慢慢的往上了
    frame.origin.y = 0;//在这将frame的y值,再调为,我们所想要的位置
    [UIView animateWithDuration:0 animations:^{
        window.frame = frame;//并且重新赋值frame
    }];
    
}
//添加一个按钮(为了点击屏幕销毁窗口)
+(void)setupButton
{
    button = [[UIButton alloc]init];
    button.frame = window.bounds;
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:self action:@selector(btnClickdismiss) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:button];
}

//添加一个主容器imageView
+(void)setupContainerImageView:(UIImage *)image;
{
    //防止图片拉伸
    UIImage *newImage = [self imageStretchableImageWithLeftCap:image];
    
    containerImage_ = [[UIImageView alloc]init];
    
    containerImage_.image = newImage;
    containerImage_.mjc_width = MJCImageW;//containerView的初始宽度值
    containerImage_.mjc_height = MJCImageH;//containerView的初始高度值
    containerImage_.mjc_y = 120;//containerView的初始Y值
    containerImage_.userInteractionEnabled = YES;//开启用户的交互功能
    [button addSubview:containerImage_];
}

//调整主容器图片的最新新位置
+(void)setupImagenewFrame:(UIView *)fromView imagenewMarginX:(CGFloat)imagenewMarginX imagenewMarginY:(CGFloat)imagenewMarginY imagenewWidth:(CGFloat)imagenewWidth imagenewHeight:(CGFloat)imagenewHeight
{
    //调整灰色图片的位置,根据外界传过来的控件,来调整位置
    //转换坐标系
    CGRect newFrame = [fromView convertRect:fromView.bounds toView:window];
    containerImage_.mjc_x = MJCScreenWidth;
    //默认情况下,frame是以父控件左上角为坐标原点 - MJCX(为了离上边有间距)
    containerImage_.mjc_y = CGRectGetMaxY(newFrame) + imagenewMarginY;
    containerImage_.mjc_height = 0;//一上来先让宽度高度为0
    containerImage_.mjc_width = 0;
    [UIView animateWithDuration:0 animations:^{
        containerImage_.mjc_height = imagenewHeight;//慢慢的给它设置宽度高度
        containerImage_.mjc_width = imagenewWidth;
        //从之前超过屏幕的位置,慢慢的移动到我们想要的位置 CGRectGetMidX就是 fromView中间的X位置
        containerImage_.mjc_centerX = CGRectGetMidX(newFrame) + imagenewMarginX;
    }];
    
}

/** 获取控制器的界面 */
+(void)showContentController:(UIViewController *)contentController;
{
    controller = contentController;
    
    [self showContentSubView:controller.view];
}

/** 添加子界面并且设置位置大小 */
+(void)showContentSubView:(UIView *)contentSubView;
{
    contentView = contentSubView;
    //调整内容的位置
    contentView.mjc_x = 10;//为了与灰色容器x方向有10间距
    contentView.mjc_y = 15;//为了与容器顶部有15间距
    
    //调整内容的宽度
    contentView.mjc_width = containerImage_.mjc_width - 2 * contentView.mjc_x;//为了与右边X方向有间距
    
    //设置主灰色图片容器的尺寸
    contentView.mjc_height = containerImage_.mjc_height - 30;
    
    //添加内容到灰色的下拉图片的容器里面
    [containerImage_ addSubview:contentView];
}



// 修改子界面尺寸(提供的方法给人家自定义位置)
+(void)setupContentFrame
{
    //调整内容的位置
    contentView.mjc_x = 10;//为了与灰色容器x方向有10间距
    contentView.mjc_y = 15;//为了与容器顶部有15间距
    //调整内容的宽度
    contentView.mjc_width = containerImage_.mjc_width - 2 * contentView.mjc_x;//为了与右边X方向有间距
    //调整内容高度
    contentView.mjc_height = containerImage_.mjc_height - 30;
}



//按钮的点击方法
+(void)btnClickdismiss
{
    //动画的隐藏效果
    [UIView animateWithDuration:0.1 animations:^{
//直接将窗口的y =  它的负数高度... (反正改变它的y值就可以了)
//        window.mjc_y = -window.mjc_height;
//        containerImage_.mjc_x = MJCScreenWidth / 2;
//        containerImage_.mjc_width = 0;
//        containerImage_.mjc_height = 0;
    } completion:^(BOOL finished) { //动画完成之后
        window = nil;//直接将窗口为空
    }];

}

//销毁窗口的方法
+(void)hidedismiss:(NSTimeInterval)duration
{
    //动画的隐藏效果
    [UIView animateWithDuration:duration animations:^{
        //直接将窗口的y =  它的负数高度... (反正改变它的y值就可以了)
        //        window.mjc_y = -window.mjc_height;
        containerImage_.mjc_x = MJCScreenWidth / 2;
        containerImage_.mjc_width = 0;
        containerImage_.mjc_height = 0;
    } completion:^(BOOL finished) { //动画完成之后
        window = nil;//直接将窗口为空
    }];
}


//设置图片透明度
+ (UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    CGContextSetAlpha(ctx, alpha);
    
    CGContextDrawImage(ctx, area, image.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

+(UIImage *)imageStretchableImageWithLeftCap:(UIImage *)image
{
    //防止图片拉伸
    UIImage *newimage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height * 0.5,image.size.width *0.5,image.size.height * 0.5, image.size.width * 0.5)];
    
    return newimage;
}


@end
