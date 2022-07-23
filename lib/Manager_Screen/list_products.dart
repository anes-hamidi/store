// ignore_for_file: camel_case_types, avoid_unnecessary_containers, avoid_types_as_parameter_names, avoid_function_literals_in_foreach_calls, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:set_and_get/Manager_Screen/InsertProduct.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class List_Product extends StatefulWidget {
  const List_Product({Key? key}) : super(key: key);

  @override
  State<List_Product> createState() => _List_ProductState();
}

class _List_ProductState extends State<List_Product> {
  List products = [];
  @override
  void initState() {
    super.initState();
    fetchDataBaseList();
  }

  fetchDataBaseList() async {
    dynamic data = await Products_List().getProducts();

    setState(() {
      products = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InsertProduct(),
                ),
              );
            },
          ),
        ],
        title: const Text('Product List'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(4, 28, 50, 86),
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Card(
                  child: ListTile(
                    title: Text(products[index]['name']),
                    subtitle: Text(products[index]['description']),
                    leading: const CircleAvatar(
                      child: Image(image: AssetImage('images/logo.png')),
                    ),
                    trailing: Text(products[index]['sale price']),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class Products_List {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('products');
  Future getProducts() async {
    List itemsList = [];
    
      await collectionReference.get().then((querySnapshot) {
        querySnapshot.docs.forEach((Element) {
          itemsList.add(Element.data());
        });
      });
      return itemsList;
   
  }
}
