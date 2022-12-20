import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PulsatingCircleButton extends StatefulWidget {
  const PulsatingCircleButton({Key? key}) : super(key: key);

  @override
  State<PulsatingCircleButton> createState() => _PulsatingCircleButtonState();
}

class _PulsatingCircleButtonState extends State<PulsatingCircleButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween(begin: 0.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () {},
      onTapDown: (details) {
        setState(() {
          _animation = Tween(begin: 0.0, end: 12.0).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeOut,
            ),
          );
        });
      },
      onTapUp: (details) {
        setState(() {
          _animation = Tween(begin: 0.0, end: 0.0).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeOut,
            ),
          );
        });
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: ((context, child) {
          return Ink(
            padding: const EdgeInsets.all(48),
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              shape: BoxShape.circle,
              boxShadow: [
                for (int i = 1; i <= 3; i++)
                  BoxShadow(
                    color: Colors.pinkAccent
                        .withOpacity(_animationController.value / 2),
                    spreadRadius: _animation.value * i,
                  )
              ],
            ),
            child: const Icon(
              Icons.emergency,
              size: 128,
              color: Colors.white,
            ),
          );
        }),
      ),
    );
  }
}
