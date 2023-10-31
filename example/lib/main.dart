import 'package:flutter/material.dart';
import 'package:onboarding_slider_flutter/onboarding_slider_flutter.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoard(
        pageController: _pageController,
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        onSkip: () {
          // print('skipped');
        },
        // Either Provide onDone Callback or nextButton Widget to handle done state
        onDone: () {
          // print('done tapped');
        },
        onBoardData: onBoardData,
        titleStyles: const TextStyle(
          color: Color(0xffFDFDFD),
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        descriptionStyles: const TextStyle(
          fontSize: 16,
          color: Color(0xffF0F0F0),
          fontWeight: FontWeight.w400,
        ),
        pageIndicatorStyle: const PageIndicatorStyle(
          width: 50,
          inactiveColor: Color(0xff9CC2E1),
          activeColor: Color(0xff0A74D7),
          inactiveSize: Size(12, 5),
          activeSize: Size(12, 5),
        ),
        startButton: SizedBox(
          width: 358,
          height: 42,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xff0A74D7),
              ),
            ),
            child: const Text(
              "Get Started",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(
                    0xfffdfdfd,
                  )),
            ),
            onPressed: () {},
          ),
        ),
        showSkip: false,
        imageWidth: 320,
        imageHeight: 320,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff0a74d7),
              Color(0xff105DA5),
              Color(0xff144A7D),
              Color(0xff173B5D),
              Color(0xff1B2D3D),
              Color(0xff1D252E),
              Color(0xff1E1F1F),
            ],
          ),
        ),
      ),
    );
  }
}

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: "Flutter Essentials: A Beginner's Guide",
    description:
        "Learn the fundamentals of Flutter in this comprehensive onboarding screen",
    image: "assets/images/onboarding_carousel_1.png",
  ),
  const OnBoardModel(
    title: "Mastering Flutter: Advanced Techniques and Tips",
    description:
        "Take your Flutter skills to the next level with this advanced onboarding screen",
    image: 'assets/images/onboarding_carousel_2.png',
  ),
  const OnBoardModel(
    title: "Flutter for Designers: Creating Stunning UIs",
    description:
        "Unleash your creative potential with Flutter in this onboarding screen tailored for designers",
    image: 'assets/images/onboarding_carousel_3.png',
  ),
];
