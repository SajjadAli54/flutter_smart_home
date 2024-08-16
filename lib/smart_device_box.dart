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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: deviceStatus ? Colors.grey[900] : Colors.grey[200],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(deviceIcon,
                  height: 60,
                  color: deviceStatus ? Colors.white : Colors.black),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      deviceName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: deviceStatus ? Colors.white : Colors.black),
                    ),
                    Transform.rotate(
                        angle: pi / 2,
                        child: Switch(value: deviceStatus, onChanged: onChange))
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
