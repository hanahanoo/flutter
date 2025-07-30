import 'package:flutter/material.dart';
import 'package:project/main_layout.dart';

class GridSatu extends StatelessWidget {
  const GridSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Grid Satu', 
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        children: [
          Container(color: Colors.red[300], width: 50, child: Text('1')),
          Container(color: Colors.red[200], width: 50, child: Text('2')),
          Container(color: Colors.red[100], width: 50, child: Text('3')),
          Container(color: Colors.red[100], width: 50, child: Text('4')),
          Container(color: Colors.red[200], width: 50, child: Text('5')),
          Container(color: Colors.red[300], width: 50, child: Text('6')),
          Container(color: Colors.red[200], width: 50, child: Text('7')),
          Container(color: Colors.red[100], width: 50, child: Text('8')),
          Container(color: Colors.red[300], width: 50, child: Text('9')),
        ],
      )
      );
  }
}