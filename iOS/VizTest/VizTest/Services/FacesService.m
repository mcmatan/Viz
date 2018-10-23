//
//  FacesService.m
//  VizTest
//
//  Created by Matan Cohen on 10/23/18.
//  Copyright © 2018 Matan. All rights reserved.
//

#import "FacesService.h"
@import AFNetworking;

@interface FacesService () <NSURLConnectionDataDelegate>
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) FaceServiceCallback callback;
@end


@implementation FacesService


- (void)sendImage: (UIImage *) image returnCallback: (FaceServiceCallback) callback {
    self.callback = callback;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //NSData *imageData = UIImagePNGRepresentation(image);
        NSData *imageData = UIImageJPEGRepresentation(image, 0.3);

        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[imageData length]];
        
        // Init the URLRequest
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setHTTPMethod:@"POST"];
        [request setURL:[NSURL URLWithString:@"http://127.0.0.1:5000"]];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody:imageData];
        
        NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:request
                                                                      delegate:self
                                                              startImmediately:NO];
        [connection setDelegateQueue:[[NSOperationQueue alloc] init]];
        [connection start];
    });
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        NSError *error;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        FaceDetails *faceDetails = [[FaceDetails alloc] initWidthDictionery:dictionary];
        self.callback(faceDetails);
    });
}

@end
