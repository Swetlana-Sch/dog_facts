import 'package:dog_facts_app/providers/dog_fact_provider.dart';
import 'package:dog_facts_app/widgets/app_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  static const routName = '/favourite_screen';
  @override
  Widget build(BuildContext context) {
    final dogData = context.watch<DogFactProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite facts'),
      ),
      drawer: AppDrawer(),
      body: dogData.favouriteDogsList.length == 0
          ? Center(child: Text('No favourite'))
          : ListView.builder(
              itemCount: dogData.favouriteDogsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: dogData.isLoading == true
                      ? CircularProgressIndicator()
                      : Text(dogData.favouriteDogsList[index].facts[index]),
                );
              }),
    );
  }
}
