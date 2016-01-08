#README
##Information
######Autor:Asahi Kuang

######project name: XXAlert

######version: 1.0v

######[github](https://github.com/Asahi-Kuang)

######Author Email: http://asahikuang@yahoo.com
##DESCRIPTION
######`XXAlert`can pop a action sheet which can has no matter how much funtion buttons.It is easy to use.And it has a protocol,you can use the method in protocol to control what the function button does.

##Usage
######1. import the header file: `import "XXAlert.h"`

######2. create a property of XXAlert: 
```
	XXAlert *alert = [[XXAlert alloc] initWithFrame:self.view.bounds];
    
```

######3. set the function button names(It is a array).
```
	[alert setFuncBtns:@[@"button1", @"button2"]];
```

######4. set original setting:
```
	[alert originalSetting];
```

######5. set whether you need to tap the black to hidden the alert:
```
	[alert setTapGesEnable:YES];
```

######6. set the delegate(before this, you have to import the `XXAlertProtocol` protocol)
```
	[alert setDelegate:self];
```

######over!

##Effect picture
######if you do correctly like code above did,you will get a effect like this:

![pic url](http://a2.qpic.cn/psb?/V106iJhq3r5pvo/NPCT5V6b*ygpZS0UjdemKkZ.KqkdYdFk9sfzMx*v11A!/b/dHMAAAAAAAAA&bo=1QFHA9UBRwMCIgY!&rf=viewer_4)


##License

######Asahi Kuang all rights reserved.

