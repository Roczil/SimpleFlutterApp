import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';
import '../../utils/my_images.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';
import '../home/home_view.dart';
import '../register/register_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 62),
                Image.asset(MyImages.logo),
                const SizedBox(height: 21),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: MyColors.purpleColor),
                  ),
                ),
                const SizedBox(height: 46),
                buildTextField(
                    label: 'Email or Username',
                    hintText: 'Enter your login',
                    icon: Icons.person,
                    // Ikona
                ),
                const SizedBox(height: 40),
                buildTextField(
                    label: 'Password',
                    hintText: 'Enter your password',
                    icon: Icons.lock,
                    isPassword: true,
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterView(), // Przykładowa strona
                          ),
                        );
                      },
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                          fontSize: 15,
                          color: MyColors.purpleColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 16),
                CustomElevatedButton(
                  text: 'Sign In',
                  onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeView()),
                  );
                },),
                const SizedBox(height: 200),
                Align(alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>const RegisterView(), // Przykładowa strona
                        ),
                      );
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 15,
                              color: MyColors.purpleColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "Sign Up",
                            style: TextStyle(
                              fontSize: 15,
                              color: MyColors.purpleColor,
                              fontWeight: FontWeight.w700, // Pogrubienie dla "Sign Up"
                            ),
                          ),
                        ],
                      ),
                  ),)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//class _SignInTextField extends StatelessWidget {
  //const _SignInTextField();}