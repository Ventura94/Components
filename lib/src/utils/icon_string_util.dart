import 'package:flutter/material.dart';

class MyIconsString {
  MyIconsString._();

  static final _icons = {
    "add_alert": Icons.add_alert,
    "accessibility": Icons.accessibility,
    "folder_open": Icons.folder_open,
    "donut_large": Icons.donut_large,
    "input": Icons.input,
    "tune": Icons.tune,

  };

  static Icon getIcon(String name) {
    return Icon(_icons[name]);
  }
}
