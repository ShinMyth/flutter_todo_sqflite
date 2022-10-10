import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

showSharedDialog({
  required BuildContext context,
  required bool barrierDismissible,
  required Widget title,
  required Widget content,
  void Function()? actionFunction1,
  Widget? actionLabel1,
  void Function()? actionFunction2,
  Widget? actionLabel2,
  void Function()? actionFunction3,
  Widget? actionLabel3,
}) {
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Platform.isAndroid
            ? AlertDialog(
                title: title,
                content: content,
                actions: [
                  if (actionLabel1 != null && actionFunction1 != null) ...[
                    TextButton(
                      onPressed: actionFunction1,
                      child: actionLabel1,
                    ),
                  ],
                  if (actionLabel2 != null && actionFunction2 != null) ...[
                    TextButton(
                      onPressed: actionFunction2,
                      child: actionLabel2,
                    ),
                  ],
                  if (actionLabel3 != null && actionFunction3 != null) ...[
                    TextButton(
                      onPressed: actionFunction3,
                      child: actionLabel3,
                    ),
                  ],
                ],
              )
            : CupertinoAlertDialog(
                title: title,
                content: content,
                actions: [
                  if (actionLabel1 != null && actionFunction1 != null) ...[
                    CupertinoDialogAction(
                      onPressed: actionFunction1,
                      child: actionLabel1,
                    ),
                  ],
                  if (actionLabel2 != null && actionFunction2 != null) ...[
                    CupertinoDialogAction(
                      onPressed: actionFunction2,
                      child: actionLabel2,
                    ),
                  ],
                  if (actionLabel3 != null && actionFunction3 != null) ...[
                    CupertinoDialogAction(
                      onPressed: actionFunction3,
                      child: actionLabel3,
                    ),
                  ],
                ],
              ),
      );
    },
  );
}