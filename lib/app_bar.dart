import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 25.0),
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
    );
  }
}
