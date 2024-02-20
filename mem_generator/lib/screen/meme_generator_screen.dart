import 'package:flutter/material.dart';

class MemeGeneratorScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  MemeGeneratorScreen({Key? key}) : super(key: key);

  void _showOrHide() {
      _scaffoldKey.currentState!.showBottomSheet(
        (_) => const ModalWindow(),
      );
  }

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      border: Border.all(
        color: Colors.white,
        width: 2,
      ),
    );
    return Scaffold(
      key: _scaffoldKey,
      body: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: ColoredBox(
            color: Colors.black,
            child: DecoratedBox(
              decoration: decoration,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: DecoratedBox(
                        decoration: decoration,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.network(
                            'https://i.cbc.ca/1.6713656.1679693029!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_780/this-is-fine.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Здесь мог бы быть ваш мем',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Impact',
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(onPressed: () {
          _showOrHide();
        }, 
        label: const Text('Добавить изображение')),
      ),
    );
  }
}

class ModalWindow extends StatelessWidget {
  const ModalWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter URL',
                  hintStyle: TextStyle(color: Colors.white)),
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.width * 0.15,
              child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Загрузить'),
                ),
            ),
          ),
        ],
      ),
    );
  }
}