//
//  MJCSAOYISAOSHISHI.h
//  MJC项目大杂烩
//
//  Created by mjc on 16/11/23.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum {
    MJCDropdownMenuRight,
    MJCDropdownMenuMiddle,
    MJCDropdownMenuLeft
}MJCDropdownMenuType;


@interface MJCDropdownMenu : NSObject

@property (nonatomic,assign) MJCDropdownMenuType MJCDropdownMenuType;

/** 一句创建下拉菜单(控制器) */
+(void)showFromView:(UIView *)fromView mainImage:(UIImage*)mainImage showcontentController:(UIViewController *)contentController MJCDropdownMenuType:(MJCDropdownMenuType)MJCDropdownMenuType;
/** 一句创建下拉菜单(子控件) */
+(void)showFromView:(UIView *)fromView mainImage:(UIImage*)mainImage showContentSubView:(UIView *)contentSubView MJCDropdownMenuType:(MJCDropdownMenuType)MJCDropdownMenuType;


/** 显示窗口菜单 */
+(void)showFromView:(UIView *)fromView mainImage:(UIImage*)mainImage MJCDropdownMenuType:(MJCDropdownMenuType)MJCDropdownMenuType;

/** 添加子界面 */
+(void)popContentSubView:(UIView *)contentSubView;

/** 添加显示控制器 */
+(void)popContentController:(UIViewController *)contentController;


/** 销毁下拉菜单 */
+(void)hidedismiss;


/** 设置图片的frame位置 */
+(void)setupImagenewFrame:(UIView *)fromView mainContainerX:(CGFloat)mainContainerX mainContainerY:(CGFloat)mainContainerY mainContainerW:(CGFloat)mainContainerW mainContainerH:(CGFloat)mainContainerH;


/** 设置背景图片的宽度与高度 */
+(void)setupImagenewFrame:(UIView *)fromView ImageW:(CGFloat)imageW imageH:(CGFloat)imageH MJCDropdownMenuType:(MJCDropdownMenuType)MJCDropdownMenuType;

/** 设置图片的X,Y值 */
+(void)setupImagenewFrame:(UIView *)fromView ImageX:(CGFloat)imageX imageY:(CGFloat)imageY;

/** 修改图片透明度 */
+ (UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image;

/** 防止图片拉伸的方法 */
+ (UIImage *)imageStretchableImageWithLeftCap:(UIImage *)image;

@end
