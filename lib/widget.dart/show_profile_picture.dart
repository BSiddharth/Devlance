import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ShowProfilePicture extends StatelessWidget {
  const ShowProfilePicture(
      {Key? key, required this.url, required this.dimension})
      : super(key: key);
  final String url;
  final double dimension;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      fadeInDuration: const Duration(milliseconds: 500),
      fadeOutDuration: const Duration(milliseconds: 500),
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        width: dimension,
        height: dimension,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
        ),
      ),
      placeholder: (context, url) => Container(
        width: dimension,
        height: dimension,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
      ),
      errorWidget: (context, url, error) => Container(
          width: dimension,
          height: dimension,
          color: Colors.black,
          child: const Center(
              child: Icon(
            Icons.error,
            color: Colors.redAccent,
          ))),
    );
  }
}
