import 'package:flutter/material.dart';
import '../../../item_page.dart';
import '../../../models/on_board_itens.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  List<OnBoardItens> itens = [
    OnBoardItens(
      "Como pedir ajuda?",
      "Você tem acesso a quatro botões, que indicam o tipo de ameaça que está sofrendo. Escolha um botão, aperte e segure-o até que um pedido de ajuda seja enviado.",
      "assets/images/print_botoes.png",
    ),
    OnBoardItens(
      "Uso da localização",
      "Para que esse aplicativo funcione corretamente, a função de localização do seu smartphone estará sendo utilizada. Isso garante que a ajuda chegue mais rapidamente.",
      "assets/images/iconeMapa.png",
    ),
  ];

  late PageController _pagecontroller;

  @override
  void initState() {
    _pagecontroller = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    _pagecontroller.dispose();
    super.dispose();
  }

  late int idx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                controller: _pagecontroller,
                itemCount: itens.length,
                itemBuilder: (context, index) => OnBoardContent(
                  description: itens[index].descricao,
                  funcionalidade: itens[index].funcionalidade,
                  control: _pagecontroller,
                  imagem: itens[index].imgAdress,
                  idx: index,
                  lenth: itens.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
