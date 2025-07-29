import 'package:flutter/material.dart';
import 'package:project/latihan/latihan_dua.dart';
import 'package:project/latihan/latihan_satu.dart';
import 'package:project/main_layout.dart';
import 'package:project/row_column_widget/column_satu.dart';
import 'package:project/row_column_widget/latihan_row_column.dart';
import 'package:project/row_column_widget/row_satu.dart';
import 'package:project/stack_widget/stack_tiga.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LatihanDua(
      )
    );
  }
}

class HelloFlutter extends StatelessWidget {
  const HelloFlutter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Belajar Flutter',
      body: Center(
        child: Text(
          'Hello Flutter',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            backgroundColor: Color.fromARGB(255, 255, 157, 213),
          ),
          ),
        
      ),
    );
  }
}