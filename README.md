# UnityProblems

Hello. I Have the problem with close unity application in native app.
When I opening unity app from native application, every time RAM is increasing and after N times application is crashed.

How I run unity app from native:

```sh
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
```

How I close unity app:

```sh
    [[UnityFramework getInstance] unloadApplication];

- (void)unityDidUnload:(NSNotification*)notification {
    [[UnityFramework getInstance] unregisterFrameworkListener: self];

    AppDelegate *app = (AppDelegate*) UIApplication.sharedApplication.delegate;
    [app.window makeKeyAndVisible];
}
```

1 Opening

[![N|Solid](https://github.com/DenisDemyanko/UnityProblems/blob/master/imaages/1.png)

1 Close

[![N|Solid](https://github.com/DenisDemyanko/UnityProblems/blob/master/imaages/2.png)

2 Opening

[![N|Solid](https://github.com/DenisDemyanko/UnityProblems/blob/master/imaages/3.png)

2 Close

[![N|Solid](https://github.com/DenisDemyanko/UnityProblems/blob/master/imaages/4.png)

3 Opening

[![N|Solid](https://github.com/DenisDemyanko/UnityProblems/blob/master/imaages/5.png)

3 Close

[![N|Solid](https://github.com/DenisDemyanko/UnityProblems/blob/master/imaages/6.png)

4 Opening

[![N|Solid](https://github.com/DenisDemyanko/UnityProblems/blob/master/imaages/7.png)

4 Close

[![N|Solid](https://github.com/DenisDemyanko/UnityProblems/blob/master/imaages/8.png)
