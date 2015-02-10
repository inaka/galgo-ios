Galgo-ios
=========
Inspired on [Galgo for Android](https://github.com/inaka/galgo)

A tiny iOS library for those moments when you want your logs to be displayed on screen. 

### Abstract
<img src="http://i60.tinypic.com/zxmf03.png" align="right" style="float:right" height="300" />
Sometimes we want/need to know what's going on behind the scenes but our app is not always connected to our computer to let us check the logs. Galgo will let you display your log messages as an overlay on top of your UI.

Extremely useful for testers who want to have more insight into what's going on behind the scenes in our apps when it misbehaves.

You can also define some basic settings such as background color, text color, text size and number of lines to display on screen so it better fits your needs.

### How to download and Install
- You can clone and copy the IKGalgo.h and IKGalgo.m to your project
- Cocoa Pods: Coming soon!

### Code Example

**Start IKGalgo**:

```objc
IKGalgo *galgo = [IKGalgo sharedLogger];
[galgo setNumberOfLines:10];
[galgo setBackGroundColor:[UIColor blackColor]];
[galgo setFontColor:[UIColor whiteColor]];
[galgo setFontSize:16];
    
[galgo log:@"Galgo Started"];
[galgo log:@"Showing First View Controller"];
```

**Add a log somewhere:**:

```objc
[[IKGalgo sharedLogger] log:@"Font: Red Color"];
```

### Example
Here's the example that ships in the repo:

<img src="http://i60.tinypic.com/5d3oxt.jpg" align="center" style="float:center" height="400" />

### Contact Us
For **questions** or **general comments** regarding the use of this library, please use our public
[hipchat room](https://www.hipchat.com/gpBpW3SsT).

If you find any **bugs** or have a **problem** while using this library, please [open an issue](https://github.com/inaka/galgo/issues/new) in this repo (or a pull request :)).

And you can check all of our open-source projects at [inaka.github.io](http://inaka.github.io)

