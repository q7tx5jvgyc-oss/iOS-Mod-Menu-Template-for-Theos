#import <UIKit/UIKit.h>

// Hook لواجهة التطبيق المستهدف
%hook GameViewController

- (void)viewDidLoad {
    %orig; // استدعاء الوظيفة الأصلية
    [self setupAutoTouchButton]; // إضافة الزر الخاص بـ Auto Touch
}

// إعداد زر Auto Touch
- (void)setupAutoTouchButton {
    UIButton *autoTouchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    autoTouchButton.frame = CGRectMake(20, 50, 150, 50); // مكان الزر
    autoTouchButton.backgroundColor = [UIColor blueColor];
    [autoTouchButton setTitle:@"Start Auto Touch" forState:UIControlStateNormal];
    [autoTouchButton addTarget:self action:@selector(toggleAutoTouch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:autoTouchButton];
}

// تفعيل وإيقاف Auto Touch
- (void)toggleAutoTouch {
    static BOOL autoTouchEnabled = NO;
    autoTouchEnabled = !autoTouchEnabled; // تبديل الحالة

    if (autoTouchEnabled) {
        NSLog(@"Auto Touch Enabled");
        [self performSelector:@selector(executeAutoTouch) withObject:nil afterDelay:0.1];
    } else {
        NSLog(@"Auto Touch Disabled");
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(executeAutoTouch) object:nil];
    }
}

// التنفيذ المستمر للنقر التلقائي
- (void)executeAutoTouch {
    // تنفيذ نقرة تلقائية عند النقطة المحددة
    CGPoint touchPoint = CGPointMake(160, 300); // تعديل النقطة حسب الحاجة
    NSLog(@"Simulating touch at (%f, %f)", touchPoint.x, touchPoint.y);

    // إعادة تشغيل الوظيفة للنقر التلقائي المتكرر
    [self performSelector:@selector(executeAutoTouch) withObject:nil afterDelay:0.1];
}

%end