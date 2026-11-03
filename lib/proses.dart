import 'package:flutter/material.dart';

class ProsesPage extends StatelessWidget {
  const ProsesPage({super.key});

  // Hanya tersisa 5 langkah (Pemilihan Buah dihapus)
  final List<Map<String, dynamic>> langkah = const [
    {
      'judul': 'Bahan Dasar', 
      'desc': 'Biji melinjo segar dan berkualitas tinggi.',
      'gambar': 'assets/proses1.jpg', 
      'icon': Icons.eco_rounded,
    },
    {
      'judul': 'Penyangraian (Sangrai Pasir)', 
      'desc': 'Menyangrai biji melinjo bersama pasir panas agar matang merata dan kulitnya mudah dikupas.',
      'gambar': 'assets/proses2.jpg', // Sesuaikan nama file gambarnya
      'icon': Icons.local_fire_department_rounded,
    },
    {
      'judul': 'Pengupasan Kulit', 
      'desc': 'Mengupas kulit luar dan kulit ari biji melinjo yang sudah disangrai.',
      'gambar': 'assets/proses3.jpg', // Sesuaikan nama file gambarnya
      'icon': Icons.back_hand_rounded,
    },
    {
      'judul': 'Pemipihan Biji', 
      'desc': 'Memipihkan biji melinjo menggunakan alat khusus hingga tipis.',
      'gambar': 'assets/proses4.jpg', // Sesuaikan nama file gambarnya
      'icon': Icons.compress_rounded,
    },
    {
      'judul': 'Penjemuran', 
      'desc': 'Menjemur emping di bawah sinar matahari hingga benar-benar kering.',
      'gambar': 'assets/proses5.jpg', // Sesuaikan nama file gambarnya
      'icon': Icons.wb_sunny_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. AppBar Berlogo
      appBar: AppBar(
        title: Image.asset(
          'assets/nyamping_transparan.png',
          height: 40,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const Text(
              'PROSES PEMBUATAN',
              style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.5),
            );
          },
        ),
      ),
      
      // 2. List View dengan desain (Gambar + Teks)
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        itemCount: langkah.length,
        itemBuilder: (context, index) {
          final item = langkah[index];
          
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF5D4037).withOpacity(0.06),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🖼️ BAGIAN KIRI: GAMBAR & NOMOR
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          item['gambar'],
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 90,
                              height: 90,
                              color: const Color(0xFFFFF3E0),
                              child: Icon(
                                item['icon'],
                                color: const Color(0xFFF9A825),
                                size: 40,
                              ),
                            );
                          },
                        ),
                      ),
                      // Badge Nomor di atas gambar
                      Positioned(
                        top: 4,
                        left: 4,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Color(0xFF5D4037),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  
                  // 📝 BAGIAN KANAN: TEKS
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          item['judul'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF5D4037),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item['desc'],
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 13,
                            height: 1.4,
                          ),
                        ),
                      ],
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