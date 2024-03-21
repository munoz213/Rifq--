import 'package:flutter/material.dart';
import 'package:rifq/screens/onboarding_screen/size_config.dart';
import 'package:rifq/screens/onboarding_screen/onboarding_content.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rifq/screens/Login/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;
  List colors = const [
    Color(0xffFFFFFF),
    Color(0xffFFFFFF),
    Color(0xffFFFFFF),
    Color(0xffFFFFFF),
  ];

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Color(0xff0080AC),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 5,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    return Scaffold(
      backgroundColor: colors[_currentPage],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemCount: contents.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: [
                        Image.asset(
                          contents[i].image,
                          height: SizeConfig.blockV! * 35,
                        ),
                        SizedBox(
                          height: (height >= 840) ? 60 : 30,
                        ),
                        Text(
                          contents[i].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Color(0xff3F3F3F),
                            fontWeight: FontWeight.w600,
                            fontSize: (width <= 550) ? 20 : 35,
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          contents[i].desc,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Color(0xff696969),
                            fontWeight: FontWeight.w400,
                            fontSize: (width <= 550) ? 14 : 21,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            if (_currentPage !=
                contents
                    .length) // Show dots and next button for all pages except the last one
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(60.4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          contents.length,
                          (int index) => _buildDots(
                            index: index,
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 50,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeIn,
                                );
                                if (_currentPage == contents.length - 1)
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const LoginScreen();
                                      },
                                    ),
                                  );
                              },
                              child: SvgPicture.asset(
                                "assets/icons/right-arrow.svg",
                                color: Colors.white,
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff0080AC),
                                shape: const CircleBorder(),
                                elevation: 0,
                              ))),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
