import { NativeModules } from 'react-native';

type ImepayType = {
  makePayment(MERCHANT_CODE: string, MERCHANT_NAME: string, MERCAHNT_TRANSACTION_RECORDING_URL: string, AMOUNT: string, REFERENCE_ID: string, MODULE: string, USERNAME: string, PASSWORD: string): Promise<number>;
};

const { Imepay } = NativeModules;

export default Imepay as ImepayType;
