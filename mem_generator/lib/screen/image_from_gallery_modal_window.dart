import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mem_generator/screen/custom_widgets/button.dart';
import 'package:mem_generator/screen/meme_generator_screen.dart';
import 'package:mem_generator/services/image_gallery_source.dart';
import 'package:mem_generator/services/meme_camera_source.dart';

class ImageFromGalleryModalWindow extends StatelessWidget {
  final MemeGeneratorScreenState parent;
  final ImagePicker imagePicker = ImagePicker();

  ImageFromGalleryModalWindow({super.key, required this.parent});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: MyButton(
              onPressed: () {
                parent.changeImageSource(MemeGallerySource());
                Navigator.pop(context);
              },
              text: 'Выбрать фото',
            ),
          ),
          Expanded(
            child: MyButton(
              onPressed: () {
                parent.changeImageSource(MemeCameraSource());
                Navigator.pop(context);
              },
              text: 'Сделать фото',
            ),
          ),
        ],
      )
    );
  }
  
}
