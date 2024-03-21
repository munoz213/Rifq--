import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class EmailSentScreenTopImage extends StatelessWidget {
  const EmailSentScreenTopImage({
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
        const SizedBox(height: defaultPadding / 5),
        Text(
          "Check your email",
          style: const TextStyle(
              fontFamily: "Poppins", fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
