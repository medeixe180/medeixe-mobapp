//import 'dart:ffi';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:me_deixe/error_dialog.dart';
import 'package:me_deixe/gps.dart';
import 'package:me_deixe/src/res/colors.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class HelpView extends StatefulWidget {
  const HelpView({Key? key}) : super(key: key);

  @override
  State<HelpView> createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  late Timer timerController;
  int precionado = 0;
  static int totalMillisecondsTime = 3000;
  int milliseconds = 0;

  void _startSencondsCounter(int tipoDePedido, final location) {
    timerController = Timer.periodic(
      const Duration(milliseconds: 50),
      (_) {
        if (milliseconds < totalMillisecondsTime) {
          setState(
            () {
              milliseconds += 50;
            },
          );
        } else {
          print("Enviar pedido do tipo $tipoDePedido");
          showAlertDialog(
            context,
            "Um pedido de ajuda foi enviado. Procure um lugar seguro para ficar até que a polícia chegue. \n Sua localização latitude e longitude é :\n(${location.lat}, ${location.long})\n",
            "OK",
            "Ok",
            () => {},
          );
          disposee();
        }
      },
    );
  }

  void disposee() {
    setState(() {
      timerController.cancel();
      milliseconds = 0;
      precionado = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/images/icon_with_text.png',
          fit: BoxFit.cover,
          height: 100,
        ),
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<LocationActived>(
        create: (context) => LocationActived(),
        child: Builder(builder: (context) {
          final location = context.watch<LocationActived>();
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                ),
                const Text(
                  "Atenção!",
                  style: TextStyle(
                    color: Color.fromARGB(255, 177, 7, 83),
                    fontWeight: FontWeight.w600,
                    fontSize: 28.0,
                  ),
                ),
                Container(
                  height: 15,
                ),
                LinearProgressIndicator(
                  value: milliseconds / totalMillisecondsTime,
                  minHeight: 15,
                  backgroundColor:
                      (precionado == 0) ? Colors.white : Colors.grey.shade300,
                  valueColor: const AlwaysStoppedAnimation<Color>(roseRed),
                ),
                Container(
                  height: 30,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: <Widget>[
                      InkWell(
                        onTapDown: (_) {
                          if (location.erro == '') {
                            _startSencondsCounter(1, location);
                            setState(
                              () {
                                precionado = 1;
                              },
                            );
                          } else {
                            if (location.erro == "locationAccessDenied") {
                              showAlertDialog(
                                context,
                                "Você precisa autorizar o acesso ao serviço de localização para este aplicativo",
                                "OK",
                                "Ok",
                                () => {},
                              );
                            } else {
                              showAlertDialog(
                                context,
                                "Você precisa ativar o serviço de localização do seu dispositivo",
                                "OK",
                                "Ok",
                                () => {},
                              );
                            }
                          }
                        },
                        onTapUp: (_) {
                          if (location.erro == '') {
                            disposee();
                          }
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:
                                (precionado == 1) ? roseRed : colorBackground,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 80,
                                width: 80,
                                child: Image.asset(
                                  "assets/images/grito.png",
                                ),
                              ),
                              Text(
                                "violência\n  Verbal",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.white.withOpacity(0.7),
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTapDown: (_) {
                          if (location.erro == '') {
                            _startSencondsCounter(2, location);
                            setState(
                              () {
                                precionado = 2;
                              },
                            );
                          } else {
                            if (location.erro == "locationAccessDenied") {
                              showAlertDialog(
                                context,
                                "Você precisa autorizar o acesso ao serviço de localização para este aplicativo",
                                "OK",
                                "Ok",
                                () => {},
                              );
                            } else {
                              showAlertDialog(
                                context,
                                "Você precisa ativar o serviço de localização do seu dispositivo",
                                "OK",
                                "Ok",
                                () => {},
                              );
                            }
                          }
                        },
                        onTapUp: (_) {
                          if (location.erro == '') {
                            disposee();
                          }
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:
                                (precionado == 2) ? roseRed : colorBackground,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 80,
                                width: 80,
                                child: Image.asset(
                                  "assets/images/soco_white.png",
                                ),
                              ),
                              Text(
                                "violência \n   física",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.white.withOpacity(0.8),
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTapDown: (_) {
                          if (location.erro == '') {
                            _startSencondsCounter(3, location);
                            setState(
                              () {
                                precionado = 3;
                              },
                            );
                          } else {
                            if (location.erro == "locationAccessDenied") {
                              showAlertDialog(
                                context,
                                "Você precisa autorizar o acesso ao serviço de localização para este aplicativo",
                                "OK",
                                "Ok",
                                () => {},
                              );
                            } else {
                              showAlertDialog(
                                context,
                                "Você precisa ativar o serviço de localização do seu dispositivo",
                                "OK",
                                "Ok",
                                () => {},
                              );
                            }
                          }
                        },
                        onTapUp: (_) {
                          if (location.erro == '') {
                            disposee();
                          }
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:
                                (precionado == 3) ? roseRed : colorBackground,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 80,
                                width: 80,
                                child: Image.asset(
                                  "assets/images/faca2.png",
                                ),
                              ),
                              Text(
                                " arma \nbranca",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.white.withOpacity(0.8),
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTapDown: (_) {
                          if (location.erro == '') {
                            _startSencondsCounter(4, location);
                            setState(
                              () {
                                precionado = 4;
                              },
                            );
                          } else {
                            if (location.erro == "locationAccessDenied") {
                              showAlertDialog(
                                context,
                                "Você precisa autorizar o acesso ao serviço de localização para este aplicativo",
                                "OK",
                                "Ok",
                                () => {},
                              );
                            } else {
                              showAlertDialog(
                                context,
                                "Você precisa ativar o serviço de localização do seu dispositivo",
                                "OK",
                                "Ok",
                                () => {},
                              );
                            }
                          }
                        },
                        onTapUp: (_) {
                          if (location.erro == '') {
                            disposee();
                          }
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:
                                (precionado == 4) ? roseRed : colorBackground,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 80,
                                width: 80,
                                child: Image.asset(
                                  "assets/images/arminha.png",
                                ),
                              ),
                              Text(
                                "  arma \nde fogo",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.white.withOpacity(0.7),
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          );
        }),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Text("Rodapé"),
      ),
    );
  }
}
