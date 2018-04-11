//
//  ViewController.m
//  Imaginarium
//
//  Created by harvey on 2018/4/10.
//  Copyright © 2018年 harvey. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.destinationViewController isKindOfClass:[ImageViewController class]]){
        ImageViewController *ivc = (ImageViewController *)segue.destinationViewController;
        ivc.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.faceplusplus.com.cn/images/attributes/attributes.jpg"]];
        ivc.title = segue.identifier;
    
}
}




@end
