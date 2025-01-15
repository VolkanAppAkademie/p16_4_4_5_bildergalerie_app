import 'package:flutter/material.dart';
import 'gallery_data.dart';
import 'gallery_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bildergalerie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bildergalerie')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: galleryData.length,
          itemBuilder: (context, index) {
            final item = galleryData[index];
            return GestureDetector(
              onTap: () => _showBottomSheet(context, item),
              child: GridTile(
                child: Image.asset(item.imageUrl, fit: BoxFit.cover),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Galerie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Details',
          ),
        ],
      ),
    );
  }

  // BottomSheet anzeigen
  void _showBottomSheet(BuildContext context, GalleryItem item) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(item.imageUrl),
              SizedBox(height: 10),
              Text(
                'Aufnahmedatum: ${item.dateTaken.toLocal()}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                item.description,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      },
    );
  }
}
