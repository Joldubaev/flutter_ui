import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruitshop_starter/data/data.dart';
import 'package:fruitshop_starter/utils/colors.dart';
import 'package:fruitshop_starter/utils/utils.dart';
import 'package:fruitshop_starter/widget/nutrient_widget.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.50,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),
            color: widget.product.color,
            child: Transform.rotate(
              angle: 2.10 * pi,
              child: Image.asset(widget.product.image),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: iconWidget(FontAwesomeIcons.arrowLeft, false),
                ),
                const Text(
                  'Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: iconWidget(FontAwesomeIcons.bagShopping, true),
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            margin: EdgeInsets.only(top: size.height * 0.55),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: size.height * 0.80,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 30),
                            ),
                            const SizedBox(height: 10),
                            priceWidget(widget.product.price),
                          ],
                        ),
                        Container(
                          width: 130,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: boxShadow),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              quantityIcon(
                                  onTap: () {},
                                  color: kSecondaryColor,
                                  icon: FontAwesomeIcons.minus),
                              Text(
                                itemCount.toString(),
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              quantityIcon(
                                  onTap: () {},
                                  color: kSecondaryColor,
                                  icon: FontAwesomeIcons.plus),
                            ],
                          ),
                        ),
                      ],
                    ),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.6,
                      ),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return NutrientWidget(
                          product: data[0].products![index],
                          index: index,
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Details',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text('lorem ipsum')
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget quantityIcon(
      {required VoidCallback onTap,
      required Color color,
      required IconData icon}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Icon(
          icon,
          color: color == kPrimaryColor ? Colors.white : kPrimaryColor,
          size: 20,
        ),
      ),
    );
  }
}
