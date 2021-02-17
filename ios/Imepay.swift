import IMEPay
import Foundation

@objc(Imepay)
class Imepay: NSObject {
    var resolveCallback: RCTPromiseResolveBlock?
    var rejectCallback: RCTPromiseRejectBlock?

    @objc
    static func requiresMainQueueSetup() -> Bool {
        return true
    }

    func run(
        merchantCode:String,
        merchantName:String,
        merchantUrl:String,
        amount:String,
        referenceId:String,
        module:String,
        username:String,
        password:String
    ) {
        print("==========in the func==========")
        print("username \(username), password \(password), merchantCode \(merchantCode), merchantName \(merchantName), merchantUrl \(merchantUrl), amount \(amount), referenceId \(referenceId), module \(module) ")
        let manager = IMEPay.IMPPaymentManager(environment: Test)
        manager?.pay(
            withUsername: username ,
            password: password,
            merchantCode: merchantCode,
            merchantName: merchantName,
            merchantUrl: merchantUrl,
            amount: amount,
            referenceId: referenceId,
            module: module,
            success: {_ in

            print("==========success==========")
            
              // You can extract the following info from transactionInfo

//              transactionInfo.responseCode

              // Response Code 100:- Transaction successful.
              // Response Code 101:- Transaction failed.

//              transactionInfo.responseDescription // ResponseDescription, message sent from server
//              transactionInfo.transactionId // Transaction Id, Unique ID generated from IME Pay system.
//              transctionInfo.customerMsisdn // Customer mobile number (IME Pay wallet ID)
//              transctionInfo.amount // Payment Amount
//              transactionInfo.referenceId // Reference Value
           self.resolveCallback!("referenceId");

        }, failure: { (transactionInfo, errorMessage) in
            print("==========error==========")
            let error = NSError(domain: "Esewa Error", code: 101)
            self.rejectCallback!("500", errorMessage, error)
        });
    }

    @objc
    func makePayment(
        _
        merchantCode:String,
        merchantName:String,
        merchantUrl:String,
        amount:String,
        referenceId:String,
        module:String,
        username:String,
        password:String,
        resolver resolve: @escaping RCTPromiseResolveBlock,
        rejector reject: @escaping RCTPromiseRejectBlock
    ) -> Void {
        resolveCallback = resolve
        rejectCallback = reject

        DispatchQueue.main.async {
            self.run(
                merchantCode: merchantCode,
                merchantName: merchantName,
                merchantUrl: merchantUrl,
                amount: amount,
                referenceId: referenceId,
                module: module,
                username: username,
                password: password
                )
        }
    }
}
