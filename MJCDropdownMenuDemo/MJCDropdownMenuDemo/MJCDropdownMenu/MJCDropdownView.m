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
    [self setupWindow];
    [self setupButton];
    [self setupContainerImageView:mainImage];
    [self setupImagenewFrame:fromView imagenewMarginX:imagenewX imagenewMarginY:imagenewMarginY imagenewWidth:imagenewWidth imagenewHeight:imagenewHeight];
}

+(void)setupWindow
{
    window = [[UIWindow alloc]init];
    CGFloat windowH = MJCScreenHeight;
    CGRect frame = CGRectMake(0,windowH,MJCScreenWidth,windowH);
    window.frame = frame;
    window.backgroundColor = [UIColor clearColor];
    window.windowLevel = UIWindowLevelAlert;
    window.hidden = NO;
    
    frame.origin.y = 0;
    [UIView animateWithDuration:0 animations:^{
        window.frame = frame;
    }];
    
}
+(void)setupButton
{
    button = [[UIButton alloc]init];
    button.frame = window.bounds;
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:self action:@selector(btnClickdismiss) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:button];
}

+(void)setupContainerImageView:(UIImage *)image;
{
    UIImage *newImage = [self imageStretchableImageWithLeftCap:image];
    
    containerImage_ = [[UIImageView alloc]init];
    
    containerImage_.image = newImage;
    containerImage_.mjc_width = MJCImageW;
    containerImage_.mjc_height = MJCImageH;
    containerImage_.mjc_y = 120;
    containerImage_.userInteractionEnabled = YES;//开启用户的交互功能
    [button addSubview:containerImage_];
}
+(void)setupImagenewFrame:(UIView *)fromView imagenewMarginX:(CGFloat)imagenewMarginX imagenewMarginY:(CGFloat)imagenewMarginY imagenewWidth:(CGFloat)imagenewWidth imagenewHeight:(CGFloat)imagenewHeight
{
    CGRect newFrame = [fromView convertRect:fromView.bounds toView:window];
    containerImage_.mjc_x = MJCScreenWidth;
    containerImage_.mjc_y = CGRectGetMaxY(newFrame) + imagenewMarginY;
    containerImage_.mjc_height = 0;
    containerImage_.mjc_width = 0;
    [UIView animateWithDuration:0 animations:^{
        containerImage_.mjc_height = imagenewHeight;
        containerImage_.mjc_width = imagenewWidth;
        containerImage_.mjc_centerX = CGRectGetMidX(newFrame) + imagenewMarginX;
    }];
    
}

+(void)showContentController:(UIViewController *)contentController;
{
    controller = contentController;
    
    [self showContentSubView:controller.view];
}
+(void)showContentSubView:(UIView *)contentSubView;
{
    contentView = contentSubView;
    contentView.mjc_x = 10;
    contentView.mjc_y = 15;
    contentView.mjc_width = containerImage_.mjc_width - 2 * contentView.mjc_x;
    contentView.mjc_height = containerImage_.mjc_height - 30;
    [containerImage_ addSubview:contentView];
}
+(void)setupContentFrame
{
    contentView.mjc_x = 10;
    contentView.mjc_y = 15;
    contentView.mjc_width = containerImage_.mjc_width - 2 * contentView.mjc_x;
    contentView.mjc_height = containerImage_.mjc_height - 30;
}
+(void)btnClickdismiss
{
    [UIView animateWithDuration:0.1 animations:^{
//        window.mjc_y = -window.mjc_height;
//        containerImage_.mjc_x = MJCScreenWidth / 2;
//        containerImage_.mjc_width = 0;
//        containerImage_.mjc_height = 0;
    } completion:^(BOOL finished) { //动画完成之后
        window = nil;//直接将窗口为空
    }];

}

+(void)hidedismiss:(NSTimeInterval)duration
{
    //动画的隐藏效果
    [UIView animateWithDuration:duration animations:^{
        //        window.mjc_y = -window.mjc_height;
        containerImage_.mjc_x = MJCScreenWidth / 2;
        containerImage_.mjc_width = 0;
        containerImage_.mjc_height = 0;
    } completion:^(BOOL finished) { //动画完成之后
        window = nil;//直接将窗口为空
    }];
}
+(UIImage *)imageStretchableImageWithLeftCap:(UIImage *)image
{
    //防止图片拉伸
    UIImage *newimage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height * 0.5,image.size.width *0.5,image.size.height * 0.5, image.size.width * 0.5)];
    
    return newimage;
}


@end
