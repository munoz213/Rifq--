import 'package:flutter/material.dart';

import '../../onboarding_screen/onboarding_screen.dart';

class getstartedBtn extends StatelessWidget {
  const getstartedBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const OnboardingScreen();
                },
              ),
            );
          },
          child: Text(
            "Get Started".toUpperCase(),
          ),
        ),
      ],
    );
  }
}
