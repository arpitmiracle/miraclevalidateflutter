import 'package:flutter/material.dart';
import 'package:miraclevalidateflutter/FormValidation/MiracleFormValidation.dart';

class FormValidationScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Validation"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder()
                ),
                controller: emailController,
                validator: (value) {
                  return MiracleFormValidation.validateForm(email: value!)[ErrorMessageType.email];
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Phone",
                  border: OutlineInputBorder(),
                ),
                controller: phoneController,
                validator: (value) {
                  return MiracleFormValidation.validateForm(phone: value!)[ErrorMessageType.phone];
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if(formKey.currentState!.validate()){

                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}