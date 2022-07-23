// ignore_for_file: camel_case_types, non_constant_identifier_names, deprecated_member_use, file_names, unused_field, prefer_typing_uninitialized_variables, must_be_immutable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:set_and_get/Manager_Screen/InsertProduct.dart';
import 'package:set_and_get/Manager_Screen/facture.dart';
import 'package:set_and_get/themes/app_colors.dart';
import 'package:get/get.dart';
import 'slid_bar.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  final IconData _Dark = Icons.brightness_4;
  final IconData _Light = Icons.brightness_4_outlined;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store Management',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.textColor)),
        centerTitle: true,
        backgroundColor: AppColor.buttonColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: const card_view(),
      ),
      drawer: const Slid_Bare(),
    );
  }
}

class Slid_Bare extends StatelessWidget {
  const Slid_Bare({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColor.buttonColor,
            ),
            child: Text(
              'Store Management',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColor.textColor),
            ),
          ),
          ListTile(
            title: const Text('Facture'),
            leading: const Icon(Icons.receipt),
            onTap: () {
              Get.to(const Facture_Screen());
            },
          ),
          ListTile(
            title: const Text('add Product'),
            leading: const Icon(Icons.add_circle),
            onTap: () {
              Get.to(const InsertProduct());
            },
          ),
          ListTile(
            title: const Text('Home Screen'),
            leading: const Icon(Icons.home),
            onTap: () {
              Get.to(const Home_Screen());
            },
          ),
        ],
      ),
    );
  }
}

class card_view extends StatelessWidget {
  const card_view({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        mainAxisSpacing: 20,
        crossAxisCount: 3,
        children: <Widget>[
          Card(
            onTap: () {
              Get.to(const Facture_Screen());
            },
            title: 'Facture',
            title_color: AppColor.textColor,
            icon_color: AppColor.bodyColor,
            icon_size: 60,
            wdth: 135.0,
            hght: 80,
            icon: Icons.assignment,
            bhght: 115.0,
            bwdth: 110,
          ),
        ]);
  }
}

class Card extends StatelessWidget {
  Card({
    Key? key,
    required this.onTap,
    required this.wdth,
    required this.hght,
    required this.icon_color,
    required this.icon_size,
    required this.title,
    required this.icon,
    required this.title_color,
    required this.bhght,
    required this.bwdth,
  }) : super(key: key);
  Function onTap;
  double bwdth;
  double bhght;
  double wdth;
  double hght;
  Color icon_color;
  double icon_size;
  String title;
  Color title_color;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Gest_Detect_Card(
      onTap: onTap,
      wdth: wdth,
      hght: hght,
      icon_color: icon_color,
      icon_size: icon_size,
      title: title,
      title_color: title_color,
      icon: icon,
      bhght: bhght,
      bwdth: bwdth,
    );
  }
}

class Gest_Detect_Card extends StatelessWidget {
  Gest_Detect_Card({
    Key? key,
    required this.onTap,
    required this.wdth,
    required this.hght,
    required this.icon_color,
    required this.icon_size,
    required this.title,
    required this.title_color,
    required this.icon,
    required this.bhght,
    required this.bwdth,
  }) : super(key: key);

  Function onTap;
  double wdth;
  double hght;
  Color icon_color;
  double icon_size;
  String title;
  Color title_color;
  IconData icon;
  double bhght;
  double bwdth;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: wdth,
        height: hght,
        margin: const EdgeInsets.only(right: 5.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Costum_Card(
                color: title_color,
                text: title,
                bhght: bhght,
                bwdth: bwdth,
              ),
            ),
            Align_Icon_Card(
              Icon_size: icon_size,
              Icon_color: icon_color,
              icon: icon,
            ),
          ],
        ),
      ),
    );
  }
}

class Costum_Card extends StatelessWidget {
  Costum_Card({
    Key? key,
    required this.color,
    required this.text,
    required this.bhght,
    required this.bwdth,
  }) : super(key: key);
  Color color;
  String text;
  double bhght;
  double bwdth;
  @override
  Widget build(BuildContext context) {
    return Box_Card(
      text: text,
      color: color,
      bhght: bhght,
      bwdth: bwdth,
    );
  }
}

class Box_Card extends StatelessWidget {
  Box_Card({
    Key? key,
    required this.text,
    required this.color,
    required this.bwdth,
    required this.bhght,
  }) : super(key: key);

  final String text;
  final Color color;
  double bwdth;
  double bhght;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: bwdth,
      height: bhght,
      decoration: BoxDecoration(
        color: AppColor.backgroundColor,
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Align_Title(text: text, color: color),
    );
  }
}

class Align_Title extends StatelessWidget {
  const Align_Title({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, top: 10),
        child: Title_Card(
          title: text,
          title_color: color,
        ),
      ),
    );
  }
}

class Title_Card extends StatelessWidget {
  Title_Card({Key? key, required this.title, required this.title_color})
      : super(key: key);
  String title;
  Color title_color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        fontFamily: 'PlayfairDisplay',
        color: title_color,
      ),
    );
  }
}

class Align_Icon_Card extends StatelessWidget {
  Align_Icon_Card(
      {Key? key,
      required this.Icon_size,
      required this.Icon_color,
      required this.icon})
      : super(key: key);
  double Icon_size;
  Color Icon_color;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Icon(
        icon,
        color: Icon_color,
        size: Icon_size,
      ),
    );
  }
}
