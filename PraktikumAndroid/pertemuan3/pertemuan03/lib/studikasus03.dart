import 'package:flutter/material.dart';

class StudiKasus03 extends StatefulWidget {
  const StudiKasus03({super.key});

  @override
  State<StudiKasus03> createState() => _StudiKasus03State();
}

class _StudiKasus03State extends State<StudiKasus03> {
  String? pilihan;
  String? url;
  final List<String> hokage = ['Hokage 1', 'Hokage 2', 'Hokage 3', 'Hokage 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pimpinan'),
      ),
      body: Center(
        child: Column(
          children: [
            DropdownButton<String>(
              hint: const Text('Pilih Item'),
              value: pilihan,
              onChanged: (String? pilihannya) {
                setState(() {
                  pilihan = pilihannya; // Set item yang dipilih
                  if (pilihan == 'Hokage 1') {
                    url = 'https://i.pinimg.com/736x/6e/dd/1d/6edd1df7951ba9e92050308f2a36620b.jpg';
                  } else if (pilihan == 'Hokage 2') {
                    url = 'https://i.pinimg.com/736x/49/24/2d/49242ddca42465e89f09d77d18aab699.jpg';
                  } else if (pilihan == 'Hokage 3') {
                    url = 'https://i.pinimg.com/736x/43/c6/36/43c636a2be8967ac27c71f7fbc725b7c.jpg';
                  } else if (pilihan == 'Hokage 4') {
                    url = 'https://i.pinimg.com/736x/7e/3f/a8/7e3fa87d62ccc2da4cfb509104b87129.jpg';
                  }
                });
              },
              items: hokage.map<DropdownMenuItem<String>>((String isi) {
                return DropdownMenuItem<String>(
                  value: isi,
                  child: Text(isi),
                );
              }).toList(),
            ),
            if (url != null) buildImageCard(url!),
          ],
        ),
      ),
    );
  }

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
          fit: BoxFit.cover, // Penataan gambar penuh di dalam kontainer
          height: 250.0, // Tinggi kontainer
          width: double.infinity, // Lebar penuh
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
            return const Center(child: Text('Gagal memuat gambar'));
          },
        ),
      ),
    );
  }
}
