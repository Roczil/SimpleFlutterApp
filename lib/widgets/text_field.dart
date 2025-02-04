import 'package:flutter/material.dart';

import '../utils/my_colors.dart';

Widget buildTextField({
  required String label,
  required IconData icon,
  required String hintText,
  bool isPassword = false,
}) {
  return SizedBox( height: 50,
    child: TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: MyColors.greyColor),
        hintText: hintText,
        hintStyle: TextStyle(color: MyColors.greyColor),
        prefixIcon: Icon(icon, color: MyColors.purpleColor),
        suffixIcon: isPassword
            ? Icon(Icons.remove_red_eye_outlined, color: MyColors.greyColor)
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: MyColors.pinkColor, width: 2
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: MyColors.pinkColor, width: 2
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: MyColors.pinkColor, width: 2
          ),
        ),
      ),
    ),
  );
}
