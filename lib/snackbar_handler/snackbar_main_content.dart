import 'package:custom_snack_bar/snackbar_handler/snackbar_style.dart';
import 'package:flutter/material.dart';

class SnackbarMainContent extends StatelessWidget {
  final SnackbarStyle style;
  final String message;
  final Function? onCloseButtonPressed;
  const SnackbarMainContent(
      {required this.style,
      required this.message,
      required this.onCloseButtonPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: style.displayBackgroundColor,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 17, bottom: 17),
              child: Text(
                message,
                style: TextStyle(color: style.displayTitleColor),
              ),
            ),
          ),
          Visibility(
            visible: style.isCloseButtonVisible,
            child: IconButton(
              onPressed: () {
                onCloseButtonPressed?.call();
              },
              icon: const Icon(Icons.close),
              color: style.displayTitleColor,
            ),
          )
        ],
      ),
    );
  }
}
