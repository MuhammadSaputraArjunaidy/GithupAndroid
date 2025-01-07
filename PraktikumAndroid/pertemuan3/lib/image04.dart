import 'package:flutter/material.dart';

class Image04 extends StatelessWidget {
  const Image04({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar dari URL'),
      ),
      body: SingleChildScrollView( // Agar konten dapat digulir
        child: Column(
          children: [
            buildImageCard('https://i.pinimg.com/736x/46/d8/62/46d86218e84e2ea115a865ad21bd8a47.jpg'),
            buildImageCard('https://cdn.idntimes.com/content-images/community/2023/08/2096592-cropped-59605fbaa688d4f7a17cc45ea5d328d-1c1447a94379d5f8b3f5b8a0557e6990_600x400.jpg'),
            buildImageCard('https://akcdn.detik.net.id/community/media/visual/2023/09/26/tobirama-senju-47f8ff5774a435e75edd0d5e9e9a5d9b.jpg'),
            buildImageCard('https://cdn.idntimes.com/content-images/community/2023/08/2096592-cropped-59605fbaa688d4f7a17cc45ea5d328d-1c1447a94379d5f8b3f5b8a0557e6990_600x400.jpg'),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun kotak gambar
  Widget buildImageCard(String imageUrl) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Sudut melengkung
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10), // Sudut melengkung untuk gambar
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover, // Menastkan gambar penuh di dalam kontainer
          height: 150.0, // Tinggi kontainer
          width: double.infinity, // lebar penuh
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
          },
          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
            return Center(
              child: const Text('Gagal memuat gambar'),
            );
          },
        ),
      ),
    );
  }
}
