import 'package:flutter/material.dart';
import 'package:myapp/components/main_app_bar.dart';

List<String> menuItems = [
    'Privacy',
    'Change Password',
    'Delete Account',
  ];

class SettingsPage extends StatelessWidget {
  static const String routeName = '/settings';

  const SettingsPage({ 
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMainAppBar(),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (BuildContext context, int index) {
          return SettingsListItem(buttonLabel: menuItems[index]);
        }
      )
    );
  }
}

class SettingsListItem extends StatelessWidget {
  final String buttonLabel;

  const SettingsListItem({ 
    Key? key,
    required this.buttonLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 25,
        width: double.infinity,
        child: Text(buttonLabel)
      ),
    );
  }
}