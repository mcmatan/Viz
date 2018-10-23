//
//  FaceDetails.h
//  VizTest
//
//  Created by Matan Cohen on 10/23/18.
//  Copyright © 2018 Matan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FaceRectangle.h"

NS_ASSUME_NONNULL_BEGIN

@interface FaceDetails : NSObject
@property (nonatomic, strong) NSString *emotion;
@property (nonatomic, strong) FaceRectangle *faceRectangle;
- (instancetype)initWidthDictionery: (NSDictionary *) dic;
@end

NS_ASSUME_NONNULL_END
