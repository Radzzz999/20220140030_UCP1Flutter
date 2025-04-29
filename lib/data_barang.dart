import 'package:flutter/material.dart';
import 'package:ucp1/suscces_page.dart';

class PendataanBarangPage extends StatefulWidget {
  const PendataanBarangPage({super.key});

  @override
  State<PendataanBarangPage> createState() => _PendataanBarangPageState();
}

class _PendataanBarangPageState extends State<PendataanBarangPage> {
  final _formKey = GlobalKey<FormState>();

  final _tanggalController = TextEditingController();
  final _jumlahController = TextEditingController();
  final _hargaController = TextEditingController();

  String? jenisTransaksi;
  String? jenisBarang;

  
  final Map<String, int> hargaBarang = {
    'Makanan': 10000,
    'Minuman': 5000,
    'Lainnya': 15000,
  };

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _tanggalController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  void dispose() {
    _tanggalController.dispose();
    _jumlahController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration inputStyle(String hint) => InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFCF5F2),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Pendataan Barang'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text('Tanggal Transaksi'),
              const SizedBox(height: 5),
              TextFormField(
                controller: _tanggalController,
                readOnly: true,
                onTap: () => _selectDate(context),
                decoration: inputStyle('Tanggal Transaksi').copyWith(
                  prefixIcon: const Icon(Icons.calendar_today),
                ),
                validator: (value) => value!.isEmpty ? 'Wajib diisi' : null,
              ),
              const SizedBox(height: 15),

              
