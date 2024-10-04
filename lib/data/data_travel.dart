class Destination {
  final String title;
  final String description;
  final List<String> imageUrl; // Change from String to List<String>
  final double price;
  bool isLiked;

  Destination({
    required this.title,
    required this.description,
    required this.imageUrl, // Change from String to List<String>
    required this.price,
    this.isLiked = false
  });
}

List<Destination> destinations = [
  Destination(
    title: 'Danau Toba',
    description: 'Danau Toba adalah danau vulkanik terbesar di Indonesia dan salah satu destinasi wisata populer di Sumatra Utara, dengan Pulau Samosir di tengahnya.',
    imageUrl: ['assets/images/toba1.jpeg', 'assets/images/toba2.jpg', 'assets/images/toba3.jpg'],
    price: 120,
  ),
  Destination(
    title: 'Raja Ampat',
    description: 'Raja Ampat adalah surga bawah laut yang terletak di Papua Barat, terkenal dengan keanekaragaman hayati lautnya dan keindahan pulau-pulau kecil yang menyebar di seluruh wilayahnya.',
    imageUrl: ['assets/images/rajaampat1.jpg', 'assets/images/rajaampat2.jpg', 'assets/images/rajaampat3.jpg'],
    price: 250,
  ),
  Destination(
    title: 'Candi Borobudur',
    description: 'Candi Borobudur merupakan candi Buddha terbesar di dunia yang terletak di Magelang, Jawa Tengah, dan merupakan salah satu keajaiban dunia yang terkenal dengan stupa dan reliefnya.',
    imageUrl: ['assets/images/borobudur1.jpg', 'assets/images/borobudur2.jpg', 'assets/images/borobudur3.webp'],
    price: 180,
  ),
  Destination(
    title: 'Gunung Bromo',
    description: 'Gunung Bromo adalah salah satu gunung berapi aktif di Jawa Timur yang menawarkan pemandangan matahari terbit yang menakjubkan dan lautan pasir yang luas.',
    imageUrl: ['assets/images/bromo1.jpeg', 'assets/images/bromo2.jpg', 'assets/images/bromo3.jpg'],
    price: 200,
  ),
  Destination(
    title: 'Pantai Kuta',
    description: 'Pantai Kuta adalah salah satu pantai paling terkenal di Bali, populer dengan ombaknya yang cocok untuk berselancar dan pemandangan matahari terbenam yang menawan.',
    imageUrl: ['assets/images/kuta1.jpg', 'assets/images/kuta2.jpg', 'assets/images/kuta3.jpg'],
    price: 100,
  ),
  Destination(
    title: 'Taman Nasional Komodo',
    description: 'Taman Nasional Komodo terletak di Nusa Tenggara Timur dan terkenal sebagai habitat asli komodo, kadal terbesar di dunia, serta menawarkan keindahan bawah laut yang luar biasa.',
    imageUrl: ['assets/images/komodo1.jpg', 'assets/images/komodo2.jpeg', 'assets/images/komodo3.webp'],
    price: 220,
  ),
  Destination(
    title: 'Kawah Ijen',
    description: 'Kawah Ijen adalah kawah gunung berapi yang terletak di Banyuwangi, Jawa Timur, terkenal dengan fenomena api biru yang langka dan pemandangan kawah belerangnya yang menakjubkan.',
    imageUrl: ['assets/images/ijen1.jpg', 'assets/images/ijen2.jpg', 'assets/images/ijen3.jpg'],
    price: 140,
  ),
  // Add more destinations here...
];