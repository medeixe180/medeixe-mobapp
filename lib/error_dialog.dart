import 'package:flutter/material.dart';
import 'package:me_deixe/src/views/home/home_view.dart';
import './home.dart';

showAlertDialog(BuildContext context, String error, String buttonText,
    String buttonTypes, Function okAction) {
  Widget okButton = Builder(
    builder: (context) => SizedBox(
      width: (buttonTypes == "Ok") ? double.infinity : 190,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.blue.shade100)),
        child: Text(
          buttonText,
          style: const TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        onPressed: () => {
          Navigator.of(context).pop(),
        },
      ),
    ),
  );
  Widget cancelButton = Builder(
    builder: (context) => SizedBox(
      width: (buttonTypes == "Ok") ? double.infinity : 130,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.blue.shade100)),
        child: const Text(
          "pular",
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const HomeView(),
            ),
          );
        },
      ),
    ),
  );

  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      actionsPadding: const EdgeInsets.all(10),
      insetPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      content: Text(
        error,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      ),
      actions: (buttonTypes == "Ok")
          ? [
              okButton,
            ]
          : [
              okButton,
              cancelButton,
            ]);
  //exibe o diálogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
