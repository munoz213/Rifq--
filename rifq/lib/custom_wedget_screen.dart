import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final AlignmentGeometry? alignment;
  final bool? value;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final Function(bool) onChange;

  const CustomSwitch({
    Key? key,
    required this.onChange,
    this.alignment,
    this.value,
    this.width,
    this.height,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      child: alignment != null
          ? Align(
              alignment: alignment!,
              child: switchWidget,
            )
          : switchWidget,
    );
  }

  Widget get switchWidget => Switch(
        value: value ?? false,
        onChanged: onChange,
      );
}
