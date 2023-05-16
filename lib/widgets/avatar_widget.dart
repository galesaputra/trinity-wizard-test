import 'package:flutter/material.dart';
import 'package:trinity_wizard_project/utils/colors.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        color: ConstColor.primary,
        shape: BoxShape.circle,
      ),
    );
  }
}
