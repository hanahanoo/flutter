import 'package:flutter/material.dart';
import 'package:project/main_layout.dart';

class Pembayaran extends StatefulWidget {
  final Map<String, dynamic> data;
  const Pembayaran({super.key, required this.data});

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  final TextEditingController _uangController = TextEditingController();
  String? pesan = '';

  @override
  Widget build(BuildContext context) {
    final data = widget.data;
    final harga = int.tryParse(data['harga'].toString()) ?? 0;
    final jumlah = int.tryParse(data['jumlah'].toString()) ?? 0;
    final total = harga * jumlah;

    return MainLayout(
      title: 'Detail Pembayaran',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Film
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

            // Info Film
            Text(data['judul'] ?? '-', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Studio ${data['studio']}', style: const TextStyle(fontSize: 14)),
            Text(data['jadwal'] ?? '-', style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 8),
            Text("Genre: ${data['genre'].join(', ')}", style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 16),

            // Info Pemesanan
            Text("Nama: ${data['nama']}", style: const TextStyle(fontSize: 14)),
            Text("Tanggal Pemesanan: ${data['tanggal']}", style: const TextStyle(fontSize: 14)),
            Text("Jumlah Tiket: $jumlah", style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 12),

            // Total Harga
            const Text("Total yang harus dibayar:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text("Rp$total", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
            const SizedBox(height: 20),

            // Input uang pembayaran
            TextField(
              controller: _uangController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Uang Pembayaran',
                prefixText: 'Rp',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Tombol Konfirmasi
          ElevatedButton.icon(
                onPressed: () {
                  final bayar = int.tryParse(_uangController.text) ?? 0;

                  if (bayar < total) {
                    final kurang = total - bayar;
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("Pembayaran Gagal"),
                        content: Text("💸 Uang tidak cukup. Kurang Rp$kurang"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          )
                        ],
                      ),
                    );
                  } else {
                    final kembalian = bayar - total;
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("Pembayaran Berhasil"),
                        content: Text("✅ Kembalian: Rp$kembalian"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // tutup dialog
                              Navigator.pop(context); // keluar dari pembayaran
                              Navigator.pop(context); // keluar dari pemesanan
                            },
                            child: const Text("OK"),
                          )
                        ],
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.payment),
                label: const Text("Konfirmasi Pembayaran"),
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
              ),

            ],
        ),
      ),
    );
  }
}
