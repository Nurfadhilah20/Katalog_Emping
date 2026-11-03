import 'package:flutter/material.dart';
import 'katalog.dart';
import 'proses.dart';
import 'tentang.dart';
import 'profil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NYAMPING - Nyamannya makan Emping, KRIUK!',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFDFBF7),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5D4037),
          primary: const Color(0xFF5D4037),
          secondary: const Color(0xFFF9A825),
          tertiary: const Color(0xFF558B2F),
          background: const Color(0xFFFDFBF7),
        ),
        useMaterial3: true,
        fontFamily: 'Poppins', 
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, 
          foregroundColor: Color(0xFF5D4037),
          elevation: 1, 
          centerTitle: true,
        ),
      ),
      home: const MainNavigation(),
    );
  }
}

// ==========================================
// NAVIGASI UTAMA (5 MENU)
// ==========================================
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const KatalogPage(),
    const ProsesPage(),
    const TentangPage(),
    const ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, -5),
            )
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: const Color(0xFF5D4037), 
          unselectedItemColor: Colors.grey[400],
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.storefront_rounded), label: 'Katalog'),
            BottomNavigationBarItem(icon: Icon(Icons.eco_rounded), label: 'Proses'), 
            BottomNavigationBarItem(icon: Icon(Icons.info_rounded), label: 'Tentang'),
            BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profil'),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// HALAMAN 1: BERANDA (HOME)
// ==========================================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/nyamping_transparan.png', 
          height: 45, 
          fit: BoxFit.contain,
          // Jika logo tidak ketemu, tampilkan teks NYAMPING
          errorBuilder: (context, error, stackTrace) {
            return const Text(
              'NYAMPING', 
              style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.eco, color: Color(0xFF558B2F)), 
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🟡 BANNER DENGAN GAMBAR EMPING
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), 
                    blurRadius: 15, 
                    offset: const Offset(0, 8)
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Stack(
                  children: [
                    // Gambar Banner
                    Image.asset(
                      'assets/emping.jpg',
                      width: double.infinity,
                      height: 220,
                      fit: BoxFit.cover,
                      // Jika gambar tidak ketemu, tampilkan warna coklat
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: const Color(0xFF8D6E63),
                          child: const Center(
                            child: Icon(Icons.image, color: Colors.white54, size: 80),
                          ),
                        );
                      },
                    ),
                    // Lapisan Gradient Gelap
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                    ),
                    // Teks
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF558B2F), 
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              '100% Bahan Alami',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Enaknya Makan\nEmping, KRIUK!', 
                            style: TextStyle(
                              fontSize: 28, 
                              fontWeight: FontWeight.w900, 
                              color: Colors.white, 
                              height: 1.2,
                            )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 🟤 SAMBUTAN & PENGENALAN
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.spa, color: Color(0xFF558B2F), size: 24), 
                      const SizedBox(width: 8),
                      const Text(
                        'Halo, Pecinta Emping!', 
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF5D4037))
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Nikmati sensasi kriuk dari NYAMPING. Dibuat dari biji melinjo pilihan yang ditanam secara alami, diolah higienis untuk menemani waktu santai Anda.', 
                    style: TextStyle(color: Colors.grey[700], height: 1.6, fontSize: 14)
                  ),
                  const SizedBox(height: 24),
                  
                  // Judul Produk Unggulan
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Produk Unggulan', 
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF5D4037))
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Lihat Semua', style: TextStyle(color: Color(0xFF558B2F), fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ],
              ),
            ),
            
            // 🟡 LIST HORIZONTAL PRODUK UNGGULAN (PAKAI GAMBAR LOKAL)
            SizedBox(
              height: 240, 
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildFeaturedCard(
                    'Emping Original', 
                    'Rp 15.000', 
                    'assets/emping1.jpeg', // 👈 PASTIKAN FILE INI ADA
                    'Best Seller'
                  ),
                  _buildFeaturedCard(
                    'Emping Balado', 
                    'Rp 18.000', 
                    'assets/emping2.jpg', // 👈 PASTIKAN FILE INI ADA
                    'Pedas!'
                  ),
                  _buildFeaturedCard(
                    'Emping Manis', 
                    'Rp 17.000', 
                    'assets/emping3.jpg', // 👈 PASTIKAN FILE INI ADA
                    'Favorit'
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // 🛒 KARTU PRODUK DENGAN GAMBAR
  Widget _buildFeaturedCard(String title, String price, String imagePath, String badge) {
    return Container(
      width: 170, 
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF5D4037).withOpacity(0.08), 
            blurRadius: 15, 
            offset: const Offset(0, 8)
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Stack(
              children: [
                // Gambar Produk (Sekarang pakai AssetImage)
                Image.asset(
                  imagePath,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  // Jika gambar tidak ketemu, tampilkan ikon
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 120,
                    color: const Color(0xFFFFF3E0),
                    child: const Center(
                      child: Icon(Icons.cookie, color: Color(0xFFF9A825), size: 50),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF5D4037),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      badge,
                      style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title, 
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF3E2723)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                
                Row(
                  children: [
                    const Icon(Icons.star_rounded, color: Color(0xFFF9A825), size: 16),
                    const SizedBox(width: 4),
                    Text('4.9', style: TextStyle(color: Colors.grey[700], fontSize: 12, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    const Icon(Icons.eco, color: Color(0xFF558B2F), size: 14),
                    const SizedBox(width: 2),
                    Text('Alami', style: TextStyle(color: Colors.grey[700], fontSize: 11)),
                  ],
                ),
                const SizedBox(height: 10),
                
                Text(
                  price, 
                  style: const TextStyle(color: Color(0xFF5D4037), fontWeight: FontWeight.w900, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}