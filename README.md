# MJCDropdownMenu
类似微信微博的右上角扫一扫的下拉菜单

![image](https://github.com/MJCIOS/MJCDropdownMenu/raw/master/MJCDropdownMenuDemo/MJCDropdownMenuDemo/left.gif)
![image](https://github.com/MJCIOS/MJCDropdownMenu/raw/master/MJCDropdownMenuDemo/MJCDropdownMenuDemo/zhong.gif)
![image](https://github.com/MJCIOS/MJCDropdownMenu/raw/master/MJCDropdownMenuDemo/MJCDropdownMenuDemo/right.gif)




###创建窗口

    [MJCDropdownMenu showFromView:sender mainImage:[UIImage imageNamed:@"popover_background_left@2x"] MJCDropdownMenuType:MJCDropdownMenuLeft];
###控制器与子控件的传入

    [MJCDropdownMenu popContentController:控制器];
    [MJCDropdownMenu popContentSubView:子控件];
###位置修改
    
        [MJCDropdownMenu setupImagenewFrame:sender ImageW:130 imageH:120 MJCDropdownMenuType:MJCDropdownMenuLeft];
        [MJCDropdownMenu setupImagenewFrame:<#(UIView *)#> ImageX:<#(CGFloat)#> imageY:<#(CGFloat)#>];
        [MJCDropdownMenu setupImagenewFrame:<#(UIView *)#> mainContainerX:<#(CGFloat)#> mainContainerY:<#(CGFloat)#> mainContainerW:<#(CGFloat)#> mainContainerH:<#(CGFloat)#>]
    
