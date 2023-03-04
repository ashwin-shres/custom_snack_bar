import 'package:flutter/material.dart';

enum SnackbarStyle { error, success, normal }

extension SnackbarStyleExtension on SnackbarStyle {
  Color get displayTitleColor {
    switch (this) {
      case SnackbarStyle.error:
        return Colors.white;
      case SnackbarStyle.success:
        return Colors.white;
      case SnackbarStyle.normal:
        return Colors.white;
    }
  }

  Color get displayBackgroundColor {
    switch (this) {
      case SnackbarStyle.error:
        return Colors.red;
      case SnackbarStyle.success:
        return Colors.green;
      case SnackbarStyle.normal:
        return Colors.black;
    }
  }

  bool get isCloseButtonVisible {
    switch (this) {
      case SnackbarStyle.error:
        return false;
      case SnackbarStyle.success:
        return false;
      case SnackbarStyle.normal:
        return false;
    }
  }
}
