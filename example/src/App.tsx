import * as React from 'react';
import { StyleSheet, View, Text } from 'react-native';
import CryptModule from 'react-native-crypt-module';

export default function App() {
  const [result, setResult] = React.useState<number | undefined>();
  const [resultStr, setResultStr] = React.useState<string | undefined>();

  React.useEffect(() => {
    CryptModule.multiply(3, 7).then(setResult);
    CryptModule.encrypt('test').then(setResultStr);
  }, []);

  return (
    <View style={styles.container}>
      <Text>Result: {result}</Text>
      <Text>ResultStr: {resultStr}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
