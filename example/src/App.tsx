import * as React from 'react';

import { StyleSheet, View, Text, Button } from 'react-native';
import Imepay from 'react-native-imepay';


export default function App() {
  const [result, setResult] = React.useState<number | undefined>();

  const openImePay = async () => {
    try {
      const result = await Imepay.makePayment(
        "TEST", // MERCHANT_CODE
        "TEST", // MERCHANT_NAME
        "https://merchantname.com/merchant_transaction_recording_method", // MERCAHNT_TRANSACTION_RECORDING_URL
        "200", // AMOUNT
        "Reference Value",  // REFERENCE_ID
        "TEST", // MODULE
        "TEST", // USERNAME
        "TEST"  //PASSWORD
      )
      console.log({ result })
    } catch (e) {
      console.log({ e })
    }
  }

  return (
    <View style={styles.container}>
      <Button title={"Open"} onPress={openImePay} style={{ width: 100, height: 40, borderRadius: 6, backgroundColor: 'red' }} />
      <Text>Result: {result}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
