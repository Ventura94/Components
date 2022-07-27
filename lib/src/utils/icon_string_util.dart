import 'package:flutter/material.dart';

class MyIconsString {
  MyIconsString._();

  static final _icons = {
    "add_alert": Icons.add_alert,
    "accessibility": Icons.accessibility,
    "folder_open": Icons.folder_open,
  };

  static Icon getIcon(String name) {
    return Icon(_icons[name]);
  }
}
