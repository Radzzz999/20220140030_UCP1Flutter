import 'package:flutter/material.dart';

class DetailPiketPage extends StatelessWidget {
  final String nama;
  final DateTime tanggal;
  final String tugas;

  const DetailPiketPage({
    Key? key,
    required this.nama,
    required this.tanggal,
    required this.tugas,
  }) : super(key: key);

  