import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mem_generator/screen/custom_widgets/button.dart';
import 'package:mem_generator/screen/image_from_gallery_modal_window.dart';
import 'package:mem_generator/screen/main_screen_image_inherited.dart';
import 'package:mem_generator/screen/meme_generator_screen.dart';
import 'package:mem_generator/screen/modal_window.dart';
import 'package:mem_generator/services/image_gallery_source.dart';

import 'change_text_modal_window.dart';

class DemotivatorSettingsModalWindow extends StatelessWidget {
  const DemotivatorSettingsModalWindow({super.key, required this.parent});

  final MemeGeneratorScreenState parent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Настройки демотиватора',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          color: Colors.black,
          child: ListView(
            children: [
              MyButton(
                text: 'Выбрать картинку из галлереи',
                onPressed: () {
                  showBottomSheet(
                    context: context,
                    builder: (context) {
                      return ImageFromGalleryModalWindow(parent: parent);
                    },
                  );
                },
              ),
              MyButton(
                text: 'Загрузить картинку по ссылке',
                onPressed: () {
                  showBottomSheet(
                    context: context,
                    builder: (context) {
                      return ImageFromUrlModalWindow(parent: parent);
                    },
                  );
                },
              ),
              MyButton(
                text: 'Изменить текст картинки',
                onPressed: () {
                  showBottomSheet(
                    context: context,
                    builder: (context) {
                      return ChangeTextModalWindow(parent: parent);
                    },
                  );
                },
              ),
              MyButton(
                text: 'Поделиться',
                onPressed: () {
                  parent.screenshotAndShare();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ));
  }
}
