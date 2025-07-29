import 'package:flutter/material.dart';
import 'package:project/main_layout.dart';
import 'news.dart';

class LatihanDua extends StatelessWidget {
  const LatihanDua({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Latihan Satu',
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text("Berita Terkini", style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  NewsCard(
                    imageUrl: 'https://picsum.photos/200',
                    title: 'Judul A',
                    subtitle: 'Subjudul A',
                  ),
                  NewsCard(
                    imageUrl: 'https://picsum.photos/201',
                    title: 'Judul B',
                    subtitle: 'Subjudul B',
                  ),
                  NewsCard(
                    imageUrl: 'https://picsum.photos/202',
                    title: 'Judul C',
                    subtitle: 'Subjudul C',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
