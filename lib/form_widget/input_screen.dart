import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/form_widget/output_screen.dart';
import 'package:project/helpers/size_helper.dart';
import 'package:project/main_layout.dart';

class BelajarForm extends StatefulWidget {
  const BelajarForm({super.key});

  @override
  State<BelajarForm> createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController namaController = TextEditingController();
  TextEditingController tglLahirController = TextEditingController();

  String _jk = "";
  String? _jkError;
  String _pilihAgama = "";

  final List<String> agama = [
    "Islam",
    "Protestan",
    "Katolik",
    "Budha",
    "Atheis",
  ];

  @override
  void initState() {
    tglLahirController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Belajar Form',
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.blueGrey,
          child: Center(
            child: SingleChildScrollView(
              child: Card(
                elevation: 4,
                margin: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Formulir Biodata",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 18),
                        TextFormField(
                          controller: namaController,
                          decoration: InputDecoration(
                            hintText: "Nama Lengkap",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) return 'Input Nama';
                            return null;
                          },
                        ),
                        const SizedBox(height: 18),

                        // Jenis Kelamin
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Jenis Kelamin",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Radio<String>(
                              value: "Laki-laki",
                              groupValue: _jk,
                              onChanged: (value) {
                                setState(() {
                                  _jk = value!;
                                  _jkError = null;
                                });
                              },
                            ),
                            Text("Laki-laki"),
                            SizedBox(width: 24),
                            Radio<String>(
                              value: "Perempuan",
                              groupValue: _jk,
                              onChanged: (value) {
                                setState(() {
                                  _jk = value!;
                                  _jkError = null;
                                });
                              },
                            ),
                            Text("Perempuan"),
                          ],
                        ),
                        if (_jkError != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              _jkError!,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        const SizedBox(height: 18),
                        TextFormField(
                          controller: tglLahirController,
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              setState(() {
                                tglLahirController.text =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                              });
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Tanggal Lahir",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) return 'Input Tanggal Lahir';
                            return null;
                          },
                        ),
                        const SizedBox(height: 18),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: "Pilih Agama",
                            border: OutlineInputBorder(),
                          ),
                          items: agama
                              .map(
                                (item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _pilihAgama = value!;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Pilih agama';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: displayWidth(context) * 0.8,
                          height: displayHeight(context) * 0.075,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                                side: BorderSide(color: Colors.black),
                              ),
                            ),
                            child: Text(
                              "Simpan",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: _submit,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (_jk.isEmpty) {
      setState(() => _jkError = 'Pilih Jenis Kelamin');
    }

    if (!isValid || _jk.isEmpty) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OutputFormScreen(
          nama: namaController.text,
          jk: _jk,
          tglLahir: tglLahirController.text,
          agama: _pilihAgama,
        ),
      ),
    );
  }
}
