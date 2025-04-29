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

  