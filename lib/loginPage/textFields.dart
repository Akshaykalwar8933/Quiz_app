import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/loginPageProvider.dart';

// Text Field for Email.....................................
Widget textFieldEmail() {
  return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Consumer<LoginPageProvider>(
        builder: (context, providerValue, child) {
          return TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: inputTextDecoration("Email",iconvalue:null),
              onChanged: (value) {
                providerValue.emailNotifier(value);
              },
              style: textStyleLabel());
        },
      ));
}

// Text Field for password.....................................
Widget textFieldPassword(bool pass) {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Consumer<LoginPageProvider>(
      builder: (context, providerValue, child) {
        return TextFormField(
          keyboardType: TextInputType.visiblePassword,

          obscureText: pass,
          style: textStyleLabel(),
          decoration: inputTextDecoration("Password",iconvalue: Icons.visibility),
          onChanged: (value) {
            providerValue.passwordNotifier(value);
          },
        );
      },
    ),
  );
}

// Input Decoration for above TextFormFields.....................
InputDecoration inputTextDecoration(String value,{required iconvalue}) {
 
  return InputDecoration(
    contentPadding: const EdgeInsets.all(20),
    labelText: value,
    labelStyle: textStyleLabel(),
    focusColor: Colors.white,
    focusedBorder: textFieldBorder(),
    enabledBorder: textFieldBorder(),
    suffixIcon: GestureDetector(

        child: Icon(iconvalue,color: Colors.grey,)),
    
  );
}

// Border for above TextFormFields...............................
OutlineInputBorder textFieldBorder() {
  return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(20),
      gapPadding: 5);
}

// Text Styling for above TextFormFields.........................
TextStyle textStyleLabel() {
  return const TextStyle(color: Colors.white);
}
