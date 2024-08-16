import 'package:flutter/material.dart';
import 'package:flutter_smart_home/app_bar.dart';
import 'package:flutter_smart_home/smart_device_box.dart';
import 'package:flutter_smart_home/title.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final horizontalpadding = 20.0;
  final verticalpadding = 10.0;

  final mySmartDevices = [
    // [name, icon path, power status]
    ['Smart TV', 'assets/icons/smart-tv.png', true],
    ['Smart Fan', 'assets/icons/fan.png', false],
    ['Smart Light', 'assets/icons/light-bulb.png', false],
    ['Smart AC', 'assets/icons/air-conditioner.png', true],
  ];

  handlePowerStatusChange(value, index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyAppBar(),
            const SizedBox(height: 10),
            const MyTitle(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
              child: Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalpadding, vertical: verticalpadding),
              child: const Text(
                "Smart Devices",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            Expanded(
                child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: mySmartDevices.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => SmartDeviceBox(
                deviceName: mySmartDevices[index][0] as String,
                deviceStatus: mySmartDevices[index][2] as bool,
                deviceIcon: mySmartDevices[index][1] as String,
                onChange: (value) => handlePowerStatusChange(value, index),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
