import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class TabItem extends StatelessWidget {
  String? text;
  final IconData icon;
  final bool isSelected;
  final Function onTap;

   TabItem(
      {Key? key,
      required this.icon,
      required this.isSelected,
      required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function(),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 15, left: 12, right: 12, bottom: 15),
        child: Icon(
          icon,
          color: isSelected ? Colors.yellow: Get.isDarkMode?Colors.grey:Colors.black,
        ),
      ),
    );
  }
}
