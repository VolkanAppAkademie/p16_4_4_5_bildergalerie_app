import 'package:flutter/material.dart';
import 'package:p16_4_4_5_bildergalerie_app/galleryData.dart';
import 'package:p16_4_4_5_bildergalerie_app/galleryTile.dart';
import 'package:p16_4_4_5_bildergalerie_app/main2.dart';

class GalleryGrid extends StatelessWidget {
  const GalleryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyGallery'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1,
        ),
        itemCount: galleryData.length,
        itemBuilder: (context, index) {
          final item = galleryData[index];
          return GalleryTile(item: item);
        },
      ),
    );
  }
}
