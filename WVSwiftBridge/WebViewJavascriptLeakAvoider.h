#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface WebViewJavascriptLeakAvoider : NSObject<WKScriptMessageHandler>
@property(nonatomic,weak)id <WKScriptMessageHandler>  delegate;
- (instancetype)initWithDelegate:(id <WKScriptMessageHandler> )delegate;
@end

NS_ASSUME_NONNULL_END
