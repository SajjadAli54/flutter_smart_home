import 'package:flutter/material.dart';
import 'package:flutter_smart_home/smart_device_box.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final horizontalpadding = 40.0;
  final verticalpadding = 25.0;

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
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalpadding, vertical: verticalpadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/icons/menu.png",
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalpadding, vertical: verticalpadding),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Home"),
                  Text("WATCH KOKO", style: TextStyle(fontSize: 40))
                ],
              ),
            ),
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
              padding: const EdgeInsets.all(25.0),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: mySmartDevices.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.3),
              itemBuilder: (context, index) => SmartDeviceBox(
                  deviceName: mySmartDevices[index][0] as String,
                  deviceStatus: mySmartDevices[index][2] as bool,
                  deviceIcon: mySmartDevices[index][1] as String,
                  onChange: (value) => handlePowerStatusChange(value, index)),
            ))
          ],
        ),
      ),
    );
  }
}
