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
    self.imageView.image = image;
    [self.imageView sizeToFit];
    
    self.scrollView.contentSize = (self.image ? self.image.size:CGSizeZero);
    [self.scrollView addSubview:_imageView];
    
}

-(void)setImageURL:(NSURL *)imageURL{
    _imageURL = imageURL;
    //self.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.imageURL]];
    [self startDownloadingImage];
    
}

-(void) startDownloadingImage{
    self.image = nil;
    if(self.imageURL){
        NSURLRequest * request = [NSURLRequest requestWithURL:self.imageURL];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
        NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *  localFile, NSURLResponse *  response, NSError *  error) {
            if(!error){
                if([request.URL isEqual:self.imageURL]){
                    UIImage * image = [UIImage imageWithData:[NSData dataWithContentsOfURL:localFile]];
                    dispatch_sync(dispatch_get_main_queue(),  ^{
                        self.image = image;
                    });
                }
            }
        }];
        [task resume];
    }
    
}




-(void)setScrollView:(UIScrollView *)scrollView{
    _scrollView = scrollView;
    _scrollView.minimumZoomScale = 0.2;
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.delegate = self;
     self.scrollView.contentSize = (self.image ? self.image.size:CGSizeZero);
    
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.scrollView addSubview:_imageView];
}

-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView{
    NSLog(@"zoomed!");
    return self.imageView;
}


@end
