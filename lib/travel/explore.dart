import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:aspen_project/card.dart';  // Import widget card
import 'package:aspen_project/data/data_travel.dart';  // Import file data

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String searchQuery = '';
  int _selectedIndex = 0;

  // Daftar URL gambar untuk carousel destinasi
  final List<String> imageUrls = [
    'assets/images/rajaampat2.jpg',
    'assets/images/borobudur2.jpg',
    'assets/images/bromo2.jpg',
    'assets/images/ijen2.jpg',
    'assets/images/komodo2.jpeg',
    'assets/images/kuta2.jpg',
    'assets/images/toba2.jpg',
  ];

  // Daftar URL gambar untuk iklan
  final List<String> adImageUrls = [
    'assets/images/des1.jpeg', // Gambar iklan 1
    'assets/images/des2.jpg', // Gambar iklan 2
    'assets/images/des3.jpg', // Gambar iklan 3
  ];

  // Data contoh untuk postingan di halaman profile
  final List<String> posts = [
    'assets/images/post1.jpg',
    'assets/images/post2.jpg',
    'assets/images/post3.jpg',
    'assets/images/post4.jpg',
    'assets/images/post5.jpg',
    'assets/images/post6.jpg',
  ];

  // Method untuk update ketika item di navbar diklik
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Filter destinasi berdasarkan input pencarian
    List<Destination> filteredDestinations = destinations
        .where((destination) =>
            destination.title.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Epen'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: IndexedStack(
        index: _selectedIndex, // Menampilkan halaman berdasarkan index
        children: [
          // Halaman Home dengan konten Explore
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Search Bar
                TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value; // Update pencarian setiap kali ada input
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search destination...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 20),

                // Carousel untuk iklan dengan border radius
                CarouselSlider(
                  options: CarouselOptions(
                    height: 150, // Tinggi untuk iklan
                    autoPlay: true, // Autoplay carousel
                    autoPlayInterval: Duration(seconds: 3), // Interval untuk ganti gambar
                    viewportFraction: 1.0, // Mengisi seluruh tampilan
                    enableInfiniteScroll: true, // Infinite loop
                  ),
                  items: adImageUrls.map((adImageUrl) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10), // Margin tetap diatur
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16), // Berikan border radius
                        color: Colors.grey[300],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16), // Terapkan border radius pada gambar
                        child: Image.asset(
                          adImageUrl, // Gambar dari daftar URL
                          fit: BoxFit.cover, // Pastikan gambar menutupi seluruh container
                          width: MediaQuery.of(context).size.width, // Lebar penuh sesuai layar
                        ),
                      ),
                    );
                  }).toList(),
                ),

                // Jarak tambahan antara iklan dan konten
                SizedBox(height: 20), // Menambah jarak di sini

                // Menampilkan destinasi yang difilter
                filteredDestinations.isNotEmpty
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal, // Scroll horizontal
                        child: Row(
                          children: List.generate(
                            filteredDestinations.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Container(
                                width: 250, // Lebar card lebih besar
                                height: 250, // Tinggi card lebih besar
                                child: DestinationCard(
                                  destination: filteredDestinations[index], // Memanggil widget card untuk tiap destinasi
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: Text('No destinations found'), // Jika tidak ada hasil pencarian
                      ),

                // Judul untuk Carousel Destinasi
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Destinations Gallery',  // Judul Carousel
                    style: TextStyle(
                      fontSize: 20, // Ukuran font
                      fontWeight: FontWeight.bold, // Bold
                    ),
                  ),
                ),

                // Infinite carousel dengan gambar kecil di bawah destinasi
                SizedBox(height: 10),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 100, // Tinggi gambar carousel lebih besar
                    autoPlay: true, // Autoplay carousel
                    autoPlayInterval: Duration(seconds: 2),
                    viewportFraction: 0.5, // Fraksi tampilan untuk gambar kecil lebih besar
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                    disableCenter: true, // Nonaktifkan klik
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    enableInfiniteScroll: true, // Infinite loop
                  ),
                  items: imageUrls.map((imageUrl) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[300],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          imageUrl, // Gambar dari daftar URL
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          // Halaman Bookmark
          Center(child: Text('Belum ada yang di Like')),

          // Halaman Profile
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                // Foto profil, nama, dan bio singkat
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/profile.jpg'), // Ganti dengan path gambar profil
                ),
                SizedBox(height: 10),
                Text(
                  "Bagas Fauzan Nafi'(Epen)",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'Software Engineer',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 20),

                // Grid untuk menampilkan postingan
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                    shrinkWrap: true, // Supaya grid bisa scroll di dalam SingleChildScrollView
                    physics: NeverScrollableScrollPhysics(), // Nonaktifkan scroll pada grid
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Jumlah kolom
                      crossAxisSpacing: 5, // Jarak horizontal
                      mainAxisSpacing: 5, // Jarak vertikal
                      childAspectRatio: 1, // Aspek rasio persegi
                    ),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(posts[index]), // Menampilkan gambar dari list
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navbar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Liked',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
