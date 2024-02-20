import 'package:flutter/material.dart';
import 'package:mem_generator/screen/custom_widgets/button.dart';

import 'demotivator_settings_modal_window.dart';
import 'main_screen_image_inherited.dart';
import 'modal_window.dart';

class MemeGeneratorScreen extends StatefulWidget {
  MemeGeneratorScreen({Key? key}) : super(key: key);

  @override
  State<MemeGeneratorScreen> createState() => MemeGeneratorScreenState();
}

class MemeGeneratorScreenState extends State<MemeGeneratorScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _url =
      'https://i.cbc.ca/1.6713656.1679693029!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_780/this-is-fine.jpg';
  String _text = 'Здесь мог быть ваш мем';

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

  void changeText(String text) {
    setState(() {
      _text = text;
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
      body: MainScreenMemeProperties(
        url: _url,
        text: _text,
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
                                      MainScreenMemeProperties.of(innerContext).url),
                                  builder:
                                      (futureBuilderContextontext, snapshot) {
                                    if (snapshot.hasData &&
                                        snapshot.connectionState ==
                                            ConnectionState.done) {
                                      return snapshot.data!;
                                    } else {
                                      return const Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      );
                                    }
                                  },
                                );
                              })),
                        ),
                      ),
                      Builder(
                        builder: (innerContext) {
                          return Text(
                            MainScreenMemeProperties.of(innerContext).text,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Impact',
                              fontSize: 40,
                              color: Colors.white,
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
