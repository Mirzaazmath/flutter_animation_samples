import 'dart:math';

import 'package:flutter/material.dart';

class Sample9 extends StatefulWidget {
  const Sample9({super.key});

  @override
  State<Sample9> createState() => _Sample9State();
}

class _Sample9State extends State<Sample9> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotateUp;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    rotateUp = Tween<double>(begin: pi/2, end: 0).animate(controller);

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
      body: Row(
        mainAxisAlignment:.center,
        children: [
          AnimatedBuilder(
            animation: controller,
            builder: (_, child) {
              return Transform(
                alignment: Alignment.centerRight,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(-rotateUp.value),
                child: child,
              );
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: .center,
            children: [
              AnimatedBuilder(
                animation: controller,
                builder: (_, child) {
                  return Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(rotateUp.value),
                    child: child,
                  );
                },
                child: Container(
                  height: 100,
                  width: 100,

                  decoration: BoxDecoration(
                    color: Colors.red,
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
                  height: 100,
                  width: 100,

                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: controller,
                builder: (_, child) {
                  return Transform(
                    alignment: Alignment.topCenter,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(-rotateUp.value),
                    child: child,
                  );
                },
                child: Container(
                  height: 100,
                  width: 100,

                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          AnimatedBuilder(
            animation: controller,
            builder: (_, child) {
              return Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(rotateUp.value),
                child: child,
              );
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

