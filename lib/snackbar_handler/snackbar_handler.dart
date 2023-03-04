import 'package:custom_snack_bar/snackbar_handler/snackbar_position.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'snackbar_content.dart';
import 'snackbar_overlay.dart';
import 'snackbar_style.dart';

class SnackbarHandler {
  final List<SnackbarOverlay> _overlays = [];
  static final SnackbarHandler _instance = SnackbarHandler._internal();
  factory SnackbarHandler() {
    return _instance;
  }

  SnackbarHandler._internal();

  void showOverlay(BuildContext context,
      {required String text,
      required SnackbarStyle style,
      required SnackbarPosition position}) async {
    if (text.isEmpty) {
      return;
    }
    OverlayState? overlayState = Overlay.of(context);
    final overlay = SnackbarOverlay(id: const Uuid().v4());
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return SnackBarContent(
        overlay: overlay,
        message: text,
        style: style,
        position: position,
        onCloseClicked: (currentOverlay) {
          _removeOverlay(currentOverlay);
        },
      );
    });
    overlay.overlay = overlayEntry;
    _overlays.add(overlay);
    overlayState?.insert(overlayEntry);
  }

  _removeOverlay(SnackbarOverlay overlay) {
    overlay.overlay.remove();
    _overlays.removeWhere((element) => element.id == overlay.id);
  }
}
