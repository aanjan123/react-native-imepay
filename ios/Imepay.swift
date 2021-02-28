import IMEPay
import Foundation

@objc(Imepay)
class Imepay: NSObject {
    private var resolveCallback: RCTPromiseResolveBlock?
    private var rejectCallback: RCTPromiseRejectBlock?
    private var manager = IMPPaymentManager()

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
        debugPrint("==========Starting IME PAY==========")
        debugPrint("username \(username), password \(password), merchantCode \(merchantCode), merchantName \(merchantName), merchantUrl \(merchantUrl), amount \(amount), referenceId \(referenceId), module \(module) ")
        
        manager.pay(
            withUsername: username ,
            password: password,
            merchantCode: merchantCode,
            merchantName: merchantName,
            merchantUrl: merchantUrl,
            amount: amount,
            referenceId: referenceId,
            module: module,
            success: { transactionInfo in

                debugPrint("==========IME PAY SUCCESS==========")

              // Response Code 100:- Transaction successful.
              // Response Code 101:- Transaction failed.

                var dict = [String: Any]()
                
                dict["responseCode"] = transactionInfo?.responseCode
                dict["responseDescription"] = transactionInfo?.responseDescription
                dict["transactionId"] = transactionInfo?.transactionId
                dict["customerMsisdn"] = transactionInfo?.customerMsisdn
                dict["amount"] = transactionInfo?.amount
                dict["referenceId"] = transactionInfo?.referenceId
                
                self.resolveCallback!(dict);

        }, failure: { (transactionInfo, errorMessage) in
            debugPrint("==========IME PAY ERROR==========")
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
        env:String,
        resolver resolve: @escaping RCTPromiseResolveBlock,
        rejector reject: @escaping RCTPromiseRejectBlock
    ) -> Void {
        resolveCallback = resolve
        rejectCallback = reject
        
        let environment: APIEnvironment = env == "PROD" ? Live : Test

        self.manager = IMPPaymentManager.init(environment: environment)

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
