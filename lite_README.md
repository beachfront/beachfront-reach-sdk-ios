Reach Player SDK Native iOS
=================

The player-sdk-ios component enables embedding the [reach player](http://beachfrontreach.com/) into native environments.


Getting Started
======

**BFReachSDK** can be added to any project in a matter of minutes.

## Installing the SDK

1. [Download](https://github.com/beachfront/beachfront-reach-sdk-ios) the SDK and drag-drop the BFReachSDK.embeddedframework into your Xcode project folder.
4. In the "Build Phases" section of your project target, navigate to "Copy Bundle Resources" and make sure 'BFReachSDK.bundle' is listed. If not, find it under the Resources folder in BFReachSDK.embeddedframework and drag it in.
5. In the "Build Phases" section of your project target, navigate to "Link Binary with Libraries" and add the BFReachSDK.framework to the list (if not already there).
6. While you're still in "Link Binary with Libraries" add the frameworks:
	* Foundation.framework
	* CoreGraphics.framework
	* MediaPlayer.framework
	* UIKit.framework
	* AdSupport.framework
	* CoreTelephony.framework
	* SystemConfiguration.framework
7. **IMPORTANT**: In the "Build Settings" section of your project target, navigate to "Other Linker Flags" and add '-ObjC' if not already present.
  
8. Import the framework header wherever you want to show an Ad. 

```
 #import <BFReachSDK/BFReachSDK.h>
```


Using BFReach player
=====

###Create BFReachView instance:
```
@property (retain, nonatomic) BFReachView *player;
```

###To Initialize BFReachView for Inline
```
- (void)getReachView 
{
   [BFReachSDK getReachViewInView:self.view inRect:CGRectMake(5, 200, 310, 180) AppID:YOUR-APP-ID adUnitID:YOUR-AD-UNIT-ID videoID:YOUR-VIDEO-ID playerID:YOUR-PLAYER-ID success:^(BFReachView *reachView) 
   {     
   		[self.view addSubview: reachView]; /* insert Reach view to your view */
   		[reachView resume]; /* play video */
   } 
       failure:^(NSError *error){
         	/* error handling */ 
	}];
}

```

###Pausing, Resuming, Dismiss###


```objc
-(void)dismiss;
-(void)resume;
-(void)pause;
```

```objc
[reachView dismiss];
[reachView resume];
[reachView pause];
```


--

## Listening for Events
Optionally register for BFReach events by adding your controller as an observer to the following SDK notifications:

--
###Ad events


#####BFReachAdStartedNotification
	Fires after ad started

#####BFReachAdPausedNotification
	Fired after ad paused

#####BFReachAdResumedNotification
    Fired when ad is resumed

#####BFReachAdEndedNotification
	Fired when ad is ended

#####BFReachAdRequestNotification
	Fired when ad has started request
	
#####BFReachAdClickedNotification
	Fired when ad has clicked
	
	
--
###Content events

#####BFReachContentStartedNotification
	Fires after content video starts playing
	
#####BFReachContentPausedNotification
	Fires after content video paused
	
#####BFReachContentResumedNotification
	Fires after content video resumed
	
#####BFReachContentEndedNotification
	Fired when content video is ended
	
--
###Fullscreen events

#####BFReachEnterFullscreenNotification
	Fires after content video switch to fullscreen
	
#####BFReachExitFullscreenNotification
	Fires after content video switch to inline


## Check out the Examples

Also see the sample app 'BFReachSDKExample' included in the SDK download bundle. It contains clear examples on how to show reach player and register for events. 


##Support 
Have an issue? [Contact us](mailto:viktor@beachfrontmedia.com) or [create an issue on GitHub](https://github.com/beachfront/beachfront-reach-sdk-ios/issues)
