// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Slid_Bar extends StatefulWidget {
  const Slid_Bar({Key? key}) : super(key: key);

  @override
  State<Slid_Bar> createState() => _Slid_BarState();
}

class _Slid_BarState extends State<Slid_Bar> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(top: 40),
      width: 240,
      height: double.infinity,
      decoration:const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(
              0.0,
              10.0,
            ),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(
                
              );
            
            },
          ),
         
            
        ],
      ),
    );
  }
}
