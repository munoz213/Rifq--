import 'package:flutter/material.dart';
import 'package:rifq/responsive.dart';

import '../../components/background.dart';
import 'components/email_sent_form.dart';
import 'components/email_sent_screen_top_image.dart';

class EmailSentScreen extends StatelessWidget {
  const EmailSentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileLoginScreen(),
          desktop: Row(
            children: [
              Expanded(
                child: EmailSentScreenTopImage(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: EmailSentForm(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        EmailSentScreenTopImage(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: EmailSentForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
