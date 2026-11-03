import 'package:flutter/material.dart';

class KatalogPage extends StatelessWidget {
  const KatalogPage({super.key});

  // Data produk yang sudah dilengkapi dengan gambar dan rating
  final List<Map<String, dynamic>> produk = const [
    {
      'nama': 'Emping Original',
      'harga': 'Rp 15.000',
      'berat': '150g',
      'gambar': 'assets/emping1.jpeg', // Pastikan nama file sesuai
      'badge': 'Best Seller',
      'rating': '4.9'
    },
    {
      'nama': 'Emping Balado',
      'harga': 'Rp 18.000',
      'berat': '150g',
      'gambar': 'assets/emping2.jpg',
      'badge': 'Pedas!',
      'rating': '4.8'
    },
    {
      'nama': 'Emping Manis',
      'harga': 'Rp 17.000',
      'berat': '150g',
      'gambar': 'assets/emping3.jpg',
      'badge': 'Favorit',
      'rating': '4.7'
    },
    {
      'nama': 'Emping Pedas',
      'harga': 'Rp 18.000',
      'berat': '150g',
      'gambar': 'assets/emping1.jpeg', // Bisa ganti dengan gambar pedas jika ada
      'badge': 'Baru',
      'rating': '4.9'
    },
    {
      'nama': 'Emping Mentah',
      'harga': 'Rp 25.000',
      'berat': '250g',
      'gambar': 'assets/emping.jpg', // Menggunakan banner sebagai placeholder
      'badge': 'Murah',
      'rating': '4.6'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar menggunakan logo Nyamping
      appBar: AppBar(
        title: Image.asset(
          'assets/nyamping_transparan.png',
          height: 40,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const Text(
              'KATALOG NYAMPING',
              style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.5),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Color(0xFF5D4037)),
            onPressed: () {},
          )
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        // Grid responsif: jika layar lebar (web), otomatis menambah kolom
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 240, // Lebar maksimal per kotak
          childAspectRatio: 0.75,  // Proporsi tinggi : lebar
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: produk.length,
        itemBuilder: (context, index) {
          final item = produk[index];
          
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF5D4037).withOpacity(0.08),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🖼️ BAGIAN GAMBAR & BADGE
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Stack(
                    children: [
                      Image.asset(
                        item['gambar'],
                        height: 140, // Tinggi gambar
                        width: double.infinity,
                        fit: BoxFit.cover,
                        // Jika gambar error/tidak ketemu, tampilkan kotak coklat
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 140,
                          color: const Color(0xFFFFF3E0),
                          child: const Center(
                            child: Icon(Icons.cookie, color: Color(0xFFF9A825), size: 60),
                          ),
                        ),
                      ),
                      // Badge di atas gambar
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: const Color(0xFF5D4037),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            item['badge'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                // 📝 BAGIAN INFORMASI PRODUK
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nama Produk
                      Text(
                        item['nama'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color(0xFF3E2723),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      
                      // Berat
                      Text(
                        'Berat: ${item['berat']}',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                      const SizedBox(height: 8),
                      
                      // Rating & Harga
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Rating
                          Row(
                            children: [
                              const Icon(Icons.star_rounded, color: Color(0xFFF9A825), size: 16),
                              const SizedBox(width: 4),
                              Text(
                                item['rating'],
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          // Harga
                          Text(
                            item['harga'],
                            style: const TextStyle(
                              color: Color(0xFF5D4037),
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}