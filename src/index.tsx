import { NativeModules } from 'react-native';

type CryptModuleType = {
  encrypt(a: string, iv: string, key: string): Promise<string>;
  decrypt(a: string, iv: string, key: string): Promise<string>;
};

const { CryptModule } = NativeModules;

export default CryptModule as CryptModuleType;
