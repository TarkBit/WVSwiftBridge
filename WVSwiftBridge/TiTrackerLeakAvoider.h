#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface TiTrackerLeakAvoider : NSObject<WKScriptMessageHandler>
@property(nonatomic,weak)id <WKScriptMessageHandler>  trackDelegate;
- (instancetype)initWithDelegate:(id <WKScriptMessageHandler> )trackDelegate;
@end

NS_ASSUME_NONNULL_END
