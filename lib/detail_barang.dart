import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SuccessPage extends StatelessWidget {
  final String tanggal;
  final String jenisTransaksi;
  final String jenisBarang;
  final int jumlahBarang;
  final int hargaSatuan;

  const SuccessPage({
    super.key,
    required this.tanggal,
    required this.jenisTransaksi,
    required this.jenisBarang,
    required this.jumlahBarang,
    required this.hargaSatuan,
  });

  @override
  Widget build(BuildContext context) {
    final int totalHarga = jumlahBarang * hargaSatuan;
    final currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ', decimalDigits: 0);

    Widget buildRow(String label, String value) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              Text(value, style: const TextStyle(fontSize: 16)),
            ],
          ),
          const Divider(height: 24, thickness: 1),
        ],
      );
    }

   