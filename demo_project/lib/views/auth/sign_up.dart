import 'package:demo_project/controllers/auth_controllers/auth_controller.dart';
import 'package:demo_project/utils/exports.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
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
              const Text('Sign Up', style: TextStyle(fontSize: 30)),
              const SizedBox(height: 20),
              InputField(
                  controller: controller.nameController,
                  hint: 'Enter username',
                  label: 'Username',
                  keyboardType: TextInputType.name,
                  autofocus: true,
                  textCapitalization: TextCapitalization.words),
              const SizedBox(height: 20),
              InputField(
                  controller: controller.emailController,
                  hint: 'Email',
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  autofocus: false),
              const SizedBox(height: 20),
              PasswordInputField(
                controller: controller.passwordController,
                hint: 'Enter your Password',
                label: 'Password',
                autofocus: false,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Obx(
                () => LargeButton(
                  loading: controller.isLoading.value,
                  title: 'Sign Up',
                  onPress: () {
                    controller.isLoading(true);
                    controller.signUp();
                  },
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
                },
                child: const Text('Already have an account? Sign In'),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
