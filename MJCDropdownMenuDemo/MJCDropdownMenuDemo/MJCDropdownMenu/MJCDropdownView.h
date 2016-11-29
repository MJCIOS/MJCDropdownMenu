//
//  MJCDropdownView.h
//  MJC项目大杂烩
//
//  Created by mjc on 16/11/24.
//
//

#import <Foundation/Foundation.h>

@interface MJCDropdownView : NSObject

/** 显示窗口菜单(只有窗口菜单,并没有容器,需要自己添加) */
+(void)showFromView:(UIView *)fromView mainImage:(UIImage*)mainImage imagenewMarginX:(CGFloat)imagenewX imagenewMarginY:(CGFloat)imagenewMarginY imagenewWidth:(CGFloat)imagenewWidth imagenewHeight:(CGFloat)imagenewHeight;

/** 设置图片容器的最新位置 */
+(void)setupImagenewFrame:(UIView *)fromView imagenewMarginX:(CGFloat)imagenewX imagenewMarginY:(CGFloat)imagenewMarginY imagenewWidth:(CGFloat)imagenewWidth imagenewHeight:(CGFloat)imagenewHeight;

/** 添加子界面 */
+(void)showContentSubView:(UIView *)contentSubView;

/** 添加显示控制器 */
+(void)showContentController:(UIViewController *)contentController;


/** 销毁下拉菜单 */
+(void)hidedismiss:(NSTimeInterval)duration;
;

/** 子界面的位置 */
+(void)setupContentFrame;


@end
