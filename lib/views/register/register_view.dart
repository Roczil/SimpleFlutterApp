import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';
import '../home/home_view.dart';
import '../login/login_view.dart';



class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios_new_outlined,
                          color: MyColors.purpleColor),
                      const SizedBox(width: 8),
                      Text(
                        "Back",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: MyColors.purpleColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
                Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: MyColors.purpleColor,
                  ),
                ),
                const SizedBox(height: 46),
                buildTextField(
                  label: "Full Name",
                  icon: Icons.person,
                  hintText: "Enter your Name",
                ),
                const SizedBox(height: 40),
                buildTextField(
                  label: "Email",
                  icon: Icons.email,
                  hintText: "Enter your Email",
                ),
                const SizedBox(height: 40),
                buildTextField(
                  label: "Password",
                  icon: Icons.lock,
                  hintText: " Enter your Password",
                  isPassword: true,
                ),
                const SizedBox(height: 40),
                buildTextField(
                  label: "Confirm Password",
                  icon: Icons.lock,
                  hintText: "Confirm your Password",
                  isPassword: true,
                ),
                const SizedBox(height: 80),
                CustomElevatedButton(
                    text: 'Sign Up',
                    onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeView()),
                  );
                    }),
                const SizedBox(height: 50),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (
                              context) => const LoginView(), // Przykładowa strona
                        ),
                      );
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                              fontSize: 15,
                              color: MyColors.purpleColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "Sign In",
                            style: TextStyle(
                              fontSize: 15,
                              color: MyColors.purpleColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

