import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;

  const CachedImage({Key? key, required this.image, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }
}

class AssetImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;

  const AssetImage({Key? key, required this.image, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }
}

class CustomFileImage extends StatelessWidget {
  final File image;
  final double? height;
  final double? width;

  const CustomFileImage({Key? key, required this.image, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.file(
      image,
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }
}
