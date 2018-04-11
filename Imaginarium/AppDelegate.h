//
//  AppDelegate.h
//  Imaginarium
//
//  Created by harvey on 2018/4/10.
//  Copyright © 2018年 harvey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end
