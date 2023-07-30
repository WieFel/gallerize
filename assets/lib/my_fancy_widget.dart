import 'package:flutter/material.dart';

class MyFancyWidget extends StatelessWidget {
  const MyFancyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text("My Fancy Widget!"),
      ),
    );
  }
}
