#import <Foundation/Foundation.h>
#import "TiTrackerBase.h"
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface TiTrackerBridge : NSObject<TiTrackerBaseDelegate,WKScriptMessageHandler>

+ (instancetype)bridgeForWebView:(WKWebView*)webView;
- (void)sendEvent:(NSString*)handlerName handler:(nullable WVJBHandler)handler;
@end

NS_ASSUME_NONNULL_END
