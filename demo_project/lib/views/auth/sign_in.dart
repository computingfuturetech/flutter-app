import 'package:demo_project/controllers/auth_controllers/auth_controller.dart';
import 'package:demo_project/utils/exports.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const Text('Sign In', style: TextStyle(fontSize: 30)),
              const SizedBox(height: 20),
              InputField(
                  controller: controller.emailController,
                  hint: 'Email',
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  autofocus: true),
              const SizedBox(height: 20),
              PasswordInputField(
                controller: controller.passwordController,
                hint: 'Enter your Password',
                label: 'Password',
                autofocus: false,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: const Text('Forgot Password?'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              LargeButton(
                title: 'Sign In',
                onPress: () {
                  controller.signIn();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                child: const Text('Don\'t have an account? Sign Up'),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
