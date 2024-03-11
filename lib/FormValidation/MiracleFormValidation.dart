class MiracleFormValidation {

  Map<String, String> validateForm(
      String userID,
      String firstName,
      String lastName,
      String phone,
      String email,
      String pass1,
      String pass2,
      String zip,
      ) {
    Map<String, String> errors = {};

    if (!RegExp(r'^[a-zA-Z0-9]*$').hasMatch(userID)) {
      errors["user_id"] = "Invalid User ID";
    } else {
      errors["user_id"] = "";
    }

    if (!RegExp(r'^[a-zA-Z]*$').hasMatch(firstName)) {
      errors["first_name"] = "Invalid First Name";
    } else {
      errors["first_name"] = "";
    }

    if (!RegExp(r'^[a-zA-Z]*$').hasMatch(lastName)) {
      errors["last_name"] = "Invalid Last Name";
    } else {
      errors["last_name"] = "";
    }

    if (!RegExp(r'^[0-9]*$').hasMatch(phone)) {
      errors["phone"] = "Invalid Phone Number";
    } else {
      errors["phone"] = "";
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      errors["email"] = "Invalid Email ID";
    } else {
      errors["email"] = "";
    }

    if (pass1.length < 6) {
      errors["pass1"] = "Password must be at least 6 characters";
    } else {
      errors["pass1"] = "";
    }

    if (pass1 != pass2) {
      errors["pass2"] = "Passwords do not match";
    } else {
      errors["pass2"] = "";
    }

    if (!RegExp(r'^[0-9]*$').hasMatch(zip)) {
      errors["zip"] = "Invalid ZIP Code";
    } else {
      errors["zip"] = "";
    }

    return errors;
  }

}