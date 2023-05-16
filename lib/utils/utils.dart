import 'package:flutter/material.dart';

class Utils {
  Utils._privateConstructor();

  static final Utils _instance = Utils._privateConstructor();

  factory Utils() {
    return _instance;
  }

  static Future<DateTime> vShowDatePicker(BuildContext context,
      {DateTime? selectedDate, DateTime? lastDate}) async {
    var data = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? lastDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: lastDate ?? DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(primary: Colors.blue),
          ),
          child: child!,
        );
      },
    );

    return data ?? selectedDate ?? DateTime.now();
  }
}
