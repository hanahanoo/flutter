import 'package:flutter/material.dart';
import 'detail.dart';
import 'package:project/main_layout.dart';

class ListWisata extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> wisata;
  const ListWisata({super.key, required this.title, required this.wisata,});

  @override
  Widget build(BuildContext context) {
    return MainLayout(title: title, 
      body: ListView.builder(
        itemCount: wisata.length,
        itemBuilder: (context, index) {
          final singlewisata = wisata[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailWisata(data: singlewisata)),  
              );
            },
            child: Container(
              margin: EdgeInsets.all(10),
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 6)
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)
                      ),
                      image: DecorationImage(
                        image: NetworkImage(singlewisata['image']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(singlewisata['title']!,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Text(singlewisata['desc']!,style: TextStyle(fontSize: 13),)
                        ],
                      ),
                    ) 
                  )
                ],
              ),
            ),
            
          );
        },
      )
    );
  }
}