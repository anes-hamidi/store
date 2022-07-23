// ignore_for_file: deprecated_member_use, file_names, must_be_immutable, camel_case_types, avoid_unnecessary_containers


import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      body: home(titles: ' Home Page'),
      bottomNavigationBar: BottomAppBar(
        // ignore: prefer_const_constructors
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 70.0,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {}),
        tooltip: 'عمليات البيع',
        child: const Icon(Icons.currency_exchange),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class home extends StatelessWidget {
  home({Key? key, required this.titles}) : super(key: key);
  String titles;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       
      },
      child: Container(
        child: const Center(
          
        ),
      ),
    );
  }
}
