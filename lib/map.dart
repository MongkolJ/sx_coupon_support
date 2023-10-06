import 'package:flutter/material.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InteractiveViewer(
        panEnabled: false, // Set it to false
        // boundaryMargin: EdgeInsets.all(100),
        clipBehavior: Clip.none,
        minScale: 0.1,
        maxScale: 10,
        child: Image.asset(
          'assets/images/map.jpg',
        ),
      ),
    );
  }
}
