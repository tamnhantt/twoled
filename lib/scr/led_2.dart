import 'package:dart_periphery/dart_periphery.dart';
import 'package:flutter/foundation.dart';

class GpioLedTwo {
  // ignore: prefer_typing_uninitialized_variables
  static var gpio17;

  void initGpio17Output() {
    gpio17 = GPIO(17, GPIOdirection.gpioDirOut);
  }

  void gpio17OutputLevel(bool outputValue) {
    debugPrint('outputValue: $outputValue');
    gpio17.write(outputValue);
  }

  void disposeGpio() {
    gpio17.dispose();
  }
}
