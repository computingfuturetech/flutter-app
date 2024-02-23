import 'dart:developer';

import 'package:demo_project/utils/exports.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LargeButton extends StatefulWidget {
  final title, onPress, loading;
  const LargeButton(
      {super.key,
      required this.title,
      required this.onPress,
      required this.loading});

  @override
  State<LargeButton> createState() => _LargeButtonState();
}

class _LargeButtonState extends State<LargeButton> {
  @override
  Widget build(BuildContext context) {
    log('LargeButton: build');
    return Column(
      children: [
        // ElevatedButton(
        //   onPressed: onPress,
        //   style: ElevatedButton.styleFrom(
        //     elevation: 10,
        //     backgroundColor: Colors.black,
        //     splashFactory: InkSplash.splashFactory,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(20),
        //     ),
        //     minimumSize: const Size(double.infinity, 60),
        //   ),
        //   child: Text(
        //     title,
        //     style: const TextStyle(
        //       fontSize: 16,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
        // const SizedBox(height: 20),
        InkWell(
          onTap: widget.onPress,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
            ),
            child: widget.loading
                ? const Center(
                    child: SpinKitFadingCircle(
                      color: Colors.white,
                      size: 23,
                    ),
                  )
                : Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
