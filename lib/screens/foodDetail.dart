import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterproveder/notifier/food_notifier.dart';
import 'package:provider/provider.dart';

class FoodDetail extends StatefulWidget {
  FoodDetail({Key key}) : super(key: key);

  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(foodNotifier.selectedFood.name),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Image.network(
                foodNotifier.selectedFood.image,
                height: height * 0.30,
                width: width,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: height * 0.035,
              ),
              Text(
                foodNotifier.selectedFood.name,
                style: TextStyle(fontSize: 40),
              ),
              Text(
                foodNotifier.selectedFood.category,
                style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                children: foodNotifier.selectedFood.subIngradients
                    .map((ingridents) => Card(
                          color: Colors.black38,
                          child: Center(
                            child: Text(
                              ingridents,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
