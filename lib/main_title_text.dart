import 'package:flutter/cupertino.dart';

class MainTitleText extends Text {
  final String data;
  const MainTitleText({required this.data}) : super(
      data,
      style:  const TextStyle(
          fontSize: 25,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold
      )
  );
}
