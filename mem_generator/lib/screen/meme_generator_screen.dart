import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import '../services/image_source.dart';
import '../services/image_url_source.dart';
import 'demotivator_settings_modal_window.dart';
import 'main_screen_image_inherited.dart';
import 'sharing_meme_modal_window.dart';

class MemeGeneratorScreen extends StatefulWidget {
  MemeGeneratorScreen({Key? key}) : super(key: key);

  @override
  State<MemeGeneratorScreen> createState() => MemeGeneratorScreenState();
}

class MemeGeneratorScreenState extends State<MemeGeneratorScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  MemeSource _imageSource = MemeUrlSource(pictureUrl: 'https://i.cbc.ca/1.6713656.1679693029!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_780/this-is-fine.jpg');
  String _text = 'Здесь мог быть ваш мем';
  final ScreenshotController screenshotController = ScreenshotController();

  void _showOrHide() {
    _scaffoldKey.currentState?.showBottomSheet(
      (_) => DemotivatorSettingsModalWindow(
        parent: this,
      ),
    );
  }

  void changeImageSource(MemeSource imageSource) {
    setState(() {
      _imageSource = imageSource;
    });
  }

  void changeText(String text) {
    setState(() {
      _text = text;
    });
  }

  void screenshotAndShare() {
    screenshotController.capture().then((value) {
      _scaffoldKey.currentState?.showBottomSheet(
      (_) => SharingMemeModalWindow(
        data: value,
      ),
    );
    },);
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
      body: MainScreenMemeProperties(
        imageSource: _imageSource,
        text: _text,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Screenshot(
              controller: screenshotController,
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
                                child: GestureDetector(
                                  onTap: () {
                                    _showOrHide();
                                  },
                                  child: Builder(builder: (innerContext) {
                                    return FutureBuilder(
                                      future: _imageSource.getImage(),
                                      builder:
                                          (futureBuilderContextontext, snapshot) {
                                        if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                                          return snapshot.data!;
                                        } else if (snapshot.hasError) {
                                          return const Center(child: Text("Ошибка загрузки("));
                                        } else {
                                          return const Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  }),
                                )),
                          ),
                        ),
                        Builder(
                          builder: (innerContext) {
                            return GestureDetector(
                              onTap:() {
                                _showOrHide();
                              },
                              child: Text(
                                MainScreenMemeProperties.of(innerContext).text,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'Impact',
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }
                        ),
                      ],
                    ),
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