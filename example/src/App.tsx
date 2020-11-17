import * as React from 'react';
import { StyleSheet, View, Text } from 'react-native';
import CryptModule from 'react-native-crypt-module';

export default function App() {
  const [resultStr, setResultStr] = React.useState<string | undefined>();

  const makeid = (n: number) => {
    var res = '';
    var characters =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var charactersLength = characters.length;
    for (var i = 0; i < n; i++) {
      res += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return res;
  };

  const iv = makeid(10);
  const key = makeid(16);

  React.useEffect(() => {
    CryptModule.encrypt('test', iv, key).then(setResultStr);
  }, [iv, key]);

  return (
    <View style={styles.container}>
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
