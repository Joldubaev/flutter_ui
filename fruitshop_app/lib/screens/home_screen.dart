import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruitshop_starter/data/data.dart';
import 'package:fruitshop_starter/screens/datail_screen.dart';
import 'package:fruitshop_starter/utils/colors.dart';
import 'package:fruitshop_starter/utils/utils.dart';
import 'package:fruitshop_starter/widget/product_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: kSecondaryColor,
                    backgroundImage: AssetImage('assets/user.png'),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Joldubaev Kylychbek',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  iconWidget(FontAwesomeIcons.bagShopping, true)
                ],
              ),
              const SizedBox(height: 30),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Get your fresh items \n',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400),
                    ),
                    TextSpan(
                      text: 'with ',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400),
                    ),
                    TextSpan(
                      text: 'Hay Markets ',
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.70,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: boxShadow,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.magnifyingGlass,
                          size: 25,
                          color: kPrimaryColor,
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Search pineapple',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              color: Colors.black38),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      FontAwesomeIcons.filter,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        data[index].name,
                        style: TextStyle(
                            fontSize: 16,
                            color: index == 0 ? kPrimaryColor : Colors.black45,
                            fontWeight:
                                index == 0 ? FontWeight.bold : FontWeight.w400),
                      ),
                    );
                  },
                ),
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 40,
                    crossAxisCount: 2),
                shrinkWrap: true,
                primary: false,
                itemCount: data[0].products!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          product: data[0].products![index],
                        ),
                      ),
                    ),
                    child: ProductWidget(
                      product: data[0].products![index],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
