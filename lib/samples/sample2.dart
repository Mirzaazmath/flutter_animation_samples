import 'dart:math';

import 'package:flutter/material.dart';

class Sample2 extends StatefulWidget {
  const Sample2({super.key});

  @override
  State<Sample2> createState() => _Sample2State();
}

class _Sample2State extends State<Sample2> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    controller.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width - 50;
    return Scaffold(
      body: Center(
        child: Align(
          alignment: .centerLeft,
          child: AnimatedBuilder(
            animation: controller,
            builder: (_, child) {
              return Transform.translate(
                offset: Offset((controller.value * width), 0),
                child: Transform.rotate(
                  angle: controller.value * pi,
                  child: child,
                ),
              );
            },
            child: Container(height: 50, width: 50, color: Colors.blueAccent),
          ),
        ),
      ),
    );
  }
}
