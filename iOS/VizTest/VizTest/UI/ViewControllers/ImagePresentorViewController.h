//
//  ImagePresentorViewController.h
//  VizTest
//
//  Created by Matan Cohen on 10/23/18.
//  Copyright © 2018 Matan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FaceDetails.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImagePresentorViewController : UIViewController
- (instancetype)initWith: (FaceDetails *) faceDetails andImage: (UIImage *) image;
@end

NS_ASSUME_NONNULL_END
