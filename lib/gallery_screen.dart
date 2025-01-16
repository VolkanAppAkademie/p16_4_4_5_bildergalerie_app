import 'package:flutter/material.dart';
import 'gallery_data.dart';
import 'gallery_item.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: galleryData.length,
        itemBuilder: (context, index) {
          final item = galleryData[index];
          return GestureDetector(
            onTap: () {
              _showBottomSheet(context, item);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                item.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  void _showBottomSheet(BuildContext context, GalleryItem item) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Image.asset(item.imagePath),
              SizedBox(height: 8.0),
              Text(
                item.imageTitle,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8.0),
              Text(
                ' ${item.imageDate}',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                item.imageDescription,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        );
      },
    );
  }
}
