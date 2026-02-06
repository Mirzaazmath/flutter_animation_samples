import 'package:flutter/material.dart';

class Sample1 extends StatefulWidget {
  const Sample1({super.key});

  @override
  State<Sample1> createState() => _Sample1State();
}

class _Sample1State extends State<Sample1> with SingleTickerProviderStateMixin {
  // Controller
  late AnimationController controller;
  // Scale Animation
  late Animation<double> animation;
  // Offset Animation
  late Animation<Offset> offsetAnimation;
  @override
  void initState() {
    // Initial controller
    controller = AnimationController(
      vsync: this,
      duration: (Duration(milliseconds: 2000)),
    );
    // Initial offsetAnimation with Tween<Offset> which have CurvedAnimation with Interval and Curves
    offsetAnimation = Tween<Offset>(begin: Offset(0, -500), end: Offset(0, 0))
        .animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.5, curve: Curves.bounceOut),
          ),
        );
    // Initial Scale Animation with Tween<double> which have CurvedAnimation with Interval
    animation = Tween<double>(
      begin: 1,
      end: 100,
    ).animate(CurvedAnimation(parent: controller, curve: Interval(0.5, 1.0)));
    // Staring the Animation
    controller.forward();

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
          animation: animation,
          builder: (_, child) {
            // For Offset animation
            return Transform.translate(
              offset: offsetAnimation.value,
              // For Scale Animation
              child: Transform.scale(scale: animation.value, child: child),
            );
          },
          child: CircleAvatar(radius: 30, backgroundColor: Colors.deepPurple),
        ),
      ),
    );
  }
}
