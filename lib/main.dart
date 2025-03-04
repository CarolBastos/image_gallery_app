import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'register_screen.dart';
import 'image_gallery.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Gallery App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: Routes.register,
      routes: {
        Routes.register: (context) => RegisterScreen(),
        Routes.gallery: (context) => ImageGallery(),
      },
    );
  }
}
