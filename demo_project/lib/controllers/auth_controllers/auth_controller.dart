import 'dart:convert';
import 'dart:developer';
import 'package:demo_project/utils/exports.dart';
// ignore: unnecessary_import
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final token = ''.obs;
  final userid = ''.obs;
  final otpController = TextEditingController();

  Future<void> signIn() async {
    log('Sign In');
    try {
      var email = emailController.text.trim();
      var password = passwordController.text.trim();
      log('Email: $email');
      log('Password: $password');

      if (email.isEmpty || password.isEmpty) {
        Get.snackbar('Error', 'All fields are required');
        return;
      } else if (password.length < 8) {
        Get.snackbar('Error', 'Password must be at least 8 characters');
        return;
      } else if (!GetUtils.isEmail(email)) {
        Get.snackbar('Error', 'Enter a valid email address');
        return;
      }
      var data = {
        'email': email,
        'password': password,
      };
      var url = Uri.parse('http://10.0.2.2:8000/user/login/');
      var response = await http.post(url, body: data);
      // log('Response: ${response.body}');
      var responseJson = json.decode(response.body);
      log('Response JSON: $responseJson');
      log('Response Status Code: ${response.statusCode}');
      // log('Token: ${responseJson['token']}');
      // log('User ID: ${responseJson['user_id']}');
      if (response.statusCode == 200) {
        Get.snackbar('Success', responseJson['status']);
        token(responseJson['token'].toString());
        userid(responseJson['user_id'].toString());
        log('Token: ${token.value.toString()}');
        log('User ID: ${userid.value.toString()}');
        emailController.clear();
        passwordController.clear();
        Navigator.pushReplacement(
          Get.context!,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        );
      } else if (response.statusCode == 400) {
        Get.snackbar('Error', responseJson['status']);
      } else if (response.statusCode == 401) {
        Get.snackbar('Error', responseJson['error']);
      } else if (response.statusCode == 500) {
        Get.snackbar('Error', 'Something went wrong');
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  Future<void> signUp() async {
    try {
      var name = nameController.text.trim();
      var email = emailController.text.trim();
      var password = passwordController.text.trim();

      if (name.isEmpty || email.isEmpty || password.isEmpty) {
        Get.snackbar('Error', 'All fields are required');
        return;
      } else if (password.length < 8) {
        Get.snackbar('Error', 'Password must be at least 8 characters');
        return;
      } else if (!GetUtils.isEmail(email)) {
        Get.snackbar('Error', 'Enter a valid email address');
        return;
      } else if (name.length < 5) {
        Get.snackbar('Error', 'Username must be at least 5 characters');
        return;
      }
      var data = {
        'username': name,
        'email': email,
        'password': password,
      };
      var url = Uri.parse('http://10.0.2.2:8000/user/create/');
      var response = await http.post(url, body: data);
      var responseJson = json.decode(response.body);

      if (response.statusCode == 201) {
        Get.snackbar('Success', responseJson['status']);
        nameController.clear();
        emailController.clear();
        passwordController.clear();
        Navigator.pushReplacement(
          Get.context!,
          MaterialPageRoute(
            builder: (context) => const SignInScreen(),
          ),
        );
      } else if (response.statusCode == 400) {
        Get.snackbar('Error', responseJson['status']);
      } else if (response.statusCode == 500) {
        if (responseJson['error'].toString().contains('password')) {
          Get.snackbar('Error', 'Password must be at least 8 characters');
        } else if (responseJson['error'].toString().contains('email')) {
          Get.snackbar('Error', 'Email valid email address');
        } else if (responseJson['error'].toString().contains('username')) {
          Get.snackbar('Error', 'Username must be at least 5 characters');
        } else {
          Get.snackbar('Error', 'Something went wrong');
        }
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  Future<void> sendPasswordResetEmail() async {
    try {
      var email = emailController.text.trim();

      if (email.isEmpty) {
        Get.snackbar('Error', 'Email is required');
        return;
      } else if (!GetUtils.isEmail(email)) {
        Get.snackbar('Error', 'Enter a valid email address');
        return;
      }
      var data = {
        'email': email,
      };
      var url = Uri.parse('http://10.0.2.2:8000/user/send-otp/');
      var response = await http.post(url, body: data);
      var responseJson = json.decode(response.body);

      if (response.statusCode == 201) {
        Get.snackbar('Success', responseJson['status']);
        Navigator.pushReplacement(
          Get.context!,
          MaterialPageRoute(
            builder: (context) => const OTPVerificationScreen(),
          ),
        );
      } else if (response.statusCode == 401) {
        Get.snackbar('Error', responseJson['error']);
      } else if (response.statusCode == 500) {
        Get.snackbar('Error', 'Something went wrong');
      } else {
        Get.snackbar('Error', 'Something went wrong');
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  Future<void> verifyOTP() async {
    try {
      log('Verify OTP');
      var otp = otpController.text.trim();

      if (otp.isEmpty) {
        Get.snackbar('Error', 'OTP is required');
        return;
      }
      var data = {
        'email': emailController.text.trim(),
        'otp': otp,
      };
      var url = Uri.parse('http://10.0.2.2:8000/user/verify-otp/');
      var response = await http.post(url, body: data);
      log('ResponseCode JSON: ${response.statusCode}');
      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        log('Response JSON: $responseJson');
        Get.snackbar('Success', responseJson['message']);
        otpController.clear();
        Navigator.pushReplacement(
          Get.context!,
          MaterialPageRoute(
            builder: (context) => const ResetPasswordScreen(),
          ),
        );
      } else {
        Get.snackbar('Error', 'Invalid OTP');
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  Future<void> resetPassword() async {
    try {
      var password = passwordController.text.trim();
      var confirmPassword = confirmPasswordController.text.trim();

      if (password.isEmpty || confirmPassword.isEmpty) {
        Get.snackbar('Error', 'All fields are required');
        return;
      } else if (password.length < 8) {
        Get.snackbar('Error', 'Password must be at least 8 characters');
        return;
      } else if (password != confirmPassword) {
        Get.snackbar('Error', 'Passwords do not match');
        return;
      }
      var data = {
        'email': emailController.text.trim(),
        'password': password,
      };
      var url = Uri.parse('http://10.0.2.2:8000/user/forget-password/');
      var response = await http.put(url, body: data);
      var responseJson = json.decode(response.body);
      log('Response JSON: $responseJson');
      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Password reset successfully');
        emailController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        Navigator.pushReplacement(
          Get.context!,
          MaterialPageRoute(
            builder: (context) => const SignInScreen(),
          ),
        );
      } else {
        Get.snackbar('Error', 'Something went wrong');
      }
    } catch (e) {
      log('Error: $e');
    }
  }
}
