import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/RegisterPageProvider.dart';

Widget textFieldName() {
  return Consumer<RegisterPageProvider>(
    builder: (context, providerValue, child) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          decoration: textFieldDecoration("Name",iconvalue1: null),
          onChanged: (value) {
            providerValue.nameController(value);
          },
        ),
      );
    },
  );
}

Widget textFieldEmail() {
  return Consumer<RegisterPageProvider>(
    builder: (context, providerValue, child) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.emailAddress,
          decoration: textFieldDecoration("Email",iconvalue1: null),
          onChanged: (value) {
            providerValue.emailController(value);
          },
        ),
      );
    },
  );
}

Widget textFieldPassword() {
  return Consumer<RegisterPageProvider>(
    builder: (context, providerValue, child) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          obscureText: true,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.visiblePassword,
          decoration: textFieldDecoration(
            "Password",
              iconvalue1: Icons.visibility,
          ),
          onChanged: (value) {
            providerValue.passwordController(value);
          },
        ),
      );
    },
  );
}

InputDecoration textFieldDecoration(String label,{required iconvalue1}) {
  return InputDecoration(
      labelText: label,
      suffix: Icon(iconvalue1,color: Colors.black,),
      labelStyle: const TextStyle(color: Colors.white),
      enabledBorder: textFieldBorder(),
      focusedBorder: textFieldBorder());
}

OutlineInputBorder textFieldBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
          color: Colors.white, style: BorderStyle.solid, width: 2));
}
