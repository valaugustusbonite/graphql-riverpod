import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/common/components/main_app_bar.dart';


class ProfilePage extends HookWidget {
  
  const ProfilePage({ 
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomMainAppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              'HELLO: ',
              style: TextStyle(fontSize: 50)
            ),
            FloatingActionButton(
              onPressed: () {
            },
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}