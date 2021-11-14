import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';


class DetailsPage extends StatelessWidget {
  final String? id;
  final String? test;
  final Map? data;

  const DetailsPage({ 
    Key? key,
    this.id,
    this.test,
    this.data,
  }) : 
  super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Beamer.of(context).currentBeamLocation.state.data;

    return Scaffold(
      appBar: AppBar(
        title: Text('${data['name']}'),
      ),
      body: Center(
        child: Text('This is details page of $id.')
      )
    );
  }
}