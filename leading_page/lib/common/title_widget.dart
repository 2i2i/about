import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  final double height;
  final CrossAxisAlignment crossAxisAlignment;

  const TitleWidget(
      {Key? key,
      required this.text,
      this.height = 0.0005,
      this.crossAxisAlignment = CrossAxisAlignment.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline3),
        SizedBox(height: 2.h),
        Card(
          elevation: 3,
          child: Container(
            width: 14.h,
            height: height,
            decoration: BoxDecoration(
                color: Theme.of(context).shadowColor,
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
