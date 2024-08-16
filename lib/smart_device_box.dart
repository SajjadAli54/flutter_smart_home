import 'dart:math';

import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String deviceName;
  final bool deviceStatus;
  final String deviceIcon;
  final Function(bool) onChange;

  const SmartDeviceBox(
      {super.key,
      required this.deviceName,
      required this.deviceStatus,
      required this.deviceIcon,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      decoration: BoxDecoration(
        color: deviceStatus ? Colors.grey[900] : Colors.grey[200],
        borderRadius: BorderRadius.circular(24),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image.asset(deviceIcon,
            height: 65, color: deviceStatus ? Colors.white : Colors.black),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Expanded(
                  child: Text(
                deviceName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: deviceStatus ? Colors.white : Colors.black),
              )),
            ),
            Transform.rotate(
                angle: pi / 2,
                child: Switch(value: deviceStatus, onChanged: onChange))
          ],
        )
      ]),
    );
  }
}
