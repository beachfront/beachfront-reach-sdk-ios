# beachfront-reach-sdk-ios
Beachfront reach iOS SDK

## Guide

REACH is a next generation [syndication platform for video](http://www.beachfrontreach.com/). REACH enables a transparent content exchange between content owners, publishers, and advertisers. This document shows you how to integrate REACH into your iOS app.

## What You'll Need

* REACH embeded id - [Get it from here](http://www.beachfrontreach.com/)
* REACH iOS SDK - [Get it from here](https://github.com/beachfront/beachfront-reach-sdk-ios/tree/master/BFReachSDK.embeddedframework)
* IO iOS SDK - [Get it from here](https://github.com/beachfront/beachfront-io-ios-sdk)

## Supported Platforms
* iOS 6.0 or above

## Installing the SDK
1. [Get embeded id](http://www.beachfrontreach.com/) if you don't already have one.
2. Download the SDKs and drag-drop the BFReachSDK.embeddedframework and BFIOSDK.embeddedframework into your Xcode project folder. 
3. In the "Build Phases" section of your project target, navigate to "Copy Bundle Resources" and make sure 'BFReachSDK.bundle' and 'BFIOSDK.bundle' is listed. If not, find it under the Resources folder and drag it in.
4. In the "Build Phases" section of your project target, navigate to "Link Binary with Libraries" and add the BFReachSDK.framework and BFIOSDK.framework to the list (if not already there).
5. Check following frameworks in the "Link Binary With Libraries" panel:
	- **BFReachSDK.framework**
	- **BFIOSDK.framework**
	- MediaPlayer.framework
	- CoreGraphics.framework
	- UIKit.framework
	- Foundation.framework
	- CoreTelephony.framework
	- AdSupport.framework
	- SystemConfiguration.framework

6. In your Build Settings add the flag "-ObjC" to your "Other Linker Flags" entry.
7. Import the framework header ("BFReachSDK/BFReachSDK.h") in your app.
```
#import <BFReachSDK/BFReachSDK.h>
```

## Starting REACH
Get BFReach ViewController and push it. Use the **startWithPlayerId** method:

```
[[BFReachSDK sharedManager] startWithPlayerId:@"YOUR_REACH_ID_HERE" 
	    success:^(UIViewController *controller)
	{
	    [self.navigationController pushViewController:controller animated:YES]; 
    }
        failure:^(NSError *error)
    {
	    NSLog(@"BFReachSDK error: %@", error);
	}
];
```

Here, **YOUR_REACH_ID_HERE** is “embeded id” in String format.


Have an issue? Please [contact us](mailto:udit@beachfrontmedia.com) or [create an issue on GitHub](https://github.com/beachfront/beachfront-reach-sdk-ios/issues)
