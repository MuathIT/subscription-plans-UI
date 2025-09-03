import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PlansIcon extends StatelessWidget {
  const PlansIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 130,
      padding: EdgeInsets.all(3), // border width
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentGeometry.topCenter, // gradient border.
          end: AlignmentGeometry.bottomCenter,
          colors: [Colors.blue.shade600, Colors.deepPurpleAccent],
        ),
        shape: BoxShape.circle,
        border: Border.all(style: BorderStyle.solid),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade600,
            blurRadius: 8,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Container(
        // inner container.
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white, // inner color.
          shape: BoxShape.circle,
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.deepPurple,
          highlightColor: Colors.blue.shade500,
          direction: ShimmerDirection.ltr,
          child: Image.asset("assets/icons/crown.png", height: 40, width: 40),
        ),
      ),
    );
  }
}
