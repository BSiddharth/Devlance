import 'dart:convert';
import 'package:devlance_internship/models/profile_data.dart';
import 'package:devlance_internship/widget.dart/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
          actionsIconTheme: IconThemeData(color: Colors.black),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> fetchData() async {
    setState(() {
      homeWidget = const LoadingWidget();
    });
    try {
      final http.Response data =
          await http.get(Uri.parse('https://randomuser.me/api/'));

      final ProfileData profileData =
          ProfileData.fromJson(jsonDecode(data.body)['results'][0]);
      homeWidget = ProfileWidget(profileData: profileData);
    } catch (e) {
      homeWidget = FailedWidget(onTapFunction: fetchData);
    }
    setState(() {});
  }

  Widget homeWidget = const LoadingWidget();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Devlance Internship'),
        elevation: 0,
        actions: [
          homeWidget is ProfileWidget
              ? IconButton(
                  onPressed: fetchData, icon: const Icon(Icons.refresh))
              : Container()
        ],
      ),
      body: homeWidget,
    );
  }
}
