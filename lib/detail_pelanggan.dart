import 'package:flutter/material.dart';
import 'package:ucp1/home.dart';

class DetailPelangganPage extends StatelessWidget {
  final String nama;
  final String email;
  final String noHp;
  final String alamat;
  final String provinsi;
  final String kodePos;

  const DetailPelangganPage({
    super.key,
    required this.nama,
    required this.email,
    required this.noHp,
    required this.alamat,
    required this.provinsi,
    required this.kodePos,
  });

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFDF5F1),
      appBar: AppBar(
        backgroundColor: Colors.red[700],
        title: Text('Detail $nama', style: const TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            const SizedBox(height: 15),
            Text(nama, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(email),
            Text(noHp),
            const SizedBox(height: 30),

            const Align(alignment: Alignment.centerLeft, child: Text('Alamat', style: TextStyle(fontWeight: FontWeight.bold))),
            const SizedBox(height: 5),
            TextField(
              decoration: inputDecoration.copyWith(hintText: alamat),
              readOnly: true,
            ),
            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Provinsi', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      TextField(
                        decoration: inputDecoration.copyWith(hintText: provinsi),
                        readOnly: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Kode Pos', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      TextField(
                        decoration: inputDecoration.copyWith(hintText: kodePos),
                        readOnly: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[700],
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false,
                );
              },
              child: const Text('Selesai', style: TextStyle(fontSize: 16)),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
