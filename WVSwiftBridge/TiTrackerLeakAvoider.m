#import "TiTrackerLeakAvoider.h"

@implementation TiTrackerLeakAvoider
- (instancetype)initWithDelegate:(id <WKScriptMessageHandler> )trackDelegate {
    if (self = [super init]) {
        self.trackDelegate = trackDelegate;
    }
    return self;
}
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    [self.trackDelegate userContentController:userContentController didReceiveScriptMessage:message];
}
@end
