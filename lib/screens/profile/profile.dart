import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/main_app_bar.dart';
import 'package:myapp/screens/profile/details_page.dart';

//food data
const List<Map<String, String>> userDetail = [
  {
    'id': '1',
    'name' : 'Val Bonite',
    'username' : 'val.bonite'
  },
  {
    'id': '2',
    'name' : 'Earvin Agamata',
    'username' : 'earvin.agamata'
  },
  {
    'id': '3',
    'name' : 'Ralph Ramos',
    'username' : 'ralph.ramos'
  },
  {
    'id': '4',
    'name' : 'Bruce Apos',
    'username' : 'bruce.apos'
  },
  {
    'id': '5',
    'name' : 'Shiela Villamor',
    'username' : 'shiela.villamor'
  },
  
];

class ProfilePage extends StatelessWidget {
  
  const ProfilePage({ 
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMainAppBar(),
      body: Column(
        children: [
          Text(
            'Friends (${userDetail.length})',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            )
          ),
          Expanded(
            child: ListView.builder(
              itemCount: userDetail.length,
              itemBuilder: (BuildContext context, int index) {
                return UserListItem(
                  buttonLabel: userDetail[index]['name']!,
                  username: userDetail[index]['username']!,
                );
              }
            ),
          ),
        ],
      )
    );
  }
}

class UserListItem extends StatelessWidget {
  final String buttonLabel;
  final String username;

  const UserListItem({ 
    Key? key,
    required this.buttonLabel,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.beamToNamed(
        'profile/$username',
        data: {
          'username' : username,
          'name' : buttonLabel
        }
      ),
      child: Container(
        height: 25,
        width: double.infinity,
        child: Text(buttonLabel)
      ),
    );
  }
}