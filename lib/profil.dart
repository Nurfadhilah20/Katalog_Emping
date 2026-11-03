import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

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
              'PROFIL USAHA',
              style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.5),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 🏢 HEADER BRAND
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF5D4037).withOpacity(0.06),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Logo di dalam lingkaran
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFDFBF7), // Cream
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/nyamping_transparan.png',
                      height: 80,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.store, size: 80, color: Color(0xFF5D4037)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Nama Brand (Diperbaiki jadi NYAMPING)
                  const Text(
                    'NYAMPING',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF5D4037),
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Nyamannya Makan Emping, KRIUK!',
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),

            // 🎯 VISI & MISI
            _buildInfoCard(
              Icons.remove_red_eye_rounded,
              const Color(0xFF558B2F), // Hijau
              'Visi',
              'Menjadi produsen camilan emping melinjo terbaik yang mendunia dengan cita rasa lokal.',
            ),
            _buildInfoCard(
              Icons.flag_rounded,
              const Color(0xFFF9A825), // Kuning
              'Misi',
              '1. Menyajikan produk berkualitas dengan bahan alami.\n2. Memberdayakan petani melinjo lokal.\n3. Melestarikan camilan tradisional Indonesia.',
            ),

            const SizedBox(height: 8),

            // 📞 KONTAK & ALAMAT
            Container(
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
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3E0),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.location_on_rounded, color: Color(0xFF5D4037)),
                    ),
                    title: const Text('Alamat Usaha', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    subtitle: const Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Text('Duku Pengilon, Desa Kumesu, Reban, Batang', style: TextStyle(fontSize: 13)),
                    ),
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3E0),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.phone_rounded, color: Color(0xFF5D4037)),
                    ),
                    title: const Text('Kontak', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    subtitle: const Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Text('0812-3456-7890 / nyampingaja@gmail.com', style: TextStyle(fontSize: 13)),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            // 👨‍🎓 IDENTITAS PEMBUAT APLIKASI
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3E0), // Background Cream
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFF9A825), width: 1.5),
              ),
              child: Column(
                children: [
                  const Icon(Icons.school_rounded, color: Color(0xFF5D4037), size: 30),
                  const SizedBox(height: 8),
                  const Text(
                    'Aplikasi Dibuat Oleh:',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF5D4037)),
                  ),
                  const SizedBox(height: 8),
                  // 👇 GANTI NAMA DAN NIM DI SINI
                  const Text(
                    'NUR FADHILAH', 
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'NPM : 24670020', 
                    style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget Custom untuk Visi & Misi
  Widget _buildInfoCard(IconData icon, Color iconColor, String title, String content) {
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
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title, 
                  style: const TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.bold, 
                    color: Color(0xFF5D4037),
                  ),
                ),
                const SizedBox(height: 6),
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