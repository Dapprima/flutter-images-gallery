import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../widgets/image_item.dart';


class ImagesScreen extends StatefulWidget {
  ImagesScreen({Key key}) : super(key: key);
  static String screenName = 'images_screen';
  @override
  _ImagesScreenState createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  final List _images = [];

  @override
  void initState() {
    super.initState();
    getImages();
  }
  void getImages() async {
    http.Response response = await http.get('https://api.unsplash.com/photos?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0&per_page=14');
    List dataSet = jsonDecode(response.body);
    
    setState(() {
      for (var data in dataSet) {
        _images.add({
          'name': data['alt_description'],
          'author': data['user']['username'],
          'url': data['urls']['small']
        });
       
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Images Gallery'),centerTitle: true),
      body:_images.length > 0 ? Container(child: ImageItem(_images),)
      : Container(child:Center(child: CircularProgressIndicator(backgroundColor: Colors.purple,),),),
    ); 
    
  }
}