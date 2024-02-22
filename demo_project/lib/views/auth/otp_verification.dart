import 'package:demo_project/controllers/auth_controllers/auth_controller.dart';
import 'package:demo_project/utils/exports.dart';

class OTPVerificationScreen extends StatelessWidget {
  const OTPVerificationScreen({super.key});

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
              const Text('OTP Verification', style: TextStyle(fontSize: 30)),
              const SizedBox(height: 20),
              const Text(
                'Enter the OTP sent to your email address',
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              InputField(
                  controller: controller.otpController,
                  hint: 'OTP',
                  label: 'OTP',
                  keyboardType: TextInputType.number,
                  textCapitalization: TextCapitalization.none,
                  autofocus: true),
              const SizedBox(height: 20),
              LargeButton(
                title: 'Verify OTP',
                onPress: () {
                  // Verify OTP
                  controller.verifyOTP();
                },
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
