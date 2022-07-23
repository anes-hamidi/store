// ignore_for_file: camel_case_types, avoid_unnecessary_containers, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:set_and_get/Manager_Screen/list_products.dart';

class Facture_Screen extends StatefulWidget {
  const Facture_Screen({Key? key}) : super(key: key);

  @override
  State<Facture_Screen> createState() => _Facture_ScreenState();
}

class _Facture_ScreenState extends State<Facture_Screen> {
  List purchases = [];

  @override
  void initState() {
    super.initState();
    fetchDataBaseList();
  }

  get total => purchases.length;

  fetchDataBaseList() async {
    dynamic data = await Products_List().getProduct();
    setState(() {
      purchases = data;
    });
  }

  void scanBarcode() async {
    String barcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Scan Barcode', false, ScanMode.DEFAULT);
    setState(() {
      fetchDataBaseList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.takeout_dining_rounded, color: Colors.white),
            onPressed: () {
              setState(() {
                purchases.clear();
              });
            },
          ),
        ],
        title: const Text('Product List'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(4, 28, 50, 86),
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: purchases.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('Delete'),
                              content: Text(
                                  'Are you sure you want to delete this item?'),
                              actions: [
                                FlatButton(
                                  child: Text('Yes'),
                                  onPressed: () {
                                    setState(() {
                                      purchases.removeAt(index);
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                FlatButton(
                                  child: Text('No'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ));
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 143, 142, 142),
                          blurRadius: 20,
                          spreadRadius: 1,
                          offset: Offset(5, 10),
                        ),
                      ],
                    ),
                    child: Card(
                      child: ListTile(
                        title: Text(purchases[index]['name']),
                        subtitle: Text(purchases[index]['description']),
                        trailing: Text(
                          purchases[index]['sale price'],
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        // ignore: prefer_const_constructors
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            SizedBox(
              height: 70.0,
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  Container(
                    child: Text(
                      'مجموع المنتجات: $total',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 120.0,
                  ),
                  Container(
                    child: const Text(
                      'دينار ',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          fetchDataBaseList();
        }),
        tooltip: 'تحرير',
        child: const Icon(Icons.upload_file_rounded),
      ),
    );
  }
}

// fetch data from collection products with scan barcode and add to list
class Products_List {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('products');
  Future getProduct() async {
    List itemsList = [];

    final barcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Scan Barcode', false, ScanMode.DEFAULT);
    await collectionReference
        .where('barcode', isEqualTo: barcode)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((Element) {
        itemsList.add(Element.data());
      });
    });

    return itemsList;
  }
}
// create widget for calculate total price of products and show in dialog

