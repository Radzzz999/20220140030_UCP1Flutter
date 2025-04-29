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

  