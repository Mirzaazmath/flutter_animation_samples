import 'package:flutter/material.dart';

class Sample5 extends StatefulWidget {
  const Sample5({super.key});

  @override
  State<Sample5> createState() => _Sample5State();
}

class _Sample5State extends State<Sample5> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    scale = Tween<double>(
      begin: 1,
      end: 10,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
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
    return Scaffold(
      backgroundColor: Colors.purpleAccent.shade100,
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (_, child) {
            return Transform.scale(scale: scale.value, child: child);
          },
          child: Icon(Icons.favorite, color: Colors.red),
        ),
      ),
    );
  }
}
