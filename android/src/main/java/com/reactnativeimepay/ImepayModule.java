package com.reactnativeimepay;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ActivityEventListener;
import com.facebook.react.bridge.BaseActivityEventListener;
import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.WritableMap;
import com.swifttechnology.imepaysdk.IMEPayment;
import com.swifttechnology.imepaysdk.IMEPaymentCallback;
import com.swifttechnology.imepaysdk.ENVIRONMENT;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import java.util.Map;

public class ImepayModule extends ReactContextBaseJavaModule {
  ImepayModule(ReactApplicationContext context) {
       super(context);
   }

    @Override
    public String getName() {
        return "Imepay";
    }

    // Example method
    // See https://reactnative.dev/docs/native-modules-android
    @ReactMethod
    public void makePayment(String MERCHANT_CODE, String MERCHANT_NAME,String MERCAHNT_TRANSACTION_RECORDING_URL,String AMOUNT,String REFERENCE_ID,String MODULE,String USERNAME,String PASSWORD, String ENV,  Promise promise) {


        IMEPayment imePayment = new IMEPayment(getCurrentActivity(), ENV.equals("PROD") ? ENVIRONMENT.LIVE: ENVIRONMENT.TEST);

        imePayment.performPayment(MERCHANT_CODE,
                          MERCHANT_NAME,
                          MERCAHNT_TRANSACTION_RECORDING_URL,
                          AMOUNT,
                          REFERENCE_ID,
                          MODULE,
                          USERNAME,
                          PASSWORD,
                          new IMEPaymentCallback() {
           @Override
           public void onSuccess(int responseCode, String responseDescription, String transactionId, String msisdn, String    amount, String refId) {
              // Response Code 100 : Transaction successful.
              // Response Code 101 : Transaction failed.
              // responseDescription : Message sent from server, contains transaction success message/ failure message with reason
              // transactionId : Unique ID generated from IME pay system
              // msisdn : Customer Mobile Number
              // amount : Amount paid by customer
              // refId : Reference Value
             WritableMap map = Arguments.createMap();
             map.putString("responseCode", String.valueOf(responseCode));
             map.putString("responseDescription", responseDescription);
             map.putString("transactionId", transactionId);
             map.putString("msisdn", msisdn);
             map.putString("amount", amount);
             map.putString("refId", refId);
              promise.resolve(map);
           }
});
    }


}
