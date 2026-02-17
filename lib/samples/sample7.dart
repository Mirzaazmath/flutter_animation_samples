import 'dart:math';

import 'package:flutter/material.dart';

class Sample7 extends StatefulWidget {
  const Sample7({super.key});

  @override
  State<Sample7> createState() => _Sample7State();
}

class _Sample7State extends State<Sample7> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotate;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    rotate = Tween<double>(begin: pi, end: 0).animate(controller);
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
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: .center,
        children: [
          AnimatedBuilder(
            animation: controller,
            builder: (_, child) {
              return Transform(
                alignment: Alignment.bottomCenter,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(rotate.value),
                child: child,
              );
            },
            child: Container(
              height: 300,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (controller.isCompleted) {
                controller.reverse();
              } else {
                controller.forward();
              }
            },
            child: Container(
              height: 300,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
