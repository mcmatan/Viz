//
//  ViewController.m
//  VizTest
//
//  Created by Matan Cohen on 10/23/18.
//  Copyright © 2018 Matan. All rights reserved.
//

#import "ViewController.h"
@import ImageFilesPicker;

@interface ViewController () <FilesPickerDelegate>
@property (nonatomic, strong) JVTImageFilePicker *filePicker;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)uploadImage:(id)sender {
    self.filePicker = [[JVTImageFilePicker alloc] init];
    self.filePicker.isFilePickerEnabled = false;
    self.filePicker.delegate = self;
    [self.filePicker presentFilesPickerOnController:self];
}

- (void)didPickImage:(UIImage *)image
       withImageName:(NSString *) imageName {
    NSLog(@"Did pick image");
}

- (void)didPickFile:(NSData *)file
           fileName: (NSString *) fileName {
    NSLog(@"Did pick file");
}



@end
