import 'package:demo_project/controllers/auth_controllers/auth_controller.dart';
import 'package:demo_project/utils/exports.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
              const Text('Forgot Password', style: TextStyle(fontSize: 30)),
              const SizedBox(height: 20),
              const Text(
                'Enter your email address and we will send you a link to reset your password',
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              InputField(
                  controller: controller.emailController,
                  hint: 'Email',
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  autofocus: true),
              const SizedBox(height: 20),
              Obx(
                () => LargeButton(
                  loading: controller.isLoading.value,
                  title: 'Send Email',
                  onPress: () {
                    // Send email
                    controller.isLoading(true);
                    controller.sendPasswordResetEmail();
                  },
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
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
