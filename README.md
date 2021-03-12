# Sponsors

---

If you use this library on your commercial/personal projects, you can help us by raising an issue or sending a pull request.!

# react-native-imepay

react-native wrapper for imepay. Especially designed for nepal

# Getting started

## Installation

---

If you are using `react-native >= 0.60` you just need to do a simple:

```shell
yarn add react-native-imepay
```

Or if are using npm:

```shell
npm i react-native-imepay --save
```

After that, we need to install the dependencies to use the project on iOS(you can skip this part, if you are using this on Android).

Now run a simple: `npx pod-install` or `cd ios && pod install`. After that, you should be able to use the library on both Platforms, iOS and Android.

Then simply import:

```
In case of error on ios

use_frameworks! in your pod file.
```

## Usage

```js Implementation
import Imepay from 'react-native-imepay';

/**
 * @makePayment Function
 * @MERCHANT_CODE String
 * @MERCHANT_NAME String
 * @MERCHANT_TRANSACTION_RECORDING_URL String
 * @AMOUNT String
 * @REFERENCE_ID String
 * @MODULE String
 * @USERNAME String
 * @PASSWORD String
 * @Env String
 *
 * @return Promise
 * */

Imepay.makePayment(
  MERCHANT_CODE,
  MERCHANT_NAME,
  MERCHANT_TRANSACTION_RECORDING_URL,
  AMOUNT,
  REFERENCE_ID,
  MODULE,
  USERNAME,
  PASSWORD,
  (Env: 'Live' | 'Test')
);
```

## Example

```js example
import Imepay from 'react-native-imepay';

// ...

const result = await Imepay.makePayment(
  'TEST',
  'TEST',
  'https://merchantname.com/merchant_transaction_recording_method',
  '200',
  'Reference Value',
  'TEST',
  'TEST',
  'TEST',
  'Live'
);

Response Format:
{
  responseCode: ''
  responseDescription: ''
  transactionId: ''
  customerMsisdn: ''
  amount: ''
  referenceId: ''
}

// Response Code 100:- Transaction successful.
// Response Code 101:- Transaction failed.
```

Support us by using this library

## Contributing

<a href="https://github.com/andreshsingh" target="_blank"><img src="https://avatars.githubusercontent.com/u/30138390?s=400&u=908ebe452b0221fa1b04a3de0063d3de385edd06&v=4"
width=50
height=50
raw=true
alt="Andresh Singh"
style="border-radius: 40px;margin-top:10px" ></a>

## License

MIT
