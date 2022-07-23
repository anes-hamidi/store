// ignore_for_file: deprecated_member_use, unused_import, file_names, depend_on_referenced_packages, unnecessary_new

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:set_and_get/Manager_Screen/list_products.dart';


import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class InsertProduct extends StatefulWidget {
  const InsertProduct({Key? key}) : super(key: key);

  @override
  State<InsertProduct> createState() => _InsertProductState();
}

class _InsertProductState extends State<InsertProduct> {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('products');
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _barcodeController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController prixController = TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  var Firestore = FirebaseFirestore.instance;
  void scanBarcode() async {
    String barcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Scan Barcode', false, ScanMode.DEFAULT);
    setState(() {
      _barcodeController.text = barcode;
    });
  }

  void insertData() {
    Firestore.collection('products').add({
      'name': _nameController.text,
      'purchase price': _priceController.text,
      'sale price': prixController.text,
      'description': _descriptionController.text,
      'quantity': _quantityController.text,
      'barcode': _barcodeController.text,
      'category': dropdownValue,
    });
  }

  String dropdownValue = 'Gifts';
  var items = [
    'Gifts',
    'Candies',
    'Drinks',
    'Accessories',
    'Tabac',
    'Perfume',
    'Clothes',
    'Beauty Supplies',
    'School Supplies',
    'Services'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert Product'),
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.arrowLeft, color: Colors.white),
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25.5, vertical: 20),
          children: <Widget>[
            TextForm(
              controller: _nameController,
              labelText: 'Name',
              validatorText: 'Name is required',
              hintText: 'Enter Products name',
            ),
            const SizedBox(height: 10),
            TextForm(
                controller: _descriptionController,
                labelText: 'Description',
                validatorText: 'Description is optional',
                hintText: 'Description Of Product'),
            const SizedBox(height: 10),
            PrixForm(
                controller: _priceController,
                labelText: 'Purchase Price',
                hintText: 'Enter Purchase Price',
                validatorText: 'Purchase Price is required'),
            const SizedBox(height: 10),
            PrixForm(
                controller: prixController,
                labelText: 'Selling Price',
                hintText: 'Enter Selling Price',
                validatorText: 'Selling Price is required'),
            const SizedBox(height: 10),
            PrixForm(
                controller: _quantityController,
                labelText: 'Quantity',
                hintText: 'Enter Quantity',
                validatorText: 'Quantity is required'),
            const SizedBox(height: 10),
            BarcodForm(
              controller: _barcodeController,
              labelText: 'Barcode',
              validatorText: 'Barcode is required',
            ),
            const SizedBox(height: 15),
            const Text('Category'),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.5, vertical: 20),
                      ),
                      Row(
                        children: [
                          DropdownButton(
                              itemHeight: 50,
                              value: dropdownValue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        foreground: Paint()
                                          ..color = Colors.deepOrange),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  dropdownValue = value.toString();
                                });
                              }),
                          const SizedBox(width: 35),
                          RaisedButton(
                            onPressed: () {
                              scanBarcode();
                            },
                            child: const Text('Scan Barcode'),
                          )
                        ],
                      ),
                    ],
                  ),
                ]),
            const SizedBox(height: 30),
            RaisedButton(
              child: const Text('Insert'),
              onPressed: () {
                if (_nameController.text.isNotEmpty &&
                    _priceController.text.isNotEmpty &&
                    _descriptionController.text.isNotEmpty &&
                    _quantityController.text.isNotEmpty &&
                    _barcodeController.text.isNotEmpty &&
                    prixController.text.isNotEmpty &&
                    dropdownValue.isNotEmpty) {
                  insertData();

                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Success'),
                          content: Text(
                              'Your Product has been added successfully ${_nameController.text}'),
                          actions: [
                            const Icon(Icons.check),
                            RaisedButton(
                              color: Colors.greenAccent,
                              child: const Text('Ok'),
                              onPressed: () {
                                _nameController.clear();
                                _priceController.clear();
                                _descriptionController.clear();
                                _barcodeController.clear();
                                prixController.clear();
                                _quantityController.clear();

                                dropdownValue = 'Gifts';
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      });
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: const Text('Please fill all fields'),
                          actions: [
                            const Icon(Icons.error),
                            RaisedButton(
                              color: Colors.red,
                              child: const Text('Ok'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      });
                }
              },
            ),
            const SizedBox(height: 20),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const List_Product()),
                );
              },
              child: const Text('Show Products'),
            )
          ],
        ),
      ),
    );
  }
}

class TextForm extends StatelessWidget {
  const TextForm({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.validatorText,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final String validatorText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) => value!.isEmpty ? validatorText : null,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}

class PrixForm extends StatelessWidget {
  const PrixForm({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.validatorText,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String validatorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) => value!.isEmpty ? validatorText : null,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}

class BarcodForm extends StatelessWidget {
  const BarcodForm({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.validatorText,
  }) : super(key: key);
  final TextEditingController controller;
  final String labelText;

  final String validatorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        readOnly: true,
        validator: (value) => value!.isEmpty ? validatorText : null,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}

class QuantityForm extends StatelessWidget {
  const QuantityForm({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.validatorText,
  }) : super(key: key);

  final TextEditingController controller;

  final String labelText;

  final String validatorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) => value!.isEmpty ? validatorText : null,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
