import 'package:flutter/material.dart';

class ImageNotFound extends StatelessWidget {
  const ImageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.grey,
      child: Icon(Icons.image_not_supported_rounded),
    );
  }
}