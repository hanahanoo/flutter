import 'package:flutter/material.dart';
import 'list.dart';
import 'package:project/main_layout.dart';

class KatalogWisata extends StatelessWidget {
  KatalogWisata({super.key});

  final List<Map<String, dynamic>> wisataDaerah = [
    {
      'title': 'Bali',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIpQ_1UIkqyp6nqPzbrnOTpLgbdavIo1anAg&s',
      'wisata': [
        {
          'title': 'Pantai Kuta',
          'desc': 'Pantai ikonik dengan sunset indah dan ombak untuk surfing.',
          'image': 'https://picsum.photos/300/200?11',
          'kategori': 'Pantai',
          'lokasi': 'Kabupaten Badung, Bali',
        },
        {
          'title': 'Ubud Monkey Forest',
          'desc': 'Hutan asri dengan ratusan monyet dan pura tua.',
          'image': 'https://picsum.photos/300/200?12',
          'kategori': 'Hutan',
          'lokasi': 'Ubud, Gianyar, Bali',
        },
      ]
    },
    {
      'title': 'Yogyakarta',
      'image': 'https://awsimages.detik.net.id/community/media/visual/2020/12/16/apik-begini-penampakan-kawasan-tugu-yogya-yang-kini-bebas-kabel_43.jpeg?w=600&q=90',
      'wisata': [
        {
          'title': 'Candi Prambanan',
          'desc': 'Candi Hindu terbesar di Indonesia, warisan dunia UNESCO.',
          'image': 'https://picsum.photos/300/200?13',
          'kategori': 'Sejarah',
          'lokasi': 'Sleman, Yogyakarta',
        },
        {
          'title': 'Malioboro',
          'desc': 'Jalan legendaris penuh oleh-oleh, kuliner, dan budaya.',
          'image': 'https://picsum.photos/300/200?14',
          'kategori': 'Pusat Kota',
          'lokasi': 'Yogyakarta',
        },
      ]
    },
    {
      'title': 'Lombok',
      'image': 'https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/05/07/WhatsApp-Image-2023-05-07-at-012334-1601479826.jpeg',
      'wisata': [
        {
          'title': 'Pantai Tanjung Aan',
          'desc': 'Pantai eksotis dengan pasir merica dan air biru jernih.',
          'image': 'https://picsum.photos/300/200?15',
          'kategori': 'Pantai',
          'lokasi': 'Lombok Tengah',
        },
        {
          'title': 'Gunung Rinjani',
          'desc': 'Gunung berapi aktif dengan pemandangan dan danau Segara Anak.',
          'image': 'https://picsum.photos/300/200?16',
          'kategori': 'Gunung',
          'lokasi': 'Lombok Timur',
        },
      ]
    },
    {
      'title': 'Bandung',
      'image': 'https://asset.kompas.com/crops/GEIiQSsEkCKrIGWEjOp_GaYHIHA=/0x0:1000x667/1200x800/data/photo/2022/07/25/62dec6809a479.jpg',
      'wisata': [
        {
          'title': 'Tangkuban Perahu',
          'desc': 'Gunung dengan kawah aktif yang bisa dikunjungi langsung.',
          'image': 'https://picsum.photos/300/200?17',
          'kategori': 'Gunung',
          'lokasi': 'Lembang, Bandung',
        },
        {
          'title': 'Floating Market',
          'desc': 'Pasar terapung modern dengan kuliner dan spot foto.',
          'image': 'https://picsum.photos/300/200?18',
          'kategori': 'Pasar',
          'lokasi': 'Lembang, Bandung',
        },
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Katalog Wisata',
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: wisataDaerah.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 kolom
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final listwisata = wisataDaerah[index];
            return GestureDetector(
                onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ListWisata(title: listwisata['title'], wisata: listwisata['wisata'],)),  
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[100],
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 6)
                  ],
                ),
                child: Stack(
                  children: [
                    // Background image
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(listwisata['image']!, fit: BoxFit.cover),
                      ),
                    ),
                    // Overlay
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                    // Price & Name
                    Positioned(
                      bottom: 10,
                      left: 10,
                      right: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(listwisata['title']!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
            );
          },
        ),
      ),
    );
  }
}