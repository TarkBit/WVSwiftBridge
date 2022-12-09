#import <Foundation/Foundation.h>
#import "WVSwiftBridgeBase.h"
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface WVSwiftBridge : NSObject<WVSwiftBridgeBaseDelegate,WKScriptMessageHandler>

+ (instancetype)bridgeForWebView:(WKWebView*)webView
                   showJSconsole:(BOOL)show
                   enableLogging:(BOOL)enable;
- (void)registerHandler:(NSString*)handlerName handler:(nullable WVJBHandler)handler;
- (void)removeHandler:( NSString* )handlerName;
- (void)callHandler:(NSString*)handlerName;
- (void)callHandler:(NSString*)handlerName data:(nullable id)data;
- (void)callHandler:(NSString*)handlerName data:(nullable id)data responseCallback:(nullable  WVJBResponseCallback)responseCallback;
@end

NS_ASSUME_NONNULL_END
