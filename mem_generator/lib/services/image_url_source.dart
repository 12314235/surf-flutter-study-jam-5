import 'package:flutter/material.dart';
import 'package:mem_generator/services/image_source.dart';

class MemeUrlSource implements MemeSource {

  final String? pictureUrl;

  MemeUrlSource({required this.pictureUrl});

  @override
  Future<Widget> getImage() async {
    if (pictureUrl == null) throw Exception('Image URL is null');
    try {
      return Image.network(
        pictureUrl!,
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
  
}
