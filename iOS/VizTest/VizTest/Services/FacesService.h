//
//  FacesService.h
//  VizTest
//
//  Created by Matan Cohen on 10/23/18.
//  Copyright © 2018 Matan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FaceDetails.h"
@import UIKit;

typedef void(^FaceServiceCallback)(FaceDetails *faceDetails);

@protocol FaceServiceType <NSObject>

- (void)sendImage: (UIImage *)image returnCallback: (FaceServiceCallback) callback;

@end

NS_ASSUME_NONNULL_BEGIN

@interface FacesService : NSObject <FaceServiceType>

@end

NS_ASSUME_NONNULL_END
