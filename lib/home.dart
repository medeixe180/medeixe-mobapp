import 'package:me_deixe/src/components/pulsating_circle_button/pulsating_circle_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Scaffold(
        /*appBar: AppBar(
          backgroundColor: const Color.fromARGB(250, 162, 24, 90),
        ),*/
        body: Stack(
          children: [
            const Center(
              child: PulsatingCircleButton(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 90,
                          width: 90,
                          child: Image.asset(
                            "assets/images/soco2.png",
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 90,
                          width: 90,
                          child: Image.asset(
                            "assets/images/faca.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 90,
                          width: 90,
                          child: Image.asset(
                            "assets/images/grito2.png",
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 90,
                          width: 90,
                          child: Image.asset(
                            "assets/images/arminha2.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
