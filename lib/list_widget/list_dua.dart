import 'package:flutter/material.dart';
import 'package:project/main_layout.dart';

class ListDua extends StatelessWidget {
   ListDua({super.key});

  final List<Map<String, dynamic>> listData = [
    {'color':Colors.red[300], 'partai':'Partai Banteng'},
    {'color':Colors.red[200], 'partai':'Partai Joged'},
    {'color':Colors.red[100], 'partai':'Partai Solid'},
    {'color':Colors.red[50], 'partai':'Partai Jawa'},
  ];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'List Builder', 
      body: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, i) {
          final data = listData[i];
          return Container(
            color: data['color'],
            width: 200,
            height: 200,
            child: Center(child: Text(data['partai'])),
          );
        },
      ),
      );
  }
}