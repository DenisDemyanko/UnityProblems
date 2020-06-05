//
//  ViewController.m
//  OpenUnity
//
//  Created by Denis on 05.06.2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onClose) name:@"BACK" object:nil];
}

-(void)onClose {
    [[UnityFramework getInstance] unloadApplication];
}

-(IBAction)onOpen:(id)sender {    
    NSArray* arguments = [[NSProcessInfo processInfo] arguments];
    NSInteger count = [arguments count];
    char **array = (char **)malloc((count + 1) * sizeof(char*));
    
    for (NSInteger i = 0; i < count; i++) {
        array[i] = strdup([[arguments objectAtIndex:i] UTF8String]);
    }
    array[count] = NULL;
    char** argv = array;
    
    [[UnityFramework getInstance] registerFrameworkListener: self];
    [[UnityFramework getInstance] runEmbeddedWithArgc:1 argv:argv appLaunchOpts:@{}];
}

- (void)unityDidUnload:(NSNotification*)notification {
    [[UnityFramework getInstance] unregisterFrameworkListener: self];

    AppDelegate *app = (AppDelegate*) UIApplication.sharedApplication.delegate;
    [app.window makeKeyAndVisible];
}

- (void)unityDidQuit:(NSNotification*)notification {
    
}

@end
