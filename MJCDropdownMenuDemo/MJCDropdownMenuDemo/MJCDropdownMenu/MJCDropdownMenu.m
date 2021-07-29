//
//  MJCSAOYISAOSHISHI.m
//  MJC项目大杂烩
//
//  Created by mjc on 16/11/23.
//
//

#import "MJCDropdownMenu.h"
#import "MJCDropdownView.h"


///** 为了调整图片的X */ //以及图片里面子控件的X值
static const CGFloat MJCXMargin = 35;

/** 为了调整图片的Y */ //图片里面子控件的Y值
static const CGFloat MJCMarginY = 10;

//图片宽度
static const CGFloat MJCImageW = 110;
//图片高度
static const CGFloat MJCImageH = 200;

@implementation MJCDropdownMenu

// !!!:显示窗口
+(void)showFromView:(UIView *)fromView mainImage:(UIImage*)mainImage MJCDropdownMenuType:(MJCDropdownMenuType)MJCDropdownMenuType
{
    if (MJCDropdownMenuType == MJCDropdownMenuRight) {//右边
        [MJCDropdownView showFromView:fromView mainImage:mainImage imagenewMarginX:-MJCXMargin imagenewMarginY:MJCMarginY imagenewWidth:MJCImageW imagenewHeight:MJCImageH];
        
    }else if (MJCDropdownMenuType == MJCDropdownMenuMiddle){//中间
        
        [MJCDropdownView showFromView:fromView mainImage:mainImage imagenewMarginX:0 imagenewMarginY:MJCMarginY imagenewWidth:MJCImageW+50 imagenewHeight:MJCImageH];
        
    }else if (MJCDropdownMenuType == MJCDropdownMenuLeft){//左边
        
        [MJCDropdownView showFromView:fromView mainImage:mainImage imagenewMarginX:MJCXMargin imagenewMarginY:MJCMarginY imagenewWidth:MJCImageW imagenewHeight:MJCImageH];
    }else{
        [MJCDropdownView showFromView:fromView mainImage:mainImage imagenewMarginX:-MJCXMargin imagenewMarginY:MJCMarginY imagenewWidth:MJCImageW imagenewHeight:MJCImageH];
    }
    
}
// !!!:获取到控制器中传过来的子控件
+(void)popContentController:(UIViewController *)contentController
{
    [MJCDropdownView showContentController:contentController];
}
// !!!:设置图片里面的子控件
+(void)popContentSubView:(UIView *)contentSubView;
{
    [MJCDropdownView showContentSubView:contentSubView];
}

// !!!:销毁
+(void)hidedismiss
{
    [MJCDropdownView hidedismiss:1];
}

// !!!:显示下拉菜单(添加控制器子控件)
+(void)showFromView:(UIView *)fromView mainImage:(UIImage*)mainImage showcontentController:(UIViewController *)contentController MJCDropdownMenuType:(MJCDropdownMenuType)MJCDropdownMenuType
{
    [self showFromView:fromView mainImage:mainImage MJCDropdownMenuType:MJCDropdownMenuType];
    
    [self popContentController:contentController];
}

// !!!:显示下拉菜单(添加子控件)
+(void)showFromView:(UIView *)fromView mainImage:(UIImage*)mainImage showContentSubView:(UIView *)contentSubView MJCDropdownMenuType:(MJCDropdownMenuType)MJCDropdownMenuType
{
    [self showFromView:fromView mainImage:mainImage MJCDropdownMenuType:MJCDropdownMenuType];
    
    [self popContentSubView:contentSubView];
}


// !!!:用户自定义设置背景图片的宽度和高度
+(void)setupImagenewFrame:(UIView *)fromView ImageW:(CGFloat)imageW imageH:(CGFloat)imageH MJCDropdownMenuType:(MJCDropdownMenuType)MJCDropdownMenuType
{
    if (MJCDropdownMenuType == MJCDropdownMenuRight) {//右边
        [MJCDropdownView setupImagenewFrame:fromView imagenewMarginX:-MJCXMargin imagenewMarginY:MJCMarginY imagenewWidth:imageW imagenewHeight:imageH];
        
    }else if (MJCDropdownMenuType == MJCDropdownMenuMiddle){//中间
        
        [MJCDropdownView setupImagenewFrame:fromView imagenewMarginX:0 imagenewMarginY:MJCMarginY imagenewWidth:imageW imagenewHeight:imageH];
        
    }else if (MJCDropdownMenuType == MJCDropdownMenuLeft){//左边
        
        [MJCDropdownView setupImagenewFrame:fromView imagenewMarginX:MJCXMargin imagenewMarginY:MJCMarginY imagenewWidth:imageW imagenewHeight:imageH];
        
    }else{
        [MJCDropdownView setupImagenewFrame:fromView imagenewMarginX:-MJCXMargin imagenewMarginY:MJCMarginY imagenewWidth:imageW imagenewHeight:imageH];
    }
    
    [MJCDropdownView setupContentFrame];
}

// 设置图片的X,Y值
+(void)setupImagenewFrame:(UIView *)fromView ImageX:(CGFloat)imageX imageY:(CGFloat)imageY
{
    [MJCDropdownView setupImagenewFrame:fromView imagenewMarginX:imageX imagenewMarginY:imageY imagenewWidth:MJCImageW imagenewHeight:MJCImageH];
    
    [MJCDropdownView setupContentFrame];
}


// !!!:用户自定义设置背景图片的位置
+(void)setupImagenewFrame:(UIView *)fromView mainContainerX:(CGFloat)mainContainerX mainContainerY:(CGFloat)mainContainerY mainContainerW:(CGFloat)mainContainerW mainContainerH:(CGFloat)mainContainerH;
{
    [MJCDropdownView setupImagenewFrame:fromView imagenewMarginX:mainContainerX imagenewMarginY:mainContainerY imagenewWidth:mainContainerW imagenewHeight:mainContainerH];
    
    [MJCDropdownView setupContentFrame];
}

#pragma mark - 工具类方法
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
