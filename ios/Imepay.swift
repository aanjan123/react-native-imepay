import IMEPay;

@objc(Imepay)
class Imepay: NSObject {
    var resolveCallback: RCTPromiseResolveBlock?
    var rejectCallback: RCTPromiseRejectBlock?
    
    @objc
    func makePayment(
        merchantCode:String,
        merchantName:String,
        merchantUrl:String,
        amount:String,
        referenceId:String,
        username:String,
        module:String,
        password:String,
        resolver resolve: @escaping RCTPromiseResolveBlock,
        rejector reject: @escaping RCTPromiseRejectBlock
    ) -> Void {
        resolveCallback = resolve
        rejectCallback = reject
        
        let manager = IMEPay.IMPPaymentManager(environment: Live)
        manager?.pay(
            withUsername: "username" ,
            password: "password",
            merchantCode: "merchantCode",
            merchantName: "merchantName",
            merchantUrl: "merchantUrl",
            amount: "amount",
            referenceId: "referenceId",
            module: "module",
            success: {_ in

              // You can extract the following info from transactionInfo
              
//              transactionInfo.responseCode
              
              // Response Code 100:- Transaction successful.
              // Response Code 101:- Transaction failed.
              
//              transactionInfo.responseDescription // ResponseDescription, message sent from server
//              transactionInfo.transactionId // Transaction Id, Unique ID generated from IME Pay system.
//              transctionInfo.customerMsisdn // Customer mobile number (IME Pay wallet ID)
//              transctionInfo.amount // Payment Amount
//              transactionInfo.referenceId // Reference Value
//            resolve(transactionInfo);

        }, failure: { (transactionInfo, errorMessage) in
               // Transaction Failure
//            reject(transactionInfo);
        });
//        resolve(a*b)
    }
}
