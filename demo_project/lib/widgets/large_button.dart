import 'package:demo_project/utils/exports.dart';

Widget LargeButton({onPress, String title = ""}) => ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        elevation: 10,
        backgroundColor: Colors.black,
        splashFactory: InkSplash.splashFactory,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        minimumSize: const Size(double.infinity, 60),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
