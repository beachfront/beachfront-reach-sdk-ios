//
//  BFReachSDK.h
//  BFReachSDK
//
//  Created by Viktor Martynovskiy on 25.02.15.
//  Copyright (c) 2015 Beachfront Media, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BFReachSDK : NSObject

+ (instancetype)sharedManager;

/**
 Return the Reach UIViewController
 @param playerId The Reach App ID
 @param success The Reach UIViewController
 */
- (void) startWithPlayerId:(NSString*)playerId success:( void(^)(UIViewController *controller))success failure:(void (^)(NSError *error))failure;

- (void) getCategoriesByPlayerID:(NSString*)playerID success:( void(^)(NSDictionary* result))success failure:(void (^)(NSError *error))failure;

- (void) getChannelVideosWithChannels:(NSArray*)numChannels page:(NSInteger)nextPage success:( void(^)(NSDictionary* videoInfo))success failure:(void (^)(NSError *error))failure;

@end
