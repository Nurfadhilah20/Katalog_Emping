import 'package:flutter/material.dart';

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

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
              'TENTANG EMPING',
              style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.5),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 2. Gambar Hero / Banner Pembuka
            Container(
              width: double.infinity,
              height: 200,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Gambar Emping
                    Image.asset(
                      'assets/limpung.jpg', // Pastikan file gambar ini ada
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: const Color(0xFF8D6E63),
                          child: const Center(
                            child: Icon(Icons.image, color: Colors.white54, size: 80),
                          ),
                        );
                      },
                    ),
                    // Overlay Gelap agar teks terbaca
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                    // Teks di atas gambar
                    const Positioned(
                      bottom: 20,
                      left: 20,
                      child: Text(
                        'Mengenal Lebih Dekat\nCamilan Emping',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 3. Daftar Section dengan Desain Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildSection(
                    'Pengertian Emping',
                    'Emping adalah sejenis kerupuk yang terbuat dari biji melinjo (Gnetum gnemon) yang dipipihkan kemudian digoreng atau dipanggang.',
                    Icons.menu_book_rounded,
                  ),
                  _buildSection(
                  'Sejarah & Asal-Usul',
                  'Pohon melinjo (Gnetum gnemon) adalah tanaman asli Asia Tenggara yang telah lama tumbuh di Indonesia. Sejarah konsumsi melinjo dapat dilacak hingga masa Kerajaan Yogyakarta dan Banten. '
                  'Salah satu pusat pembuatan emping paling awal berada di Desa Ngaliyan, Kabupaten Batang, Jawa Tengah, yang telah memproduksi emping sejak sekitar satu abad yang lalu. '
                  'Sementara itu, di Pidie, Aceh, tradisi mengolah melinjo menjadi emping (Keureupuk Mulieng) berkembang pesat pada pertengahan 1960-an, yang awalnya hanya untuk konsumsi rumah tangga. Kini, Keureupuk Mulieng telah diakui sebagai Warisan Budaya Takbenda Indonesia.',
                  Icons.history_edu_rounded,
                  ),
                  
                  _buildSection(
                    'Bahan Utama',
                    'Bahan utama pembuatan emping adalah biji melinjo. Buah melinjo sendiri memiliki rasa khas yang sedikit pahit namun menghasilkan gurih yang kuat saat diolah menjadi emping.',
                    Icons.eco_rounded,
                  ),
                  _buildSection(
                    'Keunikan',
                    'Keunikan emping terletak pada proses pembuatannya yang masih sangat tradisional, serta rasa gurih khas yang berasal dari biji melinjo asli, bukan dari perasa buatan.',
                    Icons.auto_awesome_rounded,
                  ),
                  const SizedBox(height: 30), // Spasi bawah
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget Custom untuk Mencetak Card Section
  Widget _buildSection(String title, String content, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ikon di Kiri
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3E0), // Warna krem lembut
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFFF9A825), size: 24), // Ikon kuning emas
          ),
          const SizedBox(width: 16),
          // Teks di Kanan
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title, 
                  style: const TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.bold, 
                    color: Color(0xFF5D4037), // Coklat
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  content, 
                  style: TextStyle(
                    height: 1.5, 
                    color: Colors.grey[700], 
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}