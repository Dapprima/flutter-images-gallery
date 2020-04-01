import 'package:flutter/material.dart';

import '../screens/image_screen.dart';

class ImageItem extends StatelessWidget {
  ImageItem(this.images);
  final images;

 
   Widget _buildImageItem(BuildContext context, int index) {
    return Container(child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: GestureDetector(
                child:Image.network(images[index]['url'],
              ),
              onTap: () {
                Navigator.pushNamed(context, ImageScreen.screenName, arguments: images[index]['url']);
              },
            ), 
            padding: EdgeInsets.all(10.0),),
        Container(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.star, color: Colors.white,),
                  Expanded(
                    child:Text(images[index]['name'], style: TextStyle(color: Colors.white,),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.account_circle, color: Colors.white,),
                  Text(images[index]['author'],style: TextStyle(color: Colors.white,),),
                ],
              ),
            ],
          ),
          padding: EdgeInsets.all(10.0),
        ),
      ],
    ),
    margin: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5.0))
    ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildImageItem,
      itemCount: images.length,
    );
  }
}