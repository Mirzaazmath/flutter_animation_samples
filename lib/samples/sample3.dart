import 'dart:math';
import 'package:flutter/material.dart';

class Sample3 extends StatefulWidget {
  const Sample3({super.key});

  @override
  State<Sample3> createState() => _Sample3State();
}

class _Sample3State extends State<Sample3> with SingleTickerProviderStateMixin {
  // Controller
  late AnimationController controller;
  @override
  void initState() {
    // Controller init
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    // Starting the Anmimation
    controller.forward();
    // Listening the Animation
    controller.addStatusListener((status) {

      if (status == AnimationStatus.completed) {
        // Reverse
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // Forward
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
          alignment: .centerRight,
          child: AnimatedBuilder(
            animation: controller,
            builder: (_, child) {
              final value = controller.value;
              return Transform(
                transform: Matrix4.identity()
                  ..translate(-value * width)
                  ..rotateZ(value * 2 * pi) // Full 360°
                  ..scale(0 + (value * pi)), // Scale from 0.5 → 1
                alignment: Alignment.center,
                child: child,
              );
            },
            child: Container(height: 50, width: 50, color: Colors.blueAccent),
          ),
        ),
      ),
    );
  }
}
