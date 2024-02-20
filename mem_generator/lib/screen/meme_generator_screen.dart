import 'package:flutter/material.dart';

import 'main_screen_image_inherited.dart';
import 'modal_window.dart';

class MemeGeneratorScreen extends StatefulWidget {
  MemeGeneratorScreen({Key? key}) : super(key: key);

  @override
  State<MemeGeneratorScreen> createState() => MemeGeneratorScreenState();
}

class MemeGeneratorScreenState extends State<MemeGeneratorScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _url = 'https://i.cbc.ca/1.6713656.1679693029!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_780/this-is-fine.jpg';

  void _showOrHide() {
    _scaffoldKey.currentState?.showBottomSheet(
      (_) => DemotivatorSettingsModalWindow(
        parent: this,
      ),
    );
  }

  void changeUrl(String url) {
    setState(() {
      _url = url;
    });
  }

  Future<Widget> getImageWidget(String? pictureUrl) async {
    if (pictureUrl == null) throw Exception('Image URL is null');
    try {
      return Image.network(
        pictureUrl,
        loadingBuilder: (_, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        },
      );
    } catch (e) {
      rethrow;
    }
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
      body: MainScreenImageUrl(
        url: _url,
        child: Scaffold(
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
                              child: Builder(builder: (innerContext) {
                                return FutureBuilder(
                                  future: getImageWidget(
                                      MainScreenImageUrl.of(innerContext).url),
                                  builder:
                                      (futureBuilderContextontext, snapshot) {
                                    if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                                      return snapshot.data!;
                                    } else {
                                      return const Center(child: CircularProgressIndicator(color: Colors.white,),);
                                    }
                                  },
                                );
                              })),
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
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                _showOrHide();
              },
              label: const Text('Изменить демотиватор')),
        ),
      ),
    );
  }
}

class DemotivatorSettingsModalWindow extends StatelessWidget {
  const DemotivatorSettingsModalWindow({super.key, required this.parent});

  final MemeGeneratorScreenState parent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Настройки демотиватора', style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          children: [
            FloatingActionButton(onPressed: () {
              showBottomSheet(
                context: context, 
                builder: (context) {
                  return ModalWindow(parent: parent);
                },);
            }, 
            child: const Text('Получить картинку по ссылке')),
            FloatingActionButton(onPressed: () {
              showBottomSheet(
                context: context, 
                builder: (context) {
                  return ModalWindow(parent: parent);
                },);
            }, 
            child: const Text('Изменить текст демотиватора')),
          ],
        ),
      )
    );
  }
  
}

