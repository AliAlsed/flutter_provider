import 'package:flutter/material.dart';
import 'package:flutterproveder/network_helpers/auth_api.dart';
import 'package:flutterproveder/network_helpers/food_api.dart';
import 'package:flutterproveder/notifier/auth_notifier.dart';
import 'package:flutterproveder/notifier/food_notifier.dart';
import 'package:flutterproveder/screens/foodDetail.dart';
import 'package:provider/provider.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  void initState() {
    AuthNotifier notifier = Provider.of<AuthNotifier>(context, listen: false);
    FoodNotifier foodNotifier =
        Provider.of<FoodNotifier>(context, listen: false);

    getFoods(foodNotifier);
    initializeCurrentUser(notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier notifier = Provider.of<AuthNotifier>(context, listen: false);
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            notifier.user != null ? notifier.user.displayName : "Feed",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          actions: <Widget>[
            // action button
            FlatButton(
              onPressed: () {
                signout(notifier);
              },
              child: Text(
                "Logout",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  foodNotifier.selectedFood = foodNotifier.foodList[index];
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FoodDetail()));
                },
                leading: Image.network(
                  foodNotifier.foodList[index].image,
                  width: 120,
                  fit: BoxFit.fitWidth,
                ),
                title: Text(foodNotifier.foodList[index].name),
                subtitle: Text(foodNotifier.foodList[index].category),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.black,
              );
            },
            itemCount: foodNotifier.foodList.length));
  }
}
