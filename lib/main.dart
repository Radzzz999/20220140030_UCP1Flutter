import 'package:flutter/material.dart';
import 'package:ucp1/data_barang.dart';
import 'package:ucp1/data_pelanggan.dart';
import 'package:ucp1/data_piket.dart';
import 'package:ucp1/home.dart';
import 'package:ucp1/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/piket': (context) => const PiketGudangPage(),
        '/pelanggan': (context) => const DataPelangganPage(),
        '/barang': (context) => const PendataanBarangPage(),
      },
    );
  }
}
