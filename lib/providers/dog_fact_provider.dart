import 'dart:convert';

import 'package:dog_facts_app/models/dog_fact_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:short_uuids/short_uuids.dart';
import 'package:http/http.dart' as http;

class DogFactProvider with ChangeNotifier {
  DogFactModel dogFact;
  List<String> dogFactsList = [];
  List<DogFactModel> favouriteDogsList = [];
  bool isLoading;
  final shortId = ShortUuid();

  Future<void> getDogFacts() async {
    isLoading = true;
    final url = 'https://dog-api.kinduff.com/api/facts?number=10';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final dogFactDecoded = jsonDecode(response.body)['facts'];
        print('Dog Fact decoded: $dogFactDecoded');
      dogFactsList = List<String>.from(dogFactDecoded);
        print('dogfact: $dogFactsList');
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> getDogFact() async {
    isLoading = true;
    final url = 'https://dog-api.kinduff.com/api/facts?number=10';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final dogFactDecoded = jsonDecode(response.body)['facts'];
       dogFact = DogFactModel.fromJson(dogFactDecoded, shortId.generate());
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      print('Error: $e');
    }
  }

bool isFavourite(DogFactModel dogFact){
    return favouriteDogsList.contains(dogFact);
}

void addToFavouriteFact (DogFactModel newFavFact){
    print('RT newFavFact: ${newFavFact.runtimeType}');
    final foundQuote = favouriteDogsList.firstWhere((currentFact) => currentFact.factId == newFavFact.factId, orElse:  () => null);
    if (foundQuote == null) {
      favouriteDogsList.add(newFavFact);
    } else {
      favouriteDogsList.remove(newFavFact);
    }
    notifyListeners();
}
}
