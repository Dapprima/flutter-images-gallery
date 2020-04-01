import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageScreen extends StatelessWidget {
  static String screenName = 'image_screen';

  
  @override
  Widget build(BuildContext context) {
    final String url = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('Image View'),centerTitle: true,),
      body: PhotoView(
        imageProvider: NetworkImage(url),
      ),
    );
  }
}