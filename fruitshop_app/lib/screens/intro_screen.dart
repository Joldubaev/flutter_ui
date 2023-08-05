import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruitshop_starter/screens/home_screen.dart';
import 'package:fruitshop_starter/utils/colors.dart';
import 'package:slide_action/slide_action.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final _controller = ActionSliderController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'HAY MARKETS',
              style: TextStyle(
                fontSize: 18,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.1,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'First Online',
              style: TextStyle(
                fontSize: 60,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Text(
              'Market',
              style: TextStyle(
                fontSize: 60,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Our market always provide fresh items from the local farmers, lets support local with us',
              style: TextStyle(color: Colors.black54, height: 1.4),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/bg.png'),
            ),
            const Spacer(),
            Column(
              children: [
                // slider
                SlideAction(
                  trackBuilder: (context, state) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                        color: kPrimaryColor,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Swipe to Start: ${state.thumbFractionalPosition.toStringAsPrecision(2)}",
                        ),
                      ),
                    );
                  },
                  thumbBuilder: (context, state) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Center(
                        child: Icon(
                          FontAwesomeIcons.arrowRight,
                          color: kPrimaryColor,
                          size: 20,
                        ),
                      ),
                    );
                  },
                  action: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                ),
                const SizedBox(height: 20),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'HOW TO SUPPORT ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      TextSpan(
                        text: 'LOCAL FARMERS',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
