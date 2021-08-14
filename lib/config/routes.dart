import 'package:flutter/material.dart';

class RouteGenerator {

  // static const String homeRoute = '/';
  // static const String aboutRoute = '/aboutme';
  // static const String settingsRoute = '/settings';

  //Navigator 1.0
  // static Route<dynamic> generateRoute(RouteSettings settings) {

  //   switch(settings.name) {
  //     case HomePage.routeName:
  //       return MaterialPageRoute(
  //         builder: (context) => RouteHandler(routeWidget: HomePage()),
  //         settings: settings,
  //       );
  //     case AboutPage.routeName:
  //       return MaterialPageRoute(
  //         builder: (context) => RouteHandler(routeWidget: AboutPage()),
  //         settings: settings,
  //       );
  //     case SettingsPage.routeName:
  //       return MaterialPageRoute(
  //         builder: (context) => RouteHandler(routeWidget: SettingsPage()),
  //         settings: settings,
  //       );

  //     default: return _errorRoute();
  //   }
  // }


  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) => Scaffold(
      appBar: AppBar(
        title: Text('Error')
      ),
      body: Center(
        child: Text('Page not found!'),
      )
     )
    );
  }
}

class RouteHandler extends StatelessWidget {
  final Widget routeWidget;

  const RouteHandler({ 
    Key? key,
    required this.routeWidget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: routeWidget, 
      onWillPop: () async => true,
    );
  }
}