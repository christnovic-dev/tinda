import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../authentication/discover_page.dart';
import '../constant/couleur.dart';
import '../widget/onboarding_item.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  bool lastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            /// pages
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    lastPage = index == 2;
                  });
                },
                children: const [
                  OnboardingItem(
                    image: "assets/headphone.png",
                    title: "Your Ideal Electronic Store",
                    description:
                        "Enjoy your life with clear sound also with the best things.",
                  ),

                  OnboardingItem(
                    image: "assets/earbuds.png",
                    title: "Plug Into The World Buzz",
                    description:
                        "Listen to your tunes in crisp high-quality audio.",
                  ),

                  OnboardingItem(
                    image: "assets/watch.png",
                    title: "Discover your best Products",
                    description:
                        "Find a wide section of electronics from top brands.",
                  ),
                ],
              ),
            ),

            /// indicateur + boutons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// skip
                  TextButton(
                    onPressed: () {
                      controller.jumpToPage(2);
                    },
                    child: const Text("Skip"),
                  ),

                  /// dots
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: primaryColor,
                    ),
                  ),

                  /// bouton next
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (lastPage) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DiscoverScreen(),
                          ),
                        );
                      } else {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Text(
                        lastPage ? "Start" : "Next",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
