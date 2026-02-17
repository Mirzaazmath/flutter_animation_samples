import 'dart:math';
import 'package:flutter/material.dart';

class Sample6 extends StatefulWidget {
  const Sample6({super.key});

  @override
  State<Sample6> createState() => _Sample6State();
}

class _Sample6State extends State<Sample6> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotate;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    rotate = Tween<double>(
      begin: 0,
      end: pi
    ).animate(controller);
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (_, child) {
            return Transform(
              alignment: Alignment.center,
              // Here just change the rotateY.rotateX,rotateZ for different Result
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(rotate.value),
              child: child,
            );
          },
          child: GestureDetector(
            onTap: () {
              if (controller.isCompleted) {
                controller.reverse();
              } else {
                controller.forward();
              }
            },
            child: Container(
              height: 200,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.amber, Colors.purpleAccent],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
