
import 'package:flutter/material.dart';

class Sample4 extends StatefulWidget {
  const Sample4({super.key});

  @override
  State<Sample4> createState() => _Sample4State();
}

class _Sample4State extends State<Sample4>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> opacity;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    opacity = Tween<double>(
      begin: 1,
      end:  0
    ).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildRipple(double delay) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) {
        double value = controller.value;

        // Create delay effect
        double progress = (value - delay);
        if (progress < 0) progress += 1;

        return Opacity(
          opacity: (1 - progress).clamp(0.0, 1.0),
          child: Transform.scale(
            scale: 1 + (progress * 3), // Ripple size
            child: child,
          ),
        );
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red.withOpacity(0.3),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Multiple ripples for smooth effect
            buildRipple(0.0),
            buildRipple(0.3),
            buildRipple(0.6),

          ],
        ),
      ),
    );
  }
}
