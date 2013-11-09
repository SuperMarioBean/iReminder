iReminder
=========

为了团队技术分享时写的一个小demo，虽然最终也没有说，但是还是希望能放上来。下面介绍是这个demo作为示范示例时可以涵盖的技术点。

+ demo的只是实现了一个简单的`UILocalNotifcation`的本地查看、添加和修改的功能。

+ demo的view使用storyboard设计，`添加提醒`的viewcontroller的跳转逻辑通过stroyboard来实现，`修改提醒`的viewcontroller的跳转逻辑通过代码实现，使用的viewcontroller`UINavigationController`、`UIViewController`、`UITableViewConteroller`。

+ 使用的UI组件有：`UITextField`、`UIDatePicker`、`UIAlertView`

+ demo遵循MVC设计模式。
由于view和controller的分离apple为我们已经做了很好的工作，这里就不说了。这里只提一下model：

	model仅仅是一个封装了APP的UIApplication单例操作UIlocalNotification实例的相关方法的类，这样做避免了额外的代码量。

		其实也就是偷懒~
	
	另外在介绍model的时候可以将`UILocalNotification`的相关方法和功能一并介绍，而不需要让别人干看你写model的逻辑代码
	
		因为大部分人都懂model，而你又总要说点什么~

+ 使用了通知中心和代理模式，`修改提醒`的viewcontroller通过实现代理模式完成通知回调

		之所以不介绍KVO，一方面KVO的应用场景很清晰，而通知中心和代理模式这两种方式的应用场景相对有模糊区；
		另一点就是只讲KVO不讲KVC感觉有点坑人，而要将KVC的话，就是一个long story了。

+ 对不同的进入APP方式，`UIApplication`的代理类中都对应处理了`UILocalNotification`，在这里就可以重新介绍APP的应用程序状态以及切换方式了。

		这里已经默认你将UIViewController和UIApplication的生命周期作为知识点先说了

+ iReminder的实现方式是，或者说，你该从哪里开始
	
	+ 先通过storyboard设计view，从整体上给人一个APP大致的样貌，功能概况；
	
	+ 随后，针对storyboard上面每一个viewcontroller逐一实现，在实现的过程中遇到需要调用model的位置预留注释，以便产生更强的目的性；
	
			这样的好处在UITableViewController的实现过程中体现的很明显
			对于`UITableViewController`中的<UITabelViewDataSource>这个要求model提供数据的代理
			很容易让人明白在model需要实现什么
	
	+ 最后，实现model，只对此前的需求来实现
	
+ 版本库的使用方法

	通过检出到不同的提交来进入不同的讲解位置，提交信息虽然只有简要的提示，但是每一个提交都遵照上一点的实现顺序进行切分，代码比较简单，你可以直接配合提交信息和diff直接理解。
	
		虽然我不愿意承认，但是弄这个iReminder还真的花了我不少时间
		
	
