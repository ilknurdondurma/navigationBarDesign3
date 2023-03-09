
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'addRecord.dart';
import 'grafScreen.dart';
import 'historyScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //theme:ThemeData(brightness: Brightness.dark,appBarTheme: AppBarTheme(color: Colors.black),bottomAppBarColor: Colors.black,primaryColor: Colors.black,accentColor: Colors.black,bottomNavigationBarTheme: BottomNavigationBarThemeData()),
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.black)),
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int current_index = 0;
  Widget currentScreen = historyScreen();
  final List<Widget> pages = [historyScreen(), grafScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentScreen,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => addRecord());
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [Icons.history, Icons.auto_graph],
        activeIndex: current_index,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        backgroundColor: Colors.black,
        inactiveColor: Colors.grey,
        activeColor: Colors.white,
        onTap: (index) {
          setState(() {
            current_index = index;
            currentScreen = pages[index];
          });
          print(index);
        },
        //other params
      ),
    );
  }
}
