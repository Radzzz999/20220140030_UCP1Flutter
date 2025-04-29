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

              DropdownButtonFormField<String>(
                value: jenisTransaksi,
                decoration: inputStyle('Jenis Transaksi'),
                items: ['Beli', 'Jual'].map((item) {
                  return DropdownMenuItem(value: item, child: Text(item));
                }).toList(),
                onChanged: (val) => setState(() => jenisTransaksi = val),
                validator: (value) => value == null ? 'Pilih jenis transaksi' : null,
              ),
              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
                value: jenisBarang,
                decoration: inputStyle('Jenis Barang'),
                items: ['Makanan', 'Minuman', 'Lainnya'].map((item) {
                  return DropdownMenuItem(value: item, child: Text(item));
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    jenisBarang = val;
                    if (val != null && hargaBarang.containsKey(val)) {
                      _hargaController.text = hargaBarang[val]!.toString();
                    }
                  });
                },
                validator: (value) => value == null ? 'Pilih jenis barang' : null,
              ),
              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Jumlah Barang'),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: _jumlahController,
                          keyboardType: TextInputType.number,
                          decoration: inputStyle('Jumlah Barang'),
                          validator: (value) => value!.isEmpty ? 'Wajib diisi' : null,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Harga Satuan'),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: _hargaController,
                          readOnly: true,
                          keyboardType: TextInputType.number,
                          decoration: inputStyle('Harga Satuan').copyWith(
                            prefixText: 'Rp. ',
                          ),
                          validator: (value) => value!.isEmpty ? 'Wajib diisi' : null,
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
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SuccessPage(
                            tanggal: _tanggalController.text,
                            jenisTransaksi: jenisTransaksi!,
                            jenisBarang: jenisBarang!,
                            jumlahBarang: int.parse(_jumlahController.text),
                            hargaSatuan: int.parse(_hargaController.text),
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
