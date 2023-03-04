import 'package:custom_snack_bar/snackbar_handler/snackbar_main_content.dart';
import 'package:custom_snack_bar/snackbar_handler/snackbar_position.dart';
import 'package:flutter/material.dart';

import 'snackbar_overlay.dart';
import 'snackbar_style.dart';
import 'snackbar_constants.dart';

class SnackBarContent extends StatefulWidget {
  final SnackbarOverlay overlay;
  final String message;
  final SnackbarStyle style;
  final SnackbarPosition position;
  final Function(SnackbarOverlay)? onCloseClicked;
  const SnackBarContent(
      {required this.overlay,
      required this.message,
      required this.style,
      required this.position,
      this.onCloseClicked,
      super.key});

  @override
  State<SnackBarContent> createState() => _SnackBarContentState();
}

class _SnackBarContentState extends State<SnackBarContent> {
  bool _showsSnackbar = false;
  bool _hasShownSnackbar = false;
  Future? overlayRemoveFuture;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10)).whenComplete(() {
      setState(() {
        _showsSnackbar = true;
      });

      overlayRemoveFuture = Future.delayed(const Duration(
              seconds: SnackbarConstants.snackbarDuration, milliseconds: 510))
          .whenComplete(() {
        _closeNotification();
      });
    });
  }

  _closeNotification() {
    setState(() {
      _showsSnackbar = false;
    });
    _hasShownSnackbar = true;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: 10,
      right: 10,
      bottom: widget.position == SnackbarPosition.top
          ? null
          : (_showsSnackbar ? 50 : -100),
      top: widget.position == SnackbarPosition.top
          ? (_showsSnackbar ? 50 : -100)
          : null,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 500),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          color: Colors.transparent,
          child: _mainContent(),
        ),
      ),
      onEnd: () {
        if (_hasShownSnackbar) {
          widget.onCloseClicked?.call(widget.overlay);
        }
      },
    );
  }

  Widget _mainContent() {
    return SnackbarMainContent(
        style: widget.style,
        message: widget.message,
        onCloseButtonPressed: () {
          overlayRemoveFuture?.ignore();
          widget.onCloseClicked?.call(widget.overlay);
        });
  }
}
