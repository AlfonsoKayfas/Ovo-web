import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OVO App Slicing',
      theme: ThemeData(
        primaryColor: const Color(0xFF4C2A86),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MainNavigationScreen(),
    );
  }
}

// 1. STATEFUL WIDGET UNTUK MENGATUR PINDAH TAB HALAMAN
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  // Indeks tab aktif (0: Home, 1: Finance, 2: Inbox, 3: Profile)
  int _selectedIndex = 0;

  // Daftar tampilan halaman
  final List<Widget> _pages = [
    const OvoHomePageContent(),
    const Center(child: Text('Halaman Finance', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    const Center(child: Text('Halaman Inbox', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
    const ProfileScreen(), // Halaman Profile Alfonso
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      // Menampilkan halaman sesuai tab yang dipilih
      body: _pages[_selectedIndex],
      
      // Tombol Pay Melayang
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF4C2A86),
        elevation: 4,
        child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      // Baris Navigasi Bawah Interaktif
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.white,
        elevation: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', 0),
              _buildNavItem(Icons.show_chart, 'Finance', 1),
              const SizedBox(width: 40), // Spasi tombol Pay
              _buildNavItem(Icons.notifications_none, 'Inbox', 2),
              _buildNavItem(Icons.person_outline, 'Profile', 3),
            ],
          ),
        ),
      ),
    );
  }

  // Cetakan Item Navigasi Bawah dengan Efek Klik (InkWell)
  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isActive = _selectedIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index; // Memperbarui tab aktif saat diklik
        });
      },
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive ? const Color(0xFF4C2A86) : Colors.grey.shade600,
              size: 22,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: isActive ? const Color(0xFF4C2A86) : Colors.grey.shade600,
                fontSize: 10,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class OvoHomePageContent extends StatelessWidget {
  const OvoHomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'ovo',
          style: TextStyle(
            color: Color(0xFF4C2A86),
            fontSize: 28,
            fontWeight: FontWeight.w900,
            letterSpacing: -1,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 12, bottom: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: const [
                  Icon(Icons.discount, color: Color(0xFF4C2A86), size: 16),
                  SizedBox(width: 4),
                  Text(
                    'Promo',
                    style: TextStyle(
                      color: Color(0xFF4C2A86),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildOvoCard(),
            _buildInfoBanner(),
            _buildMenuTabs(),
            _buildServiceGrid(),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.purple.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  "Banner Promo / Iklan",
                  style: TextStyle(
                    color: Color(0xFF4C2A86),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildOvoCard() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Color(0xFF4C2A86), Color(0xFF6B42A1), Color(0xFF3B82F6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('OVO Cash', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  Row(
                    children: const [
                      Text('Total Saldo ', style: TextStyle(color: Colors.white70, fontSize: 12)),
                      Icon(Icons.info_outline, color: Colors.white70, size: 14),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: const [
                      Text(
                        'Tap untuk lihat',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.visibility_off, color: Colors.white, size: 18),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.stars, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text('OVO Points', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                    Icon(Icons.chevron_right, color: Colors.white, size: 16),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCardAction(Icons.add_circle_outline, 'Top Up'),
              _buildCardAction(Icons.arrow_upward_rounded, 'Transfer'),
              _buildCardAction(Icons.account_balance_wallet_outlined, 'Tarik Tunai'),
              _buildCardAction(Icons.history, 'History'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardAction(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  Widget _buildInfoBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          const Icon(Icons.verified_user_outlined, color: Color(0xFF4C2A86), size: 32),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Cek data kamu demi kelancaran pemakaian akun OVO Premier kamu.',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4C2A86),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              minimumSize: const Size(60, 30),
            ),
            child: const Text('Cek', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTabs() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('Favorit', style: TextStyle(color: Color(0xFF4C2A86), fontWeight: FontWeight.bold, fontSize: 14)),
          Text('Finansial', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14)),
          Text('Hiburan', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14)),
          Text('Pilihan Lain', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildServiceGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildServiceIcon(Icons.account_balance, 'Nabung by\nSuperbank', color: Colors.blue.shade50, iconColor: Colors.blue, badgeText: '100JT'),
              _buildServiceIcon(Icons.request_quote, 'Pinjaman', color: Colors.purple.shade50, iconColor: Colors.purple),
              _buildServiceIcon(Icons.account_balance_wallet, 'Uang\nElektronik', color: Colors.pink.shade50, iconColor: Colors.pink),
              _buildServiceIcon(Icons.credit_card, 'Angsuran\nKredit', color: Colors.orange.shade50, iconColor: Colors.orange),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildServiceIcon(Icons.phone_iphone, 'Pulsa/Paket\nData', color: Colors.lightBlue.shade50, iconColor: Colors.lightBlue, badgeText: 'PROMO'),
              _buildServiceIcon(Icons.bolt, 'PLN', color: Colors.amber.shade50, iconColor: Colors.amber, badgeText: 'PROMO'),
              _buildServiceIcon(Icons.water_drop, 'Air PDAM', color: Colors.blue.shade50, iconColor: Colors.blue),
              _buildServiceIcon(Icons.tv, 'Internet &\nTV Kabel', color: Colors.green.shade50, iconColor: Colors.green),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceIcon(IconData icon, String label, {required Color color, required Color iconColor, String? badgeText}) {
    return SizedBox(
      width: 75,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: color,
                child: Icon(icon, color: iconColor, size: 26),
              ),
              if (badgeText != null)
                Positioned(
                  top: -6,
                  right: -8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(8)),
                    child: Text(badgeText, style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, height: 1.2)),
        ],
      ),
    );
  }
}


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profil Saya',
          style: TextStyle(color: Color(0xFF4C2A86), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Informasi Akun Alfonso
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Color(0xFF4C2A86),
                    child: Text(
                      'A', // Inisial nama Alfonso
                      style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // NAMA USER
                          const Text(
                            'Alfonso',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 8),
                          // Badge OVO Premier
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.purple.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xFF4C2A86)),
                            ),
                            child: const Text(
                              'OVO Premier',
                              style: TextStyle(color: Color(0xFF4C2A86), fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '0812-3456-7890',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 12),

            // OVO Cash & Points Summary Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: const [
                      Text('OVO Cash', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      SizedBox(height: 4),
                      Text('Rp 1.250.000', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF4C2A86))),
                    ],
                  ),
                  Container(height: 30, width: 1, color: Colors.grey.shade300),
                  Column(
                    children: const [
                      Text('OVO Points', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      SizedBox(height: 4),
                      Text('24.500 PTS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.amber)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Daftar Menu Pengaturan Profil
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  _buildProfileMenuItem(Icons.person_outline, 'Ubah Profil'),
                  _buildProfileMenuItem(Icons.credit_card_outlined, 'Kartu Saya'),
                  _buildProfileMenuItem(Icons.card_giftcard_outlined, 'Kode Promo Saya'),
                  _buildProfileMenuItem(Icons.security, 'Keamanan & Biometrik'),
                  _buildProfileMenuItem(Icons.help_outline, 'Pusat Bantuan'),
                  _buildProfileMenuItem(Icons.info_outline, 'Syarat dan Ketentuan'),
                  const Divider(height: 1),
                  _buildProfileMenuItem(Icons.logout, 'Keluar', isLogout: true),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileMenuItem(IconData icon, String title, {bool isLogout = false}) {
    return ListTile(
      leading: Icon(icon, color: isLogout ? Colors.red : const Color(0xFF4C2A86)),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout ? Colors.red : Colors.black87,
          fontWeight: isLogout ? FontWeight.bold : FontWeight.normal,
          fontSize: 14,
        ),
      ),
      trailing: isLogout ? null : const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
      onTap: () {},
    );
  }
}