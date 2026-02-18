import 'dart:math';

import 'package:flutter/material.dart';

class Sample8 extends StatefulWidget {
  const Sample8({super.key});

  @override
  State<Sample8> createState() => _Sample8State();
}

class _Sample8State extends State<Sample8> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotate;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
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
          GestureDetector(
            onTap: () {
              if (controller.isCompleted) {
                controller.reverse();
              } else {
                controller.forward();
              }
            },
            child: Stack(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 50,vertical: 50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                ),

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
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
