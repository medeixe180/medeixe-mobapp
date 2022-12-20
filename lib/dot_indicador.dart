import 'package:flutter/material.dart';
import 'package:me_deixe/src/res/colors.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    required this.index,
    required this.idx,
    Key? key,
  }) : super(key: key);
  final int index, idx;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 2000),
      height: (index == idx) ? 15 : 5,
      width: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color:
            (index == idx) ? magentaPantone : magentaPantone.withOpacity(0.5),
      ),
    );
  }
}
