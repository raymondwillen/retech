import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:retech/resources/colors.dart';
import 'package:retech/resources/strings.dart';

class Methods {
  static Future<bool> checkConnection() async {
    try {
      final ConnectivityResult connectivityResult =
          (await Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        return true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static getEditInputTextDecoration(String label) {
    return InputDecoration(
      filled: true,
      label: Text(label,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500)),
      alignLabelWithHint: true,
      hintText: label,
      fillColor: Colors.white,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 1.5,
          color: Colors.black,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 1.5,
          color: ColorsApp.secondary,
        ),
      ),
    );
  }

  static getEditInputPasswordTextDecoration(
      String label, bool isPasswordVisible, Function onPressed) {
    return InputDecoration(
      filled: true,
      label: Text(label,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500)),
      alignLabelWithHint: true,
      hintText: label,
      fillColor: Colors.white,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 1.5,
          color: Colors.black,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          width: 1.5,
          color: ColorsApp.secondary,
        ),
      ),
      suffixIcon: IconButton(
        icon: Icon(
          isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          color: Colors.black,
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }

  static bool validateEmail(String email) {
    RegExp regex =
        RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)'
            r'|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
            r'\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+'
            r'[a-zA-Z]{2,}))$');
    return regex.hasMatch(email);
  }

  static showSnackBar(
      BuildContext context, String message, String type, int duration) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: type == "success"
            ? Colors.green
            : type == "error"
                ? Colors.red
                : type == "warning"
                    ? Colors.orange
                    : ColorsApp.secondary,
        duration: Duration(seconds: duration),
      ),
    );
  }

  static showLoaderDialog(BuildContext context, String message) {
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 20),
          Center(child: Text(message)),
        ],
      ),
    );
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showAlertDialog(
      BuildContext context, String type, String message, Function onPressed) {
    AlertDialog alert = AlertDialog(
      backgroundColor: ColorsApp.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            type == "success"
                ? Icons.check_circle
                : type == "error"
                    ? Icons.error
                    : type == "warning"
                        ? Icons.warning
                        : Icons.info,
            color: type == "success"
                ? Colors.green
                : type == "error"
                    ? Colors.red
                    : type == "warning"
                        ? Colors.orange
                        : ColorsApp.secondary,
            size: 70,
          ),
          const SizedBox(height: 20),
          Center(child: Text(message)),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            onPressed();
          },
          child: const SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(
                Strings.ok,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
