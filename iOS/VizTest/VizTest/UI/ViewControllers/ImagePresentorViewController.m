//
//  ImagePresentorViewController.m
//  VizTest
//
//  Created by Matan Cohen on 10/23/18.
//  Copyright © 2018 Matan. All rights reserved.
//

#import "ImagePresentorViewController.h"

@implementation UIImage (Crop)

- (UIImage *)crop:(CGRect)rect {
    
    rect = CGRectMake(rect.origin.x*self.scale,
                      rect.origin.y*self.scale,
                      rect.size.width*self.scale,
                      rect.size.height*self.scale);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
    UIImage *result = [UIImage imageWithCGImage:imageRef
                                          scale:self.scale
                                    orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return result;
}

@end

@interface ImagePresentorViewController ()
@property (nonatomic, strong) FaceDetails * faceDetails;
@property (nonatomic, strong) UIImage * image;
@end

@implementation ImagePresentorViewController

- (instancetype)initWith: (FaceDetails *) faceDetails andImage: (UIImage *) image
{
    self = [super init];
    if (self) {
        self.faceDetails = faceDetails;
        self.image = image;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *cropedImage = [self.image
                            crop:CGRectMake(self.faceDetails.faceRectangle.left,
                                            self.faceDetails.faceRectangle.top,
                                            self.faceDetails.faceRectangle.width,
                                            self.faceDetails.faceRectangle.height)];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:cropedImage];
    [self.view addSubview:imageView];
    
    imageView.translatesAutoresizingMaskIntoConstraints = false;
    [[imageView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[imageView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor] setActive:YES];
    [[imageView.widthAnchor constraintLessThanOrEqualToAnchor:self.view.widthAnchor] setActive:YES];
    
    UILabel *label = [[UILabel alloc] init];
    
    label.textColor = [UIColor blueColor];
    label.font = [UIFont systemFontOfSize:30];
    label.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:label];
    label.text = self.faceDetails.emotion;
    [[label.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[label.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-100] setActive:YES];
    [[label.widthAnchor constraintLessThanOrEqualToAnchor:self.view.widthAnchor] setActive:YES];
    
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap)];
    [self.view addGestureRecognizer:tap];
}

-(void) didTap {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
