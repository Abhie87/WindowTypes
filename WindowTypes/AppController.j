/*
 * AppController.j
 * WindowTypes
 *
 * Created by You on May 8, 2020.
 * Copyright 2020, Your Company All rights reserved.
 */

@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>


@implementation AppController : CPObject
{
    @outlet CPWindow    theWindow;
    CPWindow newWindow;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.

    // In this case, we want the window from Cib to become our full browser window
    [theWindow setFullPlatformWindow:YES];
}

- (CPWindow)createNewWindowWithTitle:(CPString)title styleMask:(int)styleMask {
    var window = [[CPWindow alloc] initWithContentRect:CGRectMake(0,0, 450, 600) styleMask:styleMask];
    [window setTitle:title];
    [window center];
    [window orderFront:self];
    return window;
}

/*
 CPBorderlessWindowMask
 CPTitledWindowMask
 CPClosableWindowMask
 CPMiniaturizableWindowMask
 CPResizableWindowMask
 CPTexturedBackgroundWindowMask
 */
- (IBAction)openWindow:(id)aSender {
    if (newWindow) {
        [newWindow close];
    }
    switch ([aSender tag]) {
        case 1:
            newWindow = [self createNewWindowWithTitle:@"Borderless Window" styleMask:CPBorderlessWindowMask];
            [newWindow setBackgroundColor:[CPColor orangeColor]];
            break;
            
        case 2:
            newWindow = [self createNewWindowWithTitle:@"Titled Window" styleMask:CPTitledWindowMask];
            break;
            
        case 3:
            newWindow = [self createNewWindowWithTitle:@"Closable Window" styleMask:CPClosableWindowMask];
            break;
            
        case 4:
            newWindow = [self createNewWindowWithTitle:@"Miniaturizable Window" styleMask:CPMiniaturizableWindowMask];
            break;
            
        case 5:
            newWindow = [self createNewWindowWithTitle:@"Resizable Window" styleMask:CPResizableWindowMask];
            break;
            
        case 6:
            newWindow = [self createNewWindowWithTitle:@"HUD Background Window" styleMask:CPHUDBackgroundWindowMask];
            break;
    }
}

@end
