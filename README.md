# 避免常见项目崩溃的
* 调用本类没有实现的方法
* 数组越界

# 解决方法
* 方法的重定向，我是在Category需要重写forwardinvocation methodsignatureforselector这两个方法，当对应可以正常调用方法的情况下，是不会执行这两个方法的。只有对象不能执行该方法，如果没重写这两个方法会崩溃。重写之后会分别进入这两个方法  methodsignatureforselector 返回你要给调用哪个类的哪个的方法的签名。 forwardinvocation 执行对应的新方法。还可以考虑   通过继承方式处理XXObject XXViewController 等（这样不会影响到一些第3方库同样使用方法的重定向引起的问题）。

* 通过runtime中的method_exchangeImplementations 交换两个方法的实现完成这个功能   还可以考虑   通过在类别里面定义XXObjectAtIndex:方法。实现方式都是判断index和count大小的比较。


# 还有的一些常见崩溃
* 字典和数组添加nil对象 
* 字符串截取子字符时range 超过了length大小  
* 用了被释放的对象等  









