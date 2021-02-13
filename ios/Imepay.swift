//import IMPPaymentManager;

@objc(Imepay)
class Imepay: NSObject {

    @objc(merchantCode:merchantName:merchantUrl:amount:referenceId:username:password:withResolver:withRejecter:)
    func makePayment(merchantCode:String,merchantName:String,merchantUrl:String,amount:String,
    referenceId:String,username:String,password:String,resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        let manager = IMPPaymentManager(environment: "TEST")
        manager?.pay(withUsername: "username" , password: "password", merchantCode: "merchantCode", merchantName: "merchantName",    merchantUrl: "merchantUrl", amount: "amount", referenceId: "referenceId", module: "module", success: { (transactionInfo) in

              // You can extract the following info from transactionInfo
              
              transactionInfo.responseCode
              
              // Response Code 100:- Transaction successful.
              // Response Code 101:- Transaction failed.
              
              transactionInfo.responseDescription // ResponseDescription, message sent from server
              transactionInfo.transactionId // Transaction Id, Unique ID generated from IME Pay system.
              transctionInfo.customerMsisdn // Customer mobile number (IME Pay wallet ID)
              transctionInfo.amount // Payment Amount
              transactionInfo.referenceId // Reference Value
            resolve(transactionInfo);

        }, failure: { (transactionInfo, errorMessage) in
               // Transaction Failure
            reject(transactionInfo,errorMessage);
        });
//        resolve(a*b)
    }
}
