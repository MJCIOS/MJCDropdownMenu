# MJCDropdownMenu
类似微信微博的右上角扫一扫的下拉菜单

![image](https://github.com/MJCIOS/MJCDropdownMenu/raw/master/MJCDropdownMenuDemo/MJCDropdownMenuDemo/left.gif)
![image](https://github.com/MJCIOS/MJCDropdownMenu/raw/master/MJCDropdownMenuDemo/MJCDropdownMenuDemo/zhong.gif)
![image](https://github.com/MJCIOS/MJCDropdownMenu/raw/master/MJCDropdownMenuDemo/MJCDropdownMenuDemo/right.gif)


###类型
    
    typedef enum {
        MJCDropdownMenuRight,
        MJCDropdownMenuMiddle,
        MJCDropdownMenuLeft
    }MJCDropdownMenuType;

### 创建窗口

    [MJCDropdownMenu showFromView:sender mainImage:[UIImage imageNamed:@"popover_background_left@2x"] MJCDropdownMenuType:MJCDropdownMenuLeft];
### 控制器与子控件的传入

    [MJCDropdownMenu popContentController:控制器];
    [MJCDropdownMenu popContentSubView:子控件];
### 位置修改

    [MJCDropdownMenu setupImagenewFrame:sender ImageW:130 imageH:120 MJCDropdownMenuType:MJCDropdownMenuLeft];
    [MJCDropdownMenu setupImagenewFrame:<#(UIView *)#> ImageX:<#(CGFloat)#> imageY:<#(CGFloat)#>];
    [MJCDropdownMenu setupImagenewFrame:<#(UIView *)#> mainContainerX:<#(CGFloat)#> mainContainerY:<#(CGFloat)#> mainContainerW:<#(CGFloat)#> mainContainerH:<#(CGFloat)#>]
### 方法
        [MJCDropdownMenu hidedismiss],图片消失的方法,
        [MJCDropdownMenu showFromView:<#(UIView *)#> mainImage:<#(UIImage *)#> showcontentController:<#(UIViewController *)#> MJCDropdownMenuType:<#(MJCDropdownMenuType)#>]一句创建窗口以及里面子控件的方法,
        [MJCDropdownMenu showFromView:<#(UIView *)#> mainImage:<#(UIImage *)#> showcontentController:<#(UIViewController *)#> MJCDropdownMenuType:<#(MJCDropdownMenuType)#>]一句创建窗口以及里面子控件的方法,
        UIImage *image2 = [MJCDropdownMenu imageByApplyingAlpha:<#(CGFloat)#> image:<#(UIImage *)#>]图片透明的的方法,
        UIImage *image1= [MJCDropdownMenu imageStretchableImageWithLeftCap:<#(UIImage *)#>]图片拉伸的方法
