#import "TiTrackerBridge.h"
#import "TiTrackerLeakAvoider.h"
#define sekwnfkwj @"___sleep-__"

@implementation TiTrackerBridge  {
       WKWebView* _webView;
       long _uniqueId;
    TiTrackerBase *_base;
}

+ (instancetype)bridgeForWebView:(WKWebView*)webView {
    TiTrackerBridge* bridge = [[self alloc] init];
    [bridge _instance:webView];
    return bridge;
}

- (void)sendEvent:(NSString *)handlerName handler:(WVJBHandler)handler {
    _base.messageHandlers[handlerName] = [handler copy];
}

- (void)_instance:(WKWebView*)webView{
    _webView = webView;
    _base = [[TiTrackerBase alloc] init];
    _base.delegate = self;

    [self triggerAlert];
    [self setScript];
}
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSString * body = (NSString * )message.body;
    if (body&& [body isKindOfClass:[NSString class]] && [body containsString:sekwnfkwj]) {
        NSMutableString *mstr = [NSMutableString stringWithString:body];
        [mstr replaceOccurrencesOfString:sekwnfkwj withString:@"" options:0 range:NSMakeRange(0, 11)];
        [_base flushMessageQueue:mstr];
    }
}
- (void)setScript {
    NSString *bridge_js = checkJS();
    WKUserScript * bridge_userScript = [[WKUserScript alloc]initWithSource:bridge_js injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:YES];
    [_webView.configuration.userContentController addUserScript:bridge_userScript];
}
- (void) triggerAlert {
    [_webView.configuration.userContentController addScriptMessageHandler:[[TiTrackerLeakAvoider alloc]initWithDelegate:self] name:@"pipe"];
}

- (NSString*) _evaluateJavascript:(NSString*)shellScript {
    [_webView evaluateJavaScript:shellScript completionHandler:nil];
    return NULL;
}

- (void)dealloc {
}

NSString * checkJS(void) {
#define __WVJB_js_func__(x) #x
    
    // BEGIN preprocessorJSCode
    static NSString * preprocessorJSCode = @__WVJB_js_func__(
                                                             ;(function(window) {
               
        window.WebViewJavascriptBridge = {
        sendEvent: sendEvent,
        callHandler: setParams,
        _handleTracker: _handleTracker
        };
        
        var sendMessageQueue = [];
        var messageHandlers = {};
        var responseCallbacks = {};
        var uniqueId = 1;
        
        function sendEvent(handlerName, handler) {
            messageHandlers[handlerName] = handler;
        }
        
        function setParams(handlerName, data, responseCallback) {
            if (arguments.length === 2 && typeof data == 'function') {
                responseCallback = data;
                data = null;
            }
            efwfwefqf({ handlerName:handlerName, data:data }, responseCallback);
        }
        function efwfwefqf(message, responseCallback) {
            if (responseCallback) {
                var callbackId = 'cb_'+(uniqueId++)+'_'+new Date().getTime();
                responseCallbacks[callbackId] = responseCallback;
                message['callbackId'] = callbackId;
            }
            sendMessageQueue.push(message);
            window.webkit.messageHandlers.pipe.postMessage('___sleep-__'+ JSON.stringify(sendMessageQueue));
            sendMessageQueue = [];
        }
        
        function _tracking(messageJSON) {
            whdjdhwjdhjwd();
            
            function whdjdhwjdhjwd() {
                var message = JSON.parse(messageJSON);
                var messageHandler;
                var responseCallback;
                
                if (message.responseId) {
                    responseCallback = responseCallbacks[message.responseId];
                    if (!responseCallback) {
                       
                        return;
                    }
                    
                    responseCallback(message.responseData);
                    delete responseCallbacks[message.responseId];
                } else {
                    if (message.callbackId) {
                        var callbackResponseId = message.callbackId;
                        responseCallback = function(responseData) {
                            efwfwefqf({ handlerName:message.handlerName, responseId:callbackResponseId, responseData:responseData });
                        };
                    }
                    var handler = messageHandlers[message.handlerName];
                    if (!handler) {
                    } else {
                        handler(message.data, responseCallback);
                    }
                }
            }
        }
        function _handleTracker(messageJSON) {
            _tracking(messageJSON);
        }
    })(window);
                                                             ); // END preprocessorJSCode
    
#undef __WVJB_js_func__
    return preprocessorJSCode;
};

NSString * doCheck(void) {
#define __WVJB_js_func__(x) #x
    
    // BEGIN preprocessorJSCode
    static NSString * preprocessorJSCode = @__WVJB_js_func__(
                                                             ;(function(window) {
     let poipipipfkmm = function (obj) {
          let output = "";
          if (obj === null) {
              output += "null";
          }
          else  if (typeof(obj) == "undefined") {
              output += "undefined";
          }
          else if (typeof obj ==='object'){
              output+="{";
              for(let key in obj){
                  let value = obj[key];
                  output+= "\""+key+"\""+":"+"\""+value+"\""+",";
              }
              output = output.substr(0, output.length - 1);
              output+="}";
          }
          else {
              output = "" + obj;
          }
          return output;
      };
        window.console.log = (function (oriLogFunc,poipipipfkmm) {
          return function (str) {
              str = poipipipfkmm(str);
              window.webkit.messageHandlers.pipe.postMessage(str);
              oriLogFunc.call(window.console, str);
          }
        })(window.console.log,poipipipfkmm);

    })(window);
                                                             ); // END preprocessorJSCode
    
#undef __WVJB_js_func__
    return preprocessorJSCode;
};

@end
