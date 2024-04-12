import 'package:flutter/material.dart';

import 'package:student_management/core/colors.dart';





Widget textField2(
    {required String hinttext,
    required IconData icon,
    IconData? icon2,
    required TextEditingController controller,
    required bool obsecureText,
    int minlines = 1,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.name,
    String? Function(String?)? validator,
     void Function()? onTapIcon2,
    }) {
  return TextFormField(
    
    minLines: minlines,
    maxLines: maxLines,
    keyboardType: keyboardType,
    style: TextStyle(
      color: Tcolo.black,
    ),
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          30,
        ),
      ),
      hintText: hinttext,
      filled: true,
      fillColor: Colors.white,
      prefixIcon: Icon(icon),
      suffixIcon: IconButton(onPressed: onTapIcon2, icon: Icon(icon2))
    ),
    controller: controller,
    obscureText: obsecureText,
    validator: validator,
  );
}
