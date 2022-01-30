import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String stringPath;

  const ProfileWidget({
    Key? key,
    required this.stringPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
      child: Card(
        elevation: 2,
        color: Theme.of(context).primaryColorLight,
        shadowColor: Theme.of(context).inputDecorationTheme.fillColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        child: Center(
          child: Text(
                  (stringPath.toString().isNotEmpty ? stringPath : "X")
                      .substring(0, 1)
                      .toUpperCase(),
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: Theme.of(context).colorScheme.secondary),
                ),
        ),
      ),
    );
  }
}

class ProfileWithNameWidget extends StatelessWidget {
  final String stringPath;
  final String name;
  final String position;
  final double size;

  const ProfileWithNameWidget({
    Key? key,
    required this.name,
    required this.position,
    required this.stringPath,
    this.size = 128,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(22)),
          child: Card(
            elevation: 2,
            color: Theme.of(context).primaryColorLight,
            shadowColor: Theme.of(context).inputDecorationTheme.fillColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(stringPath),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(name,style: Theme.of(context).textTheme.headline6?.copyWith(
          fontWeight: FontWeight.w800,
          color: Theme.of(context).cardColor
        ),),
        const SizedBox(height: 8),
        Text(position,style: Theme.of(context).textTheme.bodyText2?.copyWith(
          color: Theme.of(context).shadowColor
        )),
      ],
    );
  }
}
