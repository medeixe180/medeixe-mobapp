import 'package:flutter/material.dart';
import 'package:me_deixe/src/views/Onboard/on_board_view.dart';
import 'package:me_deixe/src/views/help/help_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MeDeixeApp extends StatefulWidget {
  const MeDeixeApp({Key? key}) : super(key: key);

  @override
  State<MeDeixeApp> createState() => _MeDeixeAppState();
}

class _MeDeixeAppState extends State<MeDeixeApp> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<bool> _presented;

  Future<void> _onboardViewPresent() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('OnboardViewPresented', true);
  }

  @override
  void initState() {
    super.initState();
    _presented = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool("OnboardViewPresented") ?? false;
    });
    _presented.then((value) => print(value.toString()));
  }

  // void presentOnboardView() async{
  //   final prefs = await SharedPreferences.getInstance();
  //   _presented = prefs.getBool("OnboardViewPresented");
  //
  //   if (_presented == null) {
  //     prefs.setBool("OnboardViewPresented", false);
  //   }
  //
  //   if (_presented == ) {
  //     setState(() {
  //       _presented = false;
  //     });
  //   } else {
  //     setState(() {
  //       _presented = true;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<bool>(
        future: _presented,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.data == null || snapshot.data == false) {
            _onboardViewPresent();
            return const OnBoardView();
          } else {
            return const HelpView();
          }
        },
      ),
    );
  }
}
