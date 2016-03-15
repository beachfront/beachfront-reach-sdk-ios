//
//  BFReachSDK.h
//  BFReachSDK
//
//  Created by Viktor Martynovskiy on 25.02.15.
//  Copyright (c) 2015 Beachfront Media, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BFReachSDK/BFReachView.h>

// ad notifications
extern NSString * const BFReachAdStartedNotification;       // ad started
extern NSString * const BFReachAdPausedNotification;        // ad paused
extern NSString * const BFReachAdResumedNotification;       // ad resumed
extern NSString * const BFReachAdEndedNotification;         // ad ended
extern NSString * const BFReachAdRequestNotification;       // ad request
extern NSString * const BFReachAdClickedNotification;       // ad clicked

// content notifications
extern NSString * const BFReachContentStartedNotification;  // content started
extern NSString * const BFReachContentPausedNotification;   // content paused
extern NSString * const BFReachContentResumedNotification;  // content resumed
extern NSString * const BFReachContentEndedNotification;    // content ended

// fullscreen notifications
extern NSString * const BFReachEnterFullscreenNotification; // enter fullscreen
extern NSString * const BFReachExitFullscreenNotification;  // exit fullscreen

@interface BFReachSDK : NSObject

+ (instancetype)sharedManager;

/**
 Return the Reach UIViewController
 @param playerId The Reach App ID
 @param success The Reach UIViewController
 */
- (void) startWithPlayerId:(NSString*)playerId success:( void(^)(UIViewController *controller))success failure:(void (^)(NSError *error))failure;
- (void) startWithPlayerId:(NSString*)playerId contributorID:(NSString*)contributorID videoID:(NSString*)videoID success:( void(^)(UIViewController *controller))success failure:(void (^)(NSError *error))failure;

+ (void) getReachViewInView:(UIView*)view
                    inRect:(CGRect)rect
                      AppID:(NSString *)appID
                   adUnitID:(NSString *)adUnitID
                    videoID:(NSString*)videoID
                   playerID:(NSString*)playerID
                    success:(void (^)(BFReachView* reachView))success
                    failure:(void (^)(NSError *error))failure;


@end
