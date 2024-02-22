import 'package:demo_project/utils/exports.dart';

class PasswordInputField extends StatefulWidget {
  final hint, label, autofocus, controller;
  const PasswordInputField({
    super.key,
    this.hint = 'Enter your Password',
    this.label = 'Password',
    this.autofocus = false,
    required this.controller,
  });

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool obsecure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            children: [
              Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
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
          controller: widget.controller,
          autofocus: widget.autofocus,
          obscureText: obsecure,
          keyboardType: TextInputType.visiblePassword,
          textCapitalization: TextCapitalization.words,
          cursorColor: Colors.black,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            suffixIcon: obsecure
                ? IconButton(
                    onPressed: () {
                      obsecure = !obsecure;
                      setState(() {});
                    },
                    icon: Image.asset(icPassHide, width: 20),
                    color: Colors.black,
                  )
                : IconButton(
                    onPressed: () {
                      obsecure = !obsecure;
                      setState(() {});
                    },
                    icon: Image.asset(icPassShow, width: 20),
                    color: Colors.black,
                  ),
            hintText: widget.hint,
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
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
