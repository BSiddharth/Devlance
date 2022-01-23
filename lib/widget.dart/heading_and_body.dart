import 'package:flutter/material.dart';

class HeadingAndBody extends StatelessWidget {
  final String heading;
  final String body;
  const HeadingAndBody({Key? key, required this.heading, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(body,
                  style: const TextStyle(fontSize: 15, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
