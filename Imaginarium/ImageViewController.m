//
//  ImageViewController.m
//  Imaginarium
//
//  Created by harvey on 2018/4/10.
//  Copyright © 2018年 harvey. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController () <UIScrollViewDelegate>
@property (nonatomic,strong) UIImageView  *imageView;
@property (nonatomic,strong) UIImage *image;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@end

@implementation ImageViewController

- (UIImageView *) imageView{
    if (!_imageView) _imageView = [[UIImageView alloc] init];
    return _imageView;
}

-(UIImage *)image{
    return self.imageView.image;
}

-(void)setImage:(UIImage *)image{
    NSLog(@"setImage");
    self.imageView.image = image;
    [self.imageView sizeToFit];
    
    NSLog(@"setcontentSize in setImage");
    self.scrollView.contentSize = (self.image ? self.image.size:CGSizeZero);
    [self.scrollView addSubview:_imageView];
    
    [self.spinner stopAnimating];
    NSLog(@"loading start animating");
}

-(void)setImageURL:(NSURL *)imageURL{
    NSLog(@"setImageURL");
    _imageURL = imageURL;
    //self.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.imageURL]];
    [self startDownloadingImage];
    
}

-(void) startDownloadingImage{
    NSLog(@"start downloading:");
    self.image = nil;
    if(self.imageURL){
        NSLog(@"loading start animating");
        [self.spinner startAnimating];
        NSURLRequest * request = [NSURLRequest requestWithURL:self.imageURL];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
        NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *  localFile, NSURLResponse *  response, NSError *  error) {
            if(!error){
                if([request.URL isEqual:self.imageURL]){
                    UIImage * image = [UIImage imageWithData:[NSData dataWithContentsOfURL:localFile]];
                    NSLog(@"start downloading:sync main queue");
                    dispatch_sync(dispatch_get_main_queue(),  ^{
                        self.image = image;
                    });
                }
            }
        }];
        NSLog(@"start downloading:download task resume");
        [task resume];
    }
    
}




-(void)setScrollView:(UIScrollView *)scrollView{
    NSLog(@"setScrollView");
    _scrollView = scrollView;
    _scrollView.minimumZoomScale = 0.2;
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.delegate = self;
    NSLog(@"setcontentSize in setScrollview");
     self.scrollView.contentSize = (self.image ? self.image.size:CGSizeZero);
}

-(void)viewDidLoad{
    
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    [self.scrollView addSubview:_imageView];
    NSLog(@"scrollView addSubview");
}

-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView{
    NSLog(@"zoomed!");
    return self.imageView;
}


@end
