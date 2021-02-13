import { NativeModules } from 'react-native';

type ImepayType = {
  multiply(a: number, b: number): Promise<number>;
};

const { Imepay } = NativeModules;

export default Imepay as ImepayType;
