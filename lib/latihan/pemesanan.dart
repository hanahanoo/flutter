import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/main_layout.dart';
import 'package:project/latihan/pembayaran.dart'; // pastikan import ini

class Pemesanan extends StatefulWidget {
  final Map<String, dynamic> data;
  const Pemesanan({super.key, required this.data});

  @override
  State<Pemesanan> createState() => _PemesananState();
}

class _PemesananState extends State<Pemesanan> {
  final namaController = TextEditingController();
  final tanggalController = TextEditingController();
  final jumlahController = TextEditingController();

  Future<void> _pilihTanggal(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        tanggalController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    return MainLayout(
      title: 'Form Pemesanan',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                data['img'],
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text('${data['judul']} - Studio ${data['studio']}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Rp ${data['harga']}', style: const TextStyle(fontSize: 16, color: Colors.green)),
            const SizedBox(height: 8),
            Text(data['genre'].join(', '), style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 16),
            
            // Form input
            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: tanggalController,
              readOnly: true,
              onTap: () => _pilihTanggal(context),
              decoration: const InputDecoration(
                labelText: 'Tanggal Pemesanan',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: jumlahController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Jumlah Tiket',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                if (namaController.text.isEmpty || tanggalController.text.isEmpty || jumlahController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Semua field harus diisi!')),
                  );
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Pembayaran(
                      data: {
                        ...data,
                        'nama': namaController.text,
                        'tanggal': tanggalController.text,
                        'jumlah': jumlahController.text,
                      },
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.check),
              label: const Text('Pesan Tiket'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
            )
          ],
        ),
      ),
    );
  }
}
