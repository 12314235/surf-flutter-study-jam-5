import 'package:flutter/material.dart';
import 'package:mem_generator/screen/custom_widgets/button.dart';
import 'package:mem_generator/screen/meme_generator_screen.dart';

class ChangeTextModalWindow extends StatelessWidget {
  ChangeTextModalWindow({required this.parent, super.key});

  final TextEditingController _textEditingController = TextEditingController();
  final MemeGeneratorScreenState parent;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
          children: [
            Expanded(
              child: TextFormField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                    isDense: true,
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      )
                    ),
                    border: OutlineInputBorder(), hintText: 'Введите текст',
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
                    parent.changeText(_textEditingController.value.text);
                    Navigator.pop(context);
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
