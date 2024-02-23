import 'package:demo_project/controllers/auth_controllers/auth_controller.dart';
import 'package:demo_project/utils/exports.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AuthController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const Text('Reset Password', style: TextStyle(fontSize: 30)),
              const SizedBox(height: 20),
              PasswordInputField(
                  controller: controller.passwordController,
                  hint: 'Enter your Password',
                  label: 'Password',
                  autofocus: true),
              PasswordInputField(
                controller: controller.confirmPasswordController,
                hint: 'Confirm Password',
                label: 'Confirm Password',
              ),
              const SizedBox(height: 20),
              Obx(
                () => LargeButton(
                  loading: controller.isLoading.value,
                  title: 'Reset Password',
                  onPress: () {
                    controller.isLoading(true);
                    // Reset Password
                    controller.resetPassword();
                  },
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()));
                },
                child: const Text('Back to Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
