//
//  FaceDetails.m
//  VizTest
//
//  Created by Matan Cohen on 10/23/18.
//  Copyright © 2018 Matan. All rights reserved.
//

#import "FaceDetails.h"

@implementation FaceDetails

- (instancetype)initWidthDictionery: (NSDictionary *) dic
{
    self = [super init];
    if (self) {
        self.emotion = dic[@"bestEmotion"];
        self.faceRectangle = [[FaceRectangle alloc] initWithDictionary:dic[@"faceRectangle"]];
    }
    return self;
}

@end
