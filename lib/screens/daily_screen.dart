import 'package:flutter/material.dart';
import 'package:weather_app/screens/places_screen.dart';

import '../main.dart';
import 'hourly_screen.dart';

class DailyForecast extends StatelessWidget {
  final appTitle = 'Daily Forecast';
  const DailyForecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyHomePage1(title: appTitle),
    ); // MaterialApp
  }
}

class MyHomePage1 extends StatelessWidget{
  final String title;

  const MyHomePage1({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,style: const TextStyle(color: Colors.black87)),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black87),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  "Weather App",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text(""),
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
             ListTile(
              title: const Text('Home'),
                onTap: () async {
                  String? result = await Navigator.push(
                    context,
                    MaterialPageRoute<String>(
                      builder: (context) =>  const MyHomePage(title: 'Weather App',),
                    ),
                  );
                }
            ),
            ListTile(
                title: const Text('Hourly Forecast'),
                onTap: () async {
                  // dynamic result = await Navigator.pushNamed(context, '/contact_us_screen');
                  String? result = await Navigator.push(
                    context,
                    MaterialPageRoute<String>(
                      builder: (context) => const HourlyForecast(),
                    ),
                  );
                }
            ),
            ListTile(
                title: const Text('Daily Forecast'),
                onTap: () async {
                  // dynamic result = await Navigator.pushNamed(context, '/contact_us_screen');
                  String? result = await Navigator.push(
                    context,
                    MaterialPageRoute<String>(
                      builder: (context) => const DailyForecast(),
                    ),
                  );
                }
            ),
            ListTile(
                title: const Text('Places'),
                onTap: () async {
                  // dynamic result = await Navigator.pushNamed(context, '/contact_us_screen');
                  String? result = await Navigator.push(
                    context,
                    MaterialPageRoute<String>(
                      builder: (context) => const PlacesScreen(),
                    ),
                  );
                }
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 6,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text('Day $index'),
              leading: Icon(Icons.sunny),
              subtitle: Text('High: 30C \n Low:20C'),
            ),
          );
        },
      )
//Drawer
    );
  }
}

