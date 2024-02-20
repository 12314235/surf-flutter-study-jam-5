import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:convert';

class SharingMemeModalWindow extends StatelessWidget {
  const SharingMemeModalWindow({super.key, this.data});

  final Uint8List? data;

  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Row(
        children: [
          IconButton(onPressed: 
          () {
            
          },
          icon: const Icon(Icons.mail)),
        ],
      )
    );
  }
  
}
