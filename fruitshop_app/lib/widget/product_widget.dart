import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruitshop_starter/data/data.dart';
import 'package:fruitshop_starter/utils/colors.dart';
import 'package:fruitshop_starter/utils/utils.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: product.color,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Transform.rotate(
              angle: 2.05 * pi,
              child: Image.asset(
                product.image,
                height: 80,
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              height: 30,
              width: 30,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: boxShadow),
              child: Icon(
                FontAwesomeIcons.solidHeart,
                color: product.isSelected ? kPrimaryColor : Colors.black54,
                size: 15,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            left: 0,
            child: Container(
              height: 100,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: product.color.withOpacity(0.5),
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  priceWidget(product.price),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Text(
                        'See more',
                      ),
                      SizedBox(width: 10),
                      Icon(
                        FontAwesomeIcons.arrowTrendUp,
                        color: kPrimaryColor,
                        size: 16,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
