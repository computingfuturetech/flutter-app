import 'package:demo_project/utils/exports.dart';


Widget InputField({
  required String hint,
  required String label,
  required keyboardType,
  required textCapitalization,
  required controller,
  autofocus = false,
}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              '*',
              style: TextStyle(
                fontSize: 14,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      TextFormField(
        controller: controller,
        autofocus: autofocus,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        style: const TextStyle(
          fontSize: 14,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
    ],
  );
}