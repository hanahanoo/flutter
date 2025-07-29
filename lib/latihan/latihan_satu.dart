import 'package:flutter/material.dart';
import 'package:project/main_layout.dart';

class LatihanSatu extends StatelessWidget {
  const LatihanSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
    title: 'Latihan Satu', 
    body: Center(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://picsum.dev/300/200'),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      "Judul", 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Text(
                        "Lorem Ipsum",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  Icon(Icons.play_circle_fill, color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}