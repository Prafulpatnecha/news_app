import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/view/control_files.dart';

void main()
{
  Get.put(NewsController());
  runApp(const MyApp());
}