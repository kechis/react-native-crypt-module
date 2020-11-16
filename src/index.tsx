import { NativeModules } from 'react-native';

type CryptModuleType = {
  multiply(a: number, b: number): Promise<number>;
};

const { CryptModule } = NativeModules;

export default CryptModule as CryptModuleType;
