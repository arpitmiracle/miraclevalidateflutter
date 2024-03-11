class MiracleFormValidation {

  static Map<String, dynamic> validateForm({
    String userID = "",
    String firstName = "",
    String lastName = "",
    String phone = "",
    String email = "",
    String pass1 = "",
    String pass2 = "",
    String zip = "",
  }) {
    Map<String, dynamic> errors = {};

    if (!RegExp(r'^[a-zA-Z0-9]*$').hasMatch(userID)) {
      errors[ErrorMessageType.userId] = "Invalid User ID";
    } else {
      errors[ErrorMessageType.userId] = null;
    }

    if (!RegExp(r'^[a-zA-Z]*$').hasMatch(firstName)) {
      errors[ErrorMessageType.firstName] = "Invalid First Name";
    } else {
      errors[ErrorMessageType.firstName] = null;
    }

    if (!RegExp(r'^[a-zA-Z]*$').hasMatch(lastName)) {
      errors[ErrorMessageType.lastName] = "Invalid Last Name";
    } else {
      errors[ErrorMessageType.lastName] = null;
    }

    if (!RegExp(r'^[0-9]*$').hasMatch(phone)) {
      errors[ErrorMessageType.phone] = "Invalid Phone Number";
    } else {
      errors[ErrorMessageType.phone] = null;
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      errors[ErrorMessageType.email] = "Invalid Email ID";
    } else {
      errors[ErrorMessageType.email] = null;
    }

    if (pass1.length < 6) {
      errors[ErrorMessageType.pass1] = "Password must be at least 6 characters";
    } else {
      errors[ErrorMessageType.pass1] = null;
    }

    if (pass1 != pass2) {
      errors[ErrorMessageType.pass2] = "Passwords do not match";
    } else {
      errors[ErrorMessageType.pass2] = null;
    }

    if (!RegExp(r'^[0-9]*$').hasMatch(zip)) {
      errors[ErrorMessageType.zip] = "Invalid ZIP Code";
    } else {
      errors[ErrorMessageType.zip] = null;
    }

    return errors;
  }

}

class ErrorMessageType {
  static const String email = "email";
  static const String userId = "userId";
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String phone = "phone";
  static const String pass1 = "pass1";
  static const String pass2 = "pass2";
  static const String zip = "zip";
}