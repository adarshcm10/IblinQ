import 'package:flutter/material.dart';

class SelectableImageButton extends StatelessWidget {
  final String imagePath;
  final bool isSelected;
  final VoidCallback onPressed;

  const SelectableImageButton({
    super.key,
    required this.imagePath,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: SizedBox(
        width: 75,
        height: 75,
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? Colors.white30 : Colors.transparent,
                width: 2.0,
                //border radius 10
                // borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Image.asset(imagePath),
          ),
        ),
      ),
    );
  }
}
