import 'package:flutter/material.dart';
import 'package:mem_generator/screen/custom_widgets/button.dart';
import 'package:mem_generator/screen/meme_generator_screen.dart';

class ImageFromUrlModalWindow extends StatelessWidget {
  ImageFromUrlModalWindow({required this.parent, super.key});

  final TextEditingController _textEditingController = TextEditingController();
  final _validationKey = GlobalKey<FormState>();
  final MemeGeneratorScreenState parent;

  bool _isValidUrl(String? url) {
    return url == null ? false : Uri.parse(url).isAbsolute;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
          children: [
            Expanded(
              child: TextFormField(
                key: _validationKey,
                controller: _textEditingController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if(_isValidUrl(value)) {
                    return "";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                    isDense: true,
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      )
                    ),
                    border: OutlineInputBorder(), hintText: 'Enter URL',
                    hintStyle: TextStyle(color: Colors.white)),
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                child: MyButton(
                  onPressed: () {
                      if(_isValidUrl(_textEditingController.value.text)) {
                        parent.changeUrl(_textEditingController.value.text);
                        Navigator.pop(context);
                      } else if(_validationKey.currentState == null) {
                        Navigator.pop(context);
                      } else {
                        _validationKey.currentState?.validate();
                      }
                    },
                  text: 'Загрузить',
                )
              ),
            ),
          ],
        ),
    );
  }
}