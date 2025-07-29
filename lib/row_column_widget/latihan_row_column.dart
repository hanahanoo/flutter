import 'package:flutter/material.dart';
import 'package:project/main_layout.dart';

class LatihanRowColumn extends StatelessWidget {
  const LatihanRowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Latihan Row Column', 
      body: Center(
        child: Container(
          height: 60,
          width: double.infinity,
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.call, size: 30),
                  Text('Call')
                ],
              ),
               Column(
                children: [
                  Icon(Icons.navigation),
                  Text('Route')
                ],
              ),
               Column(
                children: [
                  Icon(Icons.share),
                  Text('Share')
                ],
              )
            ],
          ),
        ),
      ),
      );
  }
}