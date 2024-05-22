import 'package:flutter/material.dart';

class TabItem {
  final Widget page;
  final String title;
  final Widget icon;

  TabItem({
    required this.page,
    required this.title,
    required this.icon,
  });
}