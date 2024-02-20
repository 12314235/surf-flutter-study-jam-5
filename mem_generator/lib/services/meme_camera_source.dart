import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mem_generator/services/image_source.dart';

class MemeCameraSource implements MemeSource {
  @override
  Future<Widget> getImage() async {
    var imagePicker = ImagePicker();
    var source = await imagePicker.pickImage(source: ImageSource.camera);
    Widget img = Image.file(File(source!.path));
    return img;
  }
  
}