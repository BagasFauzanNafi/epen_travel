import 'package:aspen_project/travel/explore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/welcome.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay Text and Button
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Mengurangi jarak untuk mengangkat teks "Aspen" lebih tinggi
                SizedBox(height: 30), // Jarak di atas teks "Aspen"
                Align(
                  alignment: Alignment.topCenter, // Meratakan teks "Aspen" di tengah atas
                  child: Text(
                    'Epen',
                    style: GoogleFonts.kaushanScript(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20), // Jarak antara "Aspen" dan teks berikutnya
                // Menyimpan teks dan tombol di posisi sebelumnya
                Expanded(child: Container()), // Untuk mendorong konten ke bawah
                Text(
                  'Plan your Luxurious Vacation',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExplorePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    'Explore',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
