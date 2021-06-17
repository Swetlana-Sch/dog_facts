import 'package:dog_facts_app/models/dog_fact_model.dart';
import 'package:dog_facts_app/providers/dog_fact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
final String textFact;
// final DogFactModel dogFactModel;
  static const routeName = '/detail_screen';

  // const DetailScreen({Key key, this.dogFactModel}) : super(key: key);

  const DetailScreen({Key key, this.textFact}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final dogData = context.watch<DogFactProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Column(
        children: [
          Center(child: Text(textFact)),
          IconButton(
            icon: Icon(
              dogData.isFavourite(dogData.dogFact) == true
                ? Icons.favorite
               : Icons.favorite_outline),
            onPressed: (){
              print('Icon pressed');
              dogData.addToFavouriteFact(dogData.dogFact);
            },
          )
        ],
      ),
    );
  }
}
