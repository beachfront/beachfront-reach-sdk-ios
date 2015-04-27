# beachfront-reach-sdk-ios
Beachfront reach iOS SDK

## Guide

REACH is a next generation syndication platform for video. REACH enables a transparent content exchange between content owners, publishers, and advertisers. This document shows you how to integrate REACH into your iOS app.

## What You'll Need

* REACH embeded id - [Get it from here](http://www.beachfrontreach.com/)
* REACH iOS SDK - [Get it from here](https://github.com/beachfront/beachfront-reach-sdk-ios/tree/master/bf-reach-ios-sdk)
* IO iOS SDK - [Get it from here](https://github.com/beachfront/beachfront-io-ios-sdk)

## Supported Platforms
* iOS 6.0 or above

## Installing the SDK
1. [Get embeded id](http://www.beachfrontreach.com/) if you don't already have one.
2. Download the SDKs and copy the .embeddedframework folders into the your iOS Project. 
3. Add the following frameworks one by one by clicking on the + button in the "Link Binary With Libraries" panel:
	- **BFReachSDK.embeddedframework**
	- **BFIOSDK.embeddedframework**
	- MediaPlayer.framework
	- CoreGraphics.framework
	- UIKit.framework
	- Foundation.framework
	- CoreTelephony.framework
	- AdSupport.framework
	- SystemConfiguration.framework

4. In your Build Settings add the flag "-ObjC" to your "Other Linker Flags" entry.
5. Import the framework header (<BFReachSDK/BFReachSDK.h>) in your app.

## Starting REACH
Use the **startWithPlayerId** method:

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