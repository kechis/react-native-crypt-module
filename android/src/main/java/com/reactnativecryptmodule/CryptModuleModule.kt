package com.reactnativecryptmodule

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise

class CryptModuleModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

    override fun getName(): String {
        return "CryptModule"
    }

    // Example method
    // See https://facebook.github.io/react-native/docs/native-modules-android
    @ReactMethod
    fun decrypt(str: String, iv: String, key: String, promise: Promise) {
      promise.resolve(str)
    }

    @ReactMethod
    fun encrypt(str: String, iv: String, key: String, promise: Promise) {
      promise.resolve(str)
    }

    
}
