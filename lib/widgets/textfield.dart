import 'package:flutter/material.dart';
class CustomTextField extends StatefulWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField>
    with TickerProviderStateMixin {
  late final TextEditingController _emailTextController =
  TextEditingController(text: '');
  late final TextEditingController _passTextController =
  TextEditingController(text: '');
  bool _obscureText = true;
  final _loginFormKey = GlobalKey<FormState>();
  FocusNode _passFocusNode = FocusNode();
  bool _isLoading = false;
  void submitFormOnLogin() async {
    final isValid = _loginFormKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      setState(() {
        _isLoading = true;
      });
    } else {
      print('Form not valid');
    }
    setState(() {
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _loginFormKey,
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(_passFocusNode),
            validator: (value) {
              if (value!.isEmpty || !value.contains('@')) {
                return 'Please enter a valid Email adress';
              }
              return null;
            },
            controller: _emailTextController,
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: const TextStyle(color: Colors.black),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.pink.shade700),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //Password TextField

          TextFormField(
            onEditingComplete: submitFormOnLogin,
            focusNode: _passFocusNode,
            validator: (value) {
              if (value!.isEmpty || value.length < 5) {
                return 'Please enter a valid password';
              }
              return null;
            },
            obscureText: _obscureText,
            controller: _passTextController,
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.blueGrey,
                ),
              ),
              hintText: 'Password',
              hintStyle: const TextStyle(color: Colors.black),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.pink.shade700),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
