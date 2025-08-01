import 'package:flutter/material.dart';
import 'package:project/main_layout.dart';

class DetailWisata extends StatelessWidget {
  final Map<String, dynamic> data;
  const DetailWisata({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return MainLayout(title: 'Detail Wisata', 
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.all(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  data['image'],
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Text(data['kategori']!, style: const TextStyle(fontSize: 16),),
            Text(data['title']!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Text(data['desc']!, style: const TextStyle(fontSize: 16),),
            const SizedBox(height: 20,),
            Text('Lokasi', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Text(data['lokasi']!, style: const TextStyle(fontSize: 16),),

          ],
        ),
      )
    );
  }
}