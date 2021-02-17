#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(Imepay, NSObject)

RCT_EXTERN_METHOD(makePayment:(NSString *)merchantCode
                  merchantName:(NSString *)merchantName
                  merchantUrl:(NSString *)merchantUrl
                  amount:(NSString *)amount
                  referenceId:(NSString *)referenceId
                  module:(NSString *)module
                  username:(NSString *)username
                  password:(NSString *)password
//                  password:(NSString *)password
                resolver:(RCTPromiseResolveBlock)resolve
                rejector:(RCTPromiseRejectBlock)reject
                )

@end
