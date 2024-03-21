import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SvgPicture.asset(
                "assets/icons/Logo.svg",
                height: 65,
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding / 2),
        Text(
          "Hey there",
          style: const TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.normal,
              fontSize: 13),
        ),
        const SizedBox(height: defaultPadding / 5),
        Text(
          "Welcome Back",
          style: const TextStyle(
              fontFamily: "Poppins", fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
