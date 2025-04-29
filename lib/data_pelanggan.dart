import 'package:flutter/material.dart';
import 'package:ucp1/detail_pelanngan.dart';

class DataPelangganPage extends StatefulWidget {
  const DataPelangganPage({super.key});

  @override
  State<DataPelangganPage> createState() => _DataPelangganPageState();
}

class _DataPelangganPageState extends State<DataPelangganPage> {
  final _formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final noHpController = TextEditingController();
  final alamatController = TextEditingController();
  final provinsiController = TextEditingController();
  final kodePosController = TextEditingController();

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    noHpController.dispose();
    alamatController.dispose();
    provinsiController.dispose();
    kodePosController.dispose();
    super.dispose();
  }

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
        title: const Text('Data Pelanggan', style: TextStyle(fontWeight: FontWeight.bold)),
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
              const Text('Nama Cust', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              TextFormField(
                controller: namaController,
                decoration: inputDecoration.copyWith(hintText: 'Nama Cust'),
                validator: (value) => value == null || value.isEmpty ? 'Nama tidak boleh kosong' : null,
              ),
              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: emailController,
                          decoration: inputDecoration.copyWith(hintText: 'Email'),
                          validator: (value) => value == null || value.isEmpty ? 'Email tidak boleh kosong' : null,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('No Hp', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: noHpController,
                          decoration: inputDecoration.copyWith(hintText: 'No Hp'),
                          validator: (value) => value == null || value.isEmpty ? 'No HP tidak boleh kosong' : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              const Text('Alamat', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              TextFormField(
                controller: alamatController,
                decoration: inputDecoration.copyWith(hintText: 'Alamat'),
                validator: (value) => value == null || value.isEmpty ? 'Alamat tidak boleh kosong' : null,
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
                        TextFormField(
                          controller: provinsiController,
                          decoration: inputDecoration.copyWith(hintText: 'Provinsi'),
                          validator: (value) => value == null || value.isEmpty ? 'Provinsi tidak boleh kosong' : null,
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
                        TextFormField(
                          controller: kodePosController,
                          decoration: inputDecoration.copyWith(hintText: 'Kode Pos'),
                          validator: (value) => value == null || value.isEmpty ? 'Kode Pos tidak boleh kosong' : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[700],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPelangganPage(
                          nama: namaController.text,
                          email: emailController.text,
                          noHp: noHpController.text,
                          alamat: alamatController.text,
                          provinsi: provinsiController.text,
                          kodePos: kodePosController.text,
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Simpan', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 15),

              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () {
                  namaController.clear();
                  emailController.clear();
                  noHpController.clear();
                  alamatController.clear();
                  provinsiController.clear();
                  kodePosController.clear();
                },
                child: const Text('Reset', style: TextStyle(color: Colors.red, fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
