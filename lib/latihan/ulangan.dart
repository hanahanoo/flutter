import 'package:flutter/material.dart';
import 'package:project/main_layout.dart';
import 'package:project/latihan/pemesanan.dart';

class Ulangan extends StatelessWidget {
  Ulangan({super.key});

  final List<Map<String, dynamic>> tiketBioskop = [
    {
      "judul": "Conjuring: The Last Rites",
      "studio": 1,
      "harga": 50000,
      "jadwal": "Jumat, 19:00 WIB",
      "img": "https://picsum.photos/300/200?11",
      "genre": ["Horror", "Supernatural"]
    },
    {
      "judul": "The Fantastic Four: First Steps",
      "studio": 2,
      "harga": 45000,
      "jadwal": "Sabtu, 14:00 WIB",
      "img": "https://picsum.photos/300/200?12",
      "genre": ["Adventure", "Scifi"]
    },
    {
      "judul": "Sore Istri dari Masa Depan",
      "studio": 3,
      "harga": 55000,
      "jadwal": "Minggu, 16:30 WIB",
      "img": "https://picsum.photos/300/200?13",
      "genre": ["Drama", "Romance"]
    },
    {
      "judul": "Rego Nyowo",
      "studio": 4,
      "harga": 40000,
      "jadwal": "Jumat, 18:00 WIB",
      "img": "https://picsum.photos/300/200?14",
      "genre": ["Horror", "Supernatural"]
    },
    {
      "judul": "Omniscient Reader: The Prophecy",
      "studio": 5,
      "harga": 40000,
      "jadwal": "Sabtu, 20:00 WIB",
      "img": "https://picsum.photos/300/200?15",
      "genre": ["Action", "Fantasy"]
    },
    {
      "judul": "Bertaut Rindu: Semua Impian Berhak Dirayakan",
      "studio": 6,
      "harga": 50000,
      "jadwal": "Minggu, 13:00 WIB",
      "img": "https://picsum.photos/300/200?16",
      "genre": ["Romance", "Drama"]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Daftar Film',
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: tiketBioskop.length,
        itemBuilder: (context, index) {
          final film = tiketBioskop[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Pemesanan(data: film),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    child: Image.network(
                      film['img'] as String,
                      width: 100,
                      height: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, s) => Container(
                        width: 100,
                        height: 120,
                        color: Colors.grey,
                        child: const Icon(Icons.broken_image),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            film['judul'] as String,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            (film['genre'] as List).join(', '),
                            style: const TextStyle(fontSize: 13),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "💵 Rp${film['harga']} · 🎬 Studio ${film['studio']}",
                            style: const TextStyle(fontSize: 12),
                          ),
                          Text(
                            "🕒 ${film['jadwal']}",
                            style: const TextStyle(fontSize: 12),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
