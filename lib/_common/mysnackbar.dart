import 'package:flutter/material.dart';

showSnackBar(
    {required BuildContext context, required String msg, bool isErro = true}) {
  SnackBar snackBar = SnackBar(
    content: Text(msg),
    backgroundColor: (isErro) ? Colors.redAccent[700] : Colors.greenAccent[700],
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
    duration: const Duration(seconds: 4),
    action: SnackBarAction(
      label: "OK",
      textColor: Colors.white,
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
