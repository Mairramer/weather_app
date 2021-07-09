import 'package:flutter/material.dart';

class WeaherInfos extends StatelessWidget {
  final String infoText;
  final TextStyle styleInfoText;
  final String dataInfo;
  final TextStyle dataInfoStyle;

  const WeaherInfos(
      {Key? key,
      required this.infoText,
      required this.styleInfoText,
      required this.dataInfo,
      required this.dataInfoStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            infoText,
            style: styleInfoText,
          ),
          SizedBox(
            width: 38.0,
          ),
          Text(
            dataInfo,
            style: dataInfoStyle,
          ),
        ],
      ),
    );
  }
}
