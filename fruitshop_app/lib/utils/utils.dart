import 'package:flutter/material.dart';
import 'package:fruitshop_starter/utils/colors.dart';

final boxShadow = [
  BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 1,
      spreadRadius: 1,
      offset: const Offset(1, 1))
];

Widget iconWidget(IconData icon, bool dotExists) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: boxShadow,
      shape: BoxShape.circle,
    ),
    child: Stack(alignment: Alignment.center, children: [
      Icon(icon),
      if (dotExists)
        Positioned(
            child: Container(
          width: 8,
          height: 8,
          decoration:
              const BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
        ))
    ]),
  );
}

Widget priceWidget(String price) {
  return RichText(
    text: TextSpan(children: [
      TextSpan(
          text: '\$$price',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          )),
      const TextSpan(
          text: ' kg',
          style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold)),
    ]),
  );
}
