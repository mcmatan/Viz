//
//  FaceRectangle.m
//  VizTest
//
//  Created by Matan Cohen on 10/23/18.
//  Copyright © 2018 Matan. All rights reserved.
//

#import "FaceRectangle.h"

@implementation FaceRectangle

- (instancetype)initWithDictionary: (NSDictionary *) dic
{
    self = [super init];
    if (self) {
        self.top = (int)[dic[@"top"] integerValue];
        self.height = (int)[dic[@"height"] integerValue];
        self.width = (int)[dic[@"width"] integerValue];
        self.left = (int)[dic[@"left"] integerValue];
    }
    return self;
}

@end
