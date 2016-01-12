#import <objc/runtime.h>

#define kTweakName @"SwitcherThing"
#ifdef DEBUG
    #define NSLog(FORMAT, ...) NSLog(@"[%@: %s - %i] %@", kTweakName, __FILE__, __LINE__, [NSString stringWithFormat:FORMAT, ##__VA_ARGS__])
#else
    #define NSLog(FORMAT, ...) do {} while(0)
#endif

//just a POC, if we were releasing this this would be customizable
NSInteger maximumSwitcherCards = 4;

%hook SBDeckSwitcherViewController
-(void)setDisplayItems:(NSArray*)items {
    if (items.count >= maximumSwitcherCards) {
        items = [items subarrayWithRange:NSMakeRange(0, maximumSwitcherCards)];
    }
    %orig;
}
-(NSArray*)displayItems {
    NSArray* ret = %orig;
    if (ret.count >= maximumSwitcherCards) {
        ret = [ret subarrayWithRange:NSMakeRange(0, maximumSwitcherCards)];
    }
    return ret;
}
%end
