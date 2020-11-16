import { NativeModules } from 'react-native';

type CryptModuleType = {
  multiply(a: number, b: number): Promise<number>;
  encrypt(a: string): Promise<string>;
};

const { CryptModule } = NativeModules;

export default CryptModule as CryptModuleType;
