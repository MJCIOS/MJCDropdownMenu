# MJCDropdownMenu
类似微信微博的右上角扫一扫的下拉菜单

![image](https://github.com/MJCIOS/MJCDropdownMenu/raw/master/MJCDropdownMenuDemo/MJCDropdownMenuDemo/left.gif)
![image](https://github.com/MJCIOS/MJCDropdownMenu/raw/master/MJCDropdownMenuDemo/MJCDropdownMenuDemo/zhong.gif)
![image](https://github.com/MJCIOS/MJCDropdownMenu/raw/master/MJCDropdownMenuDemo/MJCDropdownMenuDemo/right.gif)


####---代码展示----
###---创建窗口---

    [MJCDropdownMenu showFromView:sender mainImage:[UIImage imageNamed:@"popover_background_left@2x"] MJCDropdownMenuType:MJCDropdownMenuLeft];
    
    
###---控制器传入

     MJCTestViewController *tetVC = [MJCTestViewController new];
    [MJCDropdownMenu popContentController:tetVC];
    
###---位置修改
    
    [MJCDropdownMenu setupImagenewFrame:sender ImageW:130 imageH:120 MJCDropdownMenuType:MJCDropdownMenuLeft];
