import 'package:flutter/material.dart';

import './screens/images_screen.dart';
import './screens/image_screen.dart';

void main () => runApp(GalleryApp());


class GalleryApp extends StatelessWidget {
  const GalleryApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat',scaffoldBackgroundColor: Colors.blueGrey[400], appBarTheme: AppBarTheme(color: Colors.blueGrey[900])),
      initialRoute: ImagesScreen.screenName,
      debugShowCheckedModeBanner: false,
      routes: {
        ImagesScreen.screenName: (context) => ImagesScreen(),
        ImageScreen.screenName: (context) => ImageScreen(),
      },
    );
  }
}




