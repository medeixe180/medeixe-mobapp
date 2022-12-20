import 'dart:async';
import 'package:flutter/material.dart';

class PulsatingButton extends StatefulWidget {
  const PulsatingButton({Key? key}) : super(key: key);

  @override
  State<PulsatingButton> createState() => _PulsatingButtonState();
}

class _PulsatingButtonState extends State<PulsatingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Timer _timer;

  void _startSencondsCounter() {
    _timer = Timer(
      const Duration(seconds: 5),
      () {
        print("enviar pedido de ajuda!");
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    _animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 140,
        width: 140,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () => {},
          child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, _) {
                return GestureDetector(
                  onTapDown: (_) {
                    _startSencondsCounter();
                  },
                  onTapUp: (_) {
                    _timer.cancel();
                  },
                  child: Ink(
                    padding: const EdgeInsets.all(2),
                    child: const Icon(
                      Icons.circle,
                      color: Color.fromARGB(255, 155, 161, 163),
                      size: 60,
                    ),
                  ),
                );
              }),
        ));
  }
}
