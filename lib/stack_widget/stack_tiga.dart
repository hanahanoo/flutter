import 'package:flutter/material.dart';
import 'package:project/main_layout.dart';

class StackThree extends StatelessWidget {
  const StackThree({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Image With Stack',
      body: Stack(
        children: [
          Image.network(
           'https://cdn.logojoy.com/wp-content/uploads/20230717163512/Barbie-logo-header-image.jpg'
            ),
          Positioned(bottom: 10, left: 10, child: Text('Barbie'),)
        ],
      ), 
      );
  }
}
