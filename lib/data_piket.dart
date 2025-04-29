import 'package:flutter/material.dart';
import 'package:ucp1/detail_piket';

class PiketGudangPage extends StatefulWidget {
  const PiketGudangPage({Key? key}) : super(key: key);

  @override
  _PiketGudangPageState createState() => _PiketGudangPageState();
}

class _PiketGudangPageState extends State<PiketGudangPage> {
  final TextEditingController _namaController = TextEditingController(text: 'Admin');
  final TextEditingController _tugasController = TextEditingController();
  DateTime? _selectedDate;

  List<Map<String, dynamic>> tugasList = [];

  bool _isTugasError = false;
  bool _isTanggalError = false;

  void _addTugas() {
    setState(() {
      _isTugasError = _tugasController.text.isEmpty;
      _isTanggalError = _selectedDate == null;
    });

    if (!_isTugasError && !_isTanggalError) {
      setState(() {
        tugasList.add({
          'nama': _namaController.text,
          'tanggal': _selectedDate,
          'tugas': _tugasController.text,
        });
        _tugasController.clear();
        _selectedDate = null;
        _isTugasError = false;
        _isTanggalError = false;
      });
    }
  }

  String _formatTanggal(DateTime tanggal) {
    final List<String> hari = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'];
    final List<String> bulan = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];
    return '${hari[tanggal.weekday - 1]}, ${tanggal.day} ${bulan[tanggal.month - 1]} ${tanggal.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF8F5),
      appBar: AppBar(
        title: const Text('Piket Gudang'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nama Anggota', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            TextField(
              controller: _namaController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.white,
              ),
              readOnly: true,
            ),
            const SizedBox(height: 20),
            const Text('Pilih Tanggal', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null) {
                  setState(() {
                    _selectedDate = picked;
                    _isTanggalError = false;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 20),
                    const SizedBox(width: 10),
                    Text(
                      _selectedDate == null
                          ? 'Pilih Tanggal'
                          : _formatTanggal(_selectedDate!),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            if (_isTanggalError)
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'Tanggal harus dipilih',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            const SizedBox(height: 20),
            const Text('Tugas Piket', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      TextField(
                        controller: _tugasController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Masukkan Tugas',
                        ),
                        onChanged: (_) {
                          if (_isTugasError) {
                            setState(() {
                              _isTugasError = false;
                            });
                          }
                        },
                      ),
                      if (_isTugasError)
                        const Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Tugas tidak boleh kosong',
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addTugas,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Tambah'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'Daftar Tugas Piket',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: tugasList.isEmpty
                  ? const Center(child: Text('Belum ada Data'))
                  : ListView.builder(
                      itemCount: tugasList.length,
                      itemBuilder: (context, index) {
                        final tugas = tugasList[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPiketPage(
                                  nama: tugas['nama'],
                                  tanggal: tugas['tanggal'],
                                  tugas: tugas['tugas'],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  tugas['tugas'],
                                  style: const TextStyle(color: Colors.white, fontSize: 16),
                                ),
                                const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
