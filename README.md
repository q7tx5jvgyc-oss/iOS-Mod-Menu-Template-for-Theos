#import <UIKit/UIKit.h>

%hook GameViewController

- (void)viewDidLoad {
    %orig;
    [self setupAutoTouch];
}

- (void)setupAutoTouch {
    UIButton *autoTouchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    autoTouchButton.frame = CGRectMake(20, 50, 120, 50);
    autoTouchButton.backgroundColor = [UIColor redColor];
    [autoTouchButton setTitle:@"Auto OFF" forState:UIControlStateNormal];
    [autoTouchButton addTarget:self action:@selector(toggleAutoTouch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:autoTouchButton];
}

- (void)toggleAutoTouch {
    static BOOL autoTouchEnabled = NO;
    autoTouchEnabled = !autoTouchEnabled;

    if (autoTouchEnabled) {
        NSLog(@"Auto Touch ON");
        [self performSelector:@selector(executeAutoTouch) withObject:nil afterDelay:0.1];
    } else {
        NSLog(@"Auto Touch OFF");
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(executeAutoTouch) object:nil];
    }
}

- (void)executeAutoTouch {
    CGPoint touchPoint = CGPointMake(160, 300);
    NSLog(@"Simulating touch at (%f, %f)", touchPoint.x, touchPoint.y);
    [self performSelector:@selector(executeAutoTouch) withObject:nil afterDelay:0.1];
}

%end