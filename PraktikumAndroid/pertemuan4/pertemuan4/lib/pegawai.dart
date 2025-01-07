import 'package:flutter/material.dart';
import 'gaji.dart';
import 'slipgaji.dart';

class Pegawai extends StatefulWidget {
  const Pegawai({super.key});

  @override
  State<Pegawai> createState() => _PegawaiState();
}

class _PegawaiState extends State<Pegawai> {
  String _nip = '';
  String _nama = '';
  String? _pilihanGolongan;
  String? _pilihanStatus;
  final TextEditingController nipController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController masaController = TextEditingController();
  var salary = Gaji();
  final List<String> golongan = ['I', 'II', 'III', 'IV'];
  final List<String> status = ['Menikah', 'Belum Menikah'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gaji Pegawai'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: [
          // NIP Pegawai
          TextField(
            controller: nipController,
            decoration: const InputDecoration(labelText: 'NIP Pegawai'),
            onChanged: (value) {
              setState(() {
                _nip = value;
              });
            },
          ),
          
          // Nama Pegawai
          TextField(
            controller: namaController,
            decoration: const InputDecoration(labelText: 'Nama Pegawai'),
            onChanged: (value) {
              setState(() {
                _nama = value;
              });
            },
          ),
          
          // Dropdown Golongan
          DropdownButton<String>(
            hint: const Text('Golongan Pegawai'),
            value: _pilihanGolongan,
            onChanged: (String? value) {
              setState(() {
                _pilihanGolongan = value;
                salary.setGolongan(value);
              });
            },
            items: golongan.map<DropdownMenuItem<String>>((String gol) {
              return DropdownMenuItem<String>(
                value: gol,
                child: Text(gol),
              );
            }).toList(),
          ),
          
          // Dropdown Status Pegawai
          DropdownButton<String>(
            hint: const Text('Status Pegawai'),
            value: _pilihanStatus,
            onChanged: (String? value) {
              setState(() {
                _pilihanStatus = value;
                salary.setStatus(value);
              });
            },
            items: status.map<DropdownMenuItem<String>>((String sts) {
              return DropdownMenuItem<String>(
                value: sts,
                child: Text(sts),
              );
            }).toList(),
          ),
          
          // Jumlah Masa Kerja
          TextField(
            controller: masaController,
            decoration: const InputDecoration(labelText: 'Jumlah Masa Kerja dalam Tahun'),
            onChanged: (value) {
              setState(() {
                salary.setMasaKerja(int.tryParse(value) ?? 0);
              });
            },
          ),
          
          // Button Hitung Gaji
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Slipgaji(
                    nip: _nip,
                    nama: _nama,
                    tunjGol: salary.tunjGapok(),
                    tunjStatus: salary.tunjStatus(),
                    tunjMasaKerja: salary.tunjMasaKerja(),
                    gajiTotal: salary.gajiTotal(),
                  ),
                ),
              );
            },
            child: const Text('Hitung Gaji'),
          ),
        ],
      ),
    );
  }
}
