 import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dialog Title'),
          content: Text('This is the content of the dialog.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the dialog when the button is pressed
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
 }