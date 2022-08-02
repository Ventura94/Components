import 'package:flutter/material.dart';

import 'package:components/src/pages/slider_page.dart';
import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/pages/input_page.dart';
import 'package:components/src/pages/card_page.dart';
import 'package:components/src/pages/avatar_page.dart';
import 'package:components/src/pages/home_page.dart';
import 'package:components/src/pages/animated_container_page.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const HomePage(),
    'alert': (BuildContext context) => const AlertPage(),
    'avatar': (BuildContext context) => const AvatarPage(),
    'card': (BuildContext context) => const CardPage(),
    'animatedContainer': (BuildContext context) =>
        const AnimatedContainerPage(),
    'inputs': (BuildContext context) => const InputsPage(),
    'slider': (BuildContext context) => const SliderPage(),
  };
}
