//
//  ViewController.m
//  VizTest
//
//  Created by Matan Cohen on 10/23/18.
//  Copyright © 2018 Matan. All rights reserved.
//

#import "ViewController.h"
#import "FacesService.h"
#import "ImagePresentorViewController.h"
@import ImageFilesPicker;

@interface ViewController () <FilesPickerDelegate>
@property (nonatomic, strong) JVTImageFilePicker *filePicker;
@property (nonatomic, strong) FacesService *faceService;
@property (nonatomic, strong) UIActivityIndicatorView *activity;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.faceService = [[FacesService alloc] init];
    self.activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self setupView];
}

-(void) setupView {
    [self.view addSubview:self.activity];
    self.activity.translatesAutoresizingMaskIntoConstraints = false;
    [[self.activity.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[self.activity.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor] setActive:YES];
    self.activity.hidesWhenStopped = YES;
}

- (IBAction)uploadImage:(id)sender {
    self.filePicker = [[JVTImageFilePicker alloc] init];
    self.filePicker.isFilePickerEnabled = false;
    self.filePicker.delegate = self;
    [self.filePicker presentFilesPickerOnController:self];
}

- (void)didPickImage:(UIImage *)image
       withImageName:(NSString *) imageName {
    [self.activity startAnimating];
    [self.faceService sendImage:image returnCallback:^(FaceDetails *faceDetails) {
        [self.activity stopAnimating];
        ImagePresentorViewController *imagePresentorViewController =
        [[ImagePresentorViewController alloc] initWith: faceDetails andImage:image];
        [self presentViewController:imagePresentorViewController animated:YES completion:nil];
    }];
}

- (void)didPickFile:(NSData *)file
           fileName: (NSString *) fileName {
    NSLog(@"Did pick file");
}



@end
