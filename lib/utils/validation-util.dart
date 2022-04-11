import 'package:practical/utils/string-utils.dart';

class ValidationUtil {

  String? validateField(String value, String errorMessage) {
    if (value.isEmpty) {
      return errorMessage;
    }
    return null;
  }
}
