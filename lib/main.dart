import 'package:flutter/material.dart';
import 'image_paths.dart';
import 'routes.dart';
import 'image_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Esconde a faixa "DEBUG"
      title: 'Image Gallery App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: Routes.home,
      routes: {
        Routes.home: (context) => ImageGallery(),
        Routes.viewImage: (context) => ImageView(),
      },
    );
  }
}

class ImageGallery extends StatefulWidget {
  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  final List<String> images = List.from(imagePaths);

  void _addImage() {
    setState(() {
      images.add('assets/images/image4.jpg'); // Adiciona uma nova imagem
    });
  }

  void _removeImage(int index) {
    setState(() {
      images.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gallery'),
        actions: [IconButton(icon: Icon(Icons.add), onPressed: _addImage)],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Número de colunas
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.viewImage,
                arguments: images[index],
              );
            },
            onLongPress: () {
              _removeImage(index);
            },
            child: Card(child: Image.asset(images[index])),
          );
        },
      ),
    );
  }
}
