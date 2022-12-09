#import "WebViewJavascriptLeakAvoider.h"

@implementation WebViewJavascriptLeakAvoider
- (instancetype)initWithDelegate:(id <WKScriptMessageHandler> )delegate {
    if (self = [super init]) {
        self.delegate = delegate;
    }
    return self;
}
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    [self.delegate userContentController:userContentController didReceiveScriptMessage:message];
}
@end
