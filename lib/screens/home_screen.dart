import 'package:flutter/material.dart';
import 'package:gpio_led/scr/led_1.dart';
import 'package:gpio_led/scr/led_2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Tạo đối tượng điều khiển cả 2 LED
  final GpioLedOne gpioLedOne = GpioLedOne();
  final GpioLedTwo gpioLedTwo = GpioLedTwo();

  @override
  void initState() {
    gpioLedOne.initGpio16Output();
    gpioLedTwo.initGpio17Output();
    super.initState();
  }

  @override
  void dispose() {
    gpioLedOne.disposeGpio();
    gpioLedTwo.disposeGpio();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('GPIO LED Control'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Điều khiển LED 1
            const Text('LED 1',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            getElevatedButtonLedOn(gpioLedOne, 'LED 1 On'),
            const SizedBox(height: 10),
            getElevatedButtonLedOff(gpioLedOne, 'LED 1 Off'),

            const SizedBox(height: 20),

            // Điều khiển LED 2
            const Text('LED 2',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            getElevatedButtonLed2On(gpioLedTwo, 'LED 2 On'),
            const SizedBox(height: 10),
            getElevatedButtonLed2Off(gpioLedTwo, 'LED 2 Off'),
            const Text('Control Both LEDs',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  gpioLedOne.gpio16OutputLevel(true);
                  gpioLedTwo.gpio17OutputLevel(true);
                });
              },
              child: const Text('Turn Both LEDs On'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  gpioLedOne.gpio16OutputLevel(false);
                  gpioLedTwo.gpio17OutputLevel(false);
                });
              },
              child: const Text('Turn Both LEDs Off'),
            )
          ],
        ),
      ),
    );
  }

  // Hàm chung để tạo nút bấm bật LED
  Widget getElevatedButtonLedOn(dynamic gpioLed, String label) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          gpioLed.gpio16OutputLevel(true);
        });
      },
      child: Text(label),
    );
  }

  Widget getElevatedButtonLed2On(dynamic gpioLed, String label) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          gpioLed.gpio17OutputLevel(true);
        });
      },
      child: Text(label),
    );
  }

  // Hàm chung để tạo nút bấm tắt LED
  Widget getElevatedButtonLedOff(dynamic gpioLed, String label) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          gpioLed.gpio16OutputLevel(false);
        });
      },
      child: Text(label),
    );
  }

  Widget getElevatedButtonLed2Off(dynamic gpioLed, String label) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          gpioLed.gpio17OutputLevel(false);
        });
      },
      child: Text(label),
    );
  }
}
