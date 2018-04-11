//
//  ImageViewController.m
//  Imaginarium
//
//  Created by harvey on 2018/4/10.
//  Copyright © 2018年 harvey. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()
@property (nonatomic,strong) UIImageView  *imageView;
@property (nonatomic,strong) UIImage *image;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation ImageViewController

-(void)setImageURL:(NSURL *)imageURL{
    _imageURL = imageURL;
    self.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.imageURL]];
    
}
-(void)setScrollView:(UIScrollView *)scrollView{
    _scrollView = scrollView;
     self.scrollView.contentSize = (self.image ? self.image.size:CGSizeZero);
    
}

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

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.scrollView];
    
}



@end
