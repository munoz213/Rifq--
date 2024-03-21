import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../Login/login_screen.dart';

class EmailSentForm extends StatelessWidget {
  const EmailSentForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Text(
            "We have sent you an email with instructions for",
            style: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w300,
                fontSize: 13),
          ),
          Text(
            "resetting your password",
            style: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w300,
                fontSize: 13),
          ),
          Text(
            "Don't forget to check your spam folder",
            style: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w300,
                fontSize: 13),
          ),
          const SizedBox(height: defaultPadding * 4),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
            child: Text(
              "Back To Login".toUpperCase(),
            ),
          ),
        ],
      ),
    );
  }
}
