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
    
    
    if([segue.identifier isEqualToString:@"pic1"]){
        NSLog(@"click PIC1");
        if([segue.destinationViewController isKindOfClass:[ImageViewController class]]){
            ImageViewController *ivc = (ImageViewController *)segue.destinationViewController;
            ivc.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://handluggageonly.co.uk/wp-content/uploads/2015/07/london-2276021.jpg"]];
            ivc.title = segue.identifier;
            
        }
    }else if ([segue.identifier isEqualToString:@"pic2"]){
        NSLog(@"click pic2");
        if([segue.destinationViewController isKindOfClass:[ImageViewController class]]){
            ImageViewController *ivc = (ImageViewController *)segue.destinationViewController;
            ivc.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://img.25pp.com/uploadfile/bizhi/iphone6p/20160601/1464744706278044_390x690.jpeg"]];
            ivc.title = segue.identifier;
        }
    }
}



@end
