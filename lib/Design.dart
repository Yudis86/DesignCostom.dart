import 'package:flutter/material.dart';

class Design extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ProfilePage(), // Halaman Profil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E WALLET'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Tambahkan aksi notifikasi di sini
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Banner saldo OVO
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.purple,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Saldo Anda',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      'Rp 100.000',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Icon(Icons.account_balance_wallet,
                    color: Colors.white, size: 40),
              ],
            ),
          ),

          // Grid menu utama
          Padding(
            padding: EdgeInsets.all(16),
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: [
                _buildMenuItem(Icons.send, 'Transfer'),
                _buildMenuItem(Icons.qr_code, 'Scan'),
                _buildMenuItem(Icons.payment, 'Pay'),
                _buildMenuItem(Icons.receipt, 'Bills'),
                _buildMenuItem(Icons.mobile_friendly, 'Pulsa'),
                _buildMenuItem(Icons.local_atm, 'Top Up'),
                _buildMenuItem(Icons.history, 'History'),
                _buildMenuItem(Icons.more_horiz, 'More'),
              ],
            ),
          ),

          // Promo banner
          Container(
            margin: EdgeInsets.all(16),
            height: 200,
            child: Image.network(
              'assets/th (8).png',
              fit: BoxFit.cover,
            ),
          ),

          // List item promo
          ListTile(
            leading: Icon(Icons.local_offer, color: Colors.purple),
            title: Text('Promo Hari Ini'),
            subtitle: Text('Diskon dan cashback menarik untuk Anda'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Tambahkan aksi promo di sini
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.purple.withOpacity(0.1),
          child: Icon(icon, color: Colors.purple),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

// Halaman Profil
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 32),
          // Avatar
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.purple,
            child: Icon(
              Icons.person,
              size: 50,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          // Nama dan Email
          Text(
            'Nama Pengguna',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'email@contoh.com',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 32),
          // Tombol Aksi
          ListTile(
            leading: Icon(Icons.settings, color: Colors.purple),
            title: Text('Pengaturan Akun'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Aksi pengaturan
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.purple),
            title: Text('Keluar'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Aksi keluar/log out
            },
          ),
        ],
      ),
    );
  }
}
