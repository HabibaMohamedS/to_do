import 'package:flutter/material.dart';
import 'dart:async';

import 'package:to_do/list.dart';
import 'package:to_do/modalForm.dart';
import 'package:to_do/settingsTab.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const routeName = '/homePage';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SecondScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.primary,
        child: Image.asset('images/logo.png'));
  }
}

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int index = 0;
  List<Widget> tabs = [list(), settingsTab()];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          foregroundColor: Colors.transparent,
          title: Text(
            "TO DO List",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Column(
          children: [
            Expanded(child: SingleChildScrollView(child: tabs[index])),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(side: BorderSide(color: Colors.white, width: 4)),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return modalForm();
                });
          },
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.onBackground,
            size: 30,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          //surfaceTintColor: Theme.of(context).colorScheme.onBackground,
          shape: const CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                index = value;
                setState(() {});
              },
              showUnselectedLabels: false,
              selectedItemColor: Theme.of(context).colorScheme.secondary,
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('images/icon_list.png')),
                    label: 'list'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('images/icon_settings.png')),
                    label: 'settings'),
              ]),
        ),
      ),
    );
  }
}
