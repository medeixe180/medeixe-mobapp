import 'package:flutter/material.dart';
import 'package:me_deixe/src/res/colors.dart';
import 'package:me_deixe/src/views/home/home_view.dart';
import './home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './dot_indicador.dart';
import './error_dialog.dart';

class OnBoardContent extends StatelessWidget {
  final PageController control;
  final int idx, lenth;
  final String imagem, description, funcionalidade;

  const OnBoardContent({
    Key? key,
    required this.description,
    required this.funcionalidade,
    required this.imagem,
    required this.control,
    required this.idx,
    required this.lenth,
  }) : super(key: key);

  void removeSave() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("apresentacao_concluida", false);
  }

  void saveConclusao() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("apresentacao_concluida", true);
  }

// lower_case, Upercase, camelCase

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 7,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10,
            ),
            TextButton(
                onPressed: () => {
                      showAlertDialog(
                        context,
                        "Tem certeza que deseja pular a introdução?",
                        "Cancelar",
                        "Continuar",
                        () => {},
                      ),
                    },
                child: Text(
                  "Pular",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 17,
                  ),
                )),
          ],
        ),
        const Spacer(),
        SizedBox(
          height: 300,
          width: 300,
          child: Image.asset(
            imagem,
          ),
        ),
        const Spacer(),
        Text(
          funcionalidade,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          width: double.infinity,
          height: 220,
          child: Column(
            children: <Widget>[
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black.withOpacity(1),
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ...List.generate(
              lenth,
              (index) => Padding(
                padding: const EdgeInsets.all(1),
                child: DotIndicator(index: index, idx: idx),
              ),
            ),
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Spacer(),
            SizedBox(
              //290
              width: 290,
              height: 50,
              child: ElevatedButton(
                onPressed: (idx < lenth - 1)
                    ? () => {
                          control.nextPage(
                            duration: const Duration(microseconds: 200),
                            curve: Curves.ease,
                          ),
                        }
                    : () => {
                          saveConclusao(),
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomeView()))
                        },
                child: (idx < lenth - 1)
                    ? const Text("Próximo", style: TextStyle(fontSize: 18))
                    : const Text("Finalizar", style: TextStyle(fontSize: 18)),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    magentaPantone,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
        const Spacer(),
        const Spacer(),
      ],
    );
  }
}




// import 'package:flutter/material.dart';
// import './home.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import './dot_indicador.dart';

// class OnBoardContent extends StatelessWidget {
//   final PageController control;
//   final int idx, lenth;
//   final String imagem, description, funcionalidade;

//   const OnBoardContent({
//     Key? key,
//     required this.description,
//     required this.funcionalidade,
//     required this.imagem,
//     required this.control,
//     required this.idx,
//     required this.lenth,
//   }) : super(key: key);

//   // void removeSave() async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   prefs.setBool("apresentacao_concluida", false);
//   //   // print(prefs.getBool("apresentacao_concluida"));
//   // }

//   void saveConclusao() async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setBool("apresentacao_concluida", true);
//   }

// // lower_case, Upercase, camelCase

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: <Widget>[
//         const SizedBox(
//           height: 7,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const SizedBox(
//               width: 10,
//             ),
//             TextButton(
//                 onPressed: () => {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                             builder: (context) => const HomePage()),
//                       ),
//                     },
//                 child: Text(
//                   "pular",
//                   style: TextStyle(
//                     color: Colors.black.withOpacity(0.4),
//                     fontSize: 16,
//                   ),
//                 )),
//           ],
//         ),
//         const Spacer(),
//         SizedBox(
//           child: SizedBox(
//             height: 450,
//             width: double.infinity,
//             child: Image.asset(
//               imagem,
//             ),
//           ),
//         ),
//         Text(
//           funcionalidade,
//           style: TextStyle(
//               fontSize: 25,
//               fontWeight: FontWeight.w500,
//               color: Colors.black.withOpacity(0.7)),
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//           width: double.infinity,
//           height: 150,
//           child: Text(
//             description,
//             textAlign: TextAlign.center,
//             style: TextStyle(color: Colors.black.withOpacity(0.5)),
//           ),
//         ),
//         Column(
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 ...List.generate(
//                   lenth,
//                   (index) => Padding(
//                     padding: const EdgeInsets.all(1),
//                     child: DotIndicator(index: index, idx: idx),
//                   ),
//                 ),
//               ],
//             ),
//             const Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 const Spacer(),
//                 SizedBox(
//                   //290
//                   width: 290,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: (idx < lenth - 1)
//                         ? () => {
//                               control.nextPage(
//                                 duration: const Duration(microseconds: 200),
//                                 curve: Curves.ease,
//                               ),
//                             }
//                         : () => {
//                               saveConclusao(),
//                               Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                     builder: (context) => const HomePage()),
//                               ),
//                             },
//                     child: (idx < lenth - 1)
//                         ? const Text("próximo", style: TextStyle(fontSize: 16))
//                         : const Text("finalizar",
//                             style: TextStyle(fontSize: 16)),
//                     style: ButtonStyle(
//                       shape: MaterialStateProperty.all(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(24),
//                         ),
//                       ),
//                       backgroundColor: MaterialStateProperty.all<Color>(
//                         const Color.fromARGB(255, 246, 138, 174),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//               ],
//             ),
//           ],
//         ),
//         const Spacer(),
//         const Spacer(),
//       ],
//     );
//   }
// }