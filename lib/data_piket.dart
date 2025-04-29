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

  