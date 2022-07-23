// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:set_and_get/themes/app_colors.dart';
import 'package:spring/spring.dart';

class card_client extends StatelessWidget {
  card_client({Key? key}) : super(key: key);
  final SpringController springController = SpringController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.buttonColor,
        appBar: AppBar(
          title: Text('Client List'),
          centerTitle: true,
          backgroundColor: AppColor.appBarColor,
        ),
        body: Container(
          child: GestureDetector(
            onTap:(){
              springController.play(motion: Motion.reverse);
            
            },
            child: Spring.animatedCard(
              fromWidth: 20,
             toWidth: 170, 
             fromHeight: 20,
              toHeight: 150,
               child: const ListTile(
                leading: Icon(Icons.person),
                title: Text('Client Name'),
                subtitle: Text('Client Address'),

               ),
        ),
            ),
        ),
        );
  }
}
