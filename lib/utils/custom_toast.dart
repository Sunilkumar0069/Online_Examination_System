import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void show({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      fontSize: 14.0,
    );
  }
}
