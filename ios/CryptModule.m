#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(CryptModule, NSObject)

RCT_EXTERN_METHOD(decrypt:(NSString *)str withIV:(NSString *)iv
                 withKey:(NSString *)key
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
RCT_EXTERN_METHOD(encrypt:(NSString *)str withIV:(NSString *)iv
                 withKey:(NSString *)key
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

@end
