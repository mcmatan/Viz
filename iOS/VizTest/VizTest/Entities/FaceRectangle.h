//
//  FaceRectangle.h
//  VizTest
//
//  Created by Matan Cohen on 10/23/18.
//  Copyright © 2018 Matan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FaceRectangle : NSObject
@property (nonatomic, assign) int top;
@property (nonatomic, assign) int height;
@property (nonatomic, assign) int left;
@property (nonatomic, assign) int width;
- (instancetype)initWithDictionary: (NSDictionary *) dic;
@end

NS_ASSUME_NONNULL_END
