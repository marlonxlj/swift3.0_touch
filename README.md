##前言

![1.gif](http://upload-images.jianshu.io/upload_images/1819746-c5c1bb88ad543242.gif?imageMogr2/auto-orient/strip)

先来一个手势解锁的例子，熟悉一下swift3.0的一些基本改变。变化很大使用过程中跌跌撞撞的,多多学习。

###[demo下载地址](https://github.com/marlonxlj/swift3.0_touch.git)
> ###目录
#####响应者对象
#####UITouch中的方法

###响应者对象

```
在IOS中不是任何对象都能够处理事件，只有继承了UIResponder的对象才能接收并处理事件，我们称之为“响应者对象” 
UIApplication、UIViewController、UIView都继承自UIResponder，所以都能成为响应者对象
UIResponder内部提供了以下方法来处理事件 
>触摸事件 
-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event 
-(void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event 
-(void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event 
>加速计事件 
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent*)event 
-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent*)event 
-(void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent*)event 
>远程控制事件 
-(void)removeControlReceivedWithEvent:(UIEvent*)event 


```

###UITouch中的方法

```
UITouch的方法
- (CGPoint)locationInView:(UIView*)view;
返回值表示触摸在view上的位置
这里返回的位置是针对view的坐标系的（以view的左上角为原点(0, 0)）
调用时传入的view参数为nil的话，返回的是触摸点在UIWindow的位置

- (CGPoint)previousLocationInView:(UIView*)view;
该方法记录了前一个触摸点的位置
touches和event参数
一次完整的触摸过程，会经历3个状态：
触摸开始：- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
触摸移动：- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event
触摸结束：- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event
触摸取消（可能会经历）：- (void)touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)event

4个触摸事件处理方法中，都有NSSet*touches和UIEvent*event两个参数
一次完整的触摸过程中，只会产生一个事件对象，4个触摸方法都是同一个event参数

如果两根手指同时触摸一个view，那么view只会调用一次touchesBegan:withEvent:方法，touches参数中装着2个UITouch对象

如果这两根手指一前一后分开触摸同一个view，那么view会分别调用2次touchesBegan:withEvent:方法，并且每次调用时的touches参数中只包含一个UITouch对象

根据touches中UITouch的个数可以判断出是单点触摸还是多点触摸
```
