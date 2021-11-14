import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:myapp/config/beam_locations.dart';

class CustomMainAppBar extends PreferredSize {
  final Size _preferredSize;
  
  CustomMainAppBar({ 
    Key? key,
    Size? preferredSIze,
  }) : _preferredSize = Size.fromHeight(75),
  super(
    preferredSize: Size.fromHeight(75),
    child: Container(),
  );

  @override 
  Size get preferredSize => _preferredSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MenuButton(
            text: 'Home',
            routeName: RouteLocationGenerator.homeRoute,
          ),
          MenuButton(
            text: 'Profile',
            routeName: RouteLocationGenerator.profileRoute,
          ),
          MenuButton(
            text: 'Todo',
            routeName: RouteLocationGenerator.todoRoute,
          ),
          SizedBox(width: 25),
        ],
      )
    );
  }
}

class MenuButton extends StatelessWidget {
  final String? text;
  final String routeName;

  const MenuButton({ 
    Key? key,
    this.text,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context)!.settings.name;

    return Container(
      height: 75,
      constraints: BoxConstraints(minWidth: 50),
      child: TextButton(
        child: Text(
          text!,
          style: TextStyle(
            color: Colors.white
          )
        ),
        onPressed: () {
          if(route != routeName) {
            Beamer.of(context).beamToNamed(
              routeName,
            );
          }
        },
      ),
    );
  }
}