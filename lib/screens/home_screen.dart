import 'package:dog_facts_app/providers/dog_fact_provider.dart';
import 'package:dog_facts_app/screens/detail_screen.dart';
import 'package:dog_facts_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final dogData = context.read<DogFactProvider>();
    dogData.getDogFacts().then((_) {
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final dogData = context.watch<DogFactProvider>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Facts about the dogs'),
        ),
        drawer: AppDrawer(),
        body: dogData.isLoading == true
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: dogData.dogFactsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Card(
                      child: Text(dogData.dogFactsList[index]),
                    ),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(textFact: dogData.dogFactsList[index],),
                          ));
                    },
                  );
                }));
  }
}
