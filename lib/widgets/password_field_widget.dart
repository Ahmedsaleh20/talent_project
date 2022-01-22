import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultPasswordWidget extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  VoidCallback? onSaved;
  TextInputType? type;
  AutofillHints? autofillHints;
  Function(String value)? onSubmit;
  Function(String value)? onChange;
  Function(String value)? onPressed;
 FormFieldValidator<String> ? validate;
  String? hint;
  IconButton? prefix;
  IconButton? suffix;
  bool? isHidden = false;
  IconButton? icon;
  bool? obscure=false;
  Iterable<String>? autoFillHints;

  DefaultPasswordWidget({
    this.controller,
    this.onSaved,
    this.type,
    this.onSubmit,
    this.onChange,
    this.validate,
   this.hint,
    this.prefix,
    this.suffix,
    this.isHidden,
    this.onPressed,
    this.icon,
    this.obscure,
    this.autoFillHints,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure!,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: prefix,
        suffixIcon:suffix,
      ),
      keyboardType: type,
      //TextInputType.visiblePassword,
      autofillHints: autoFillHints,//[AutofillHints.password],
      onEditingComplete: () => TextInput.finishAutofillContext(),
      validator:  validate
    );
  }
}

// class PasswordField extends StatefulWidget {
//   final TextEditingController? controller;
//   String?  hint;
//
//    PasswordField({Key? key, required this.controller,required this.hint}) : super(key: key);
//
//   @override
//   _PasswordFieldState createState() => _PasswordFieldState();
// }
//
// class _PasswordFieldState extends State<PasswordField> {
//   bool isHidden = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.controller,
//       obscureText: isHidden,
//       decoration: InputDecoration(
//         hintText: hint,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         prefixIcon: Icon(Icons.lock),
//         suffixIcon: IconButton(
//           icon: isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
//           onPressed: () {
//             setState(() {
//               isHidden = !isHidden;
//             });
//           },
//         ),
//       ),
//       keyboardType: TextInputType.visiblePassword,
//       autofillHints: [AutofillHints.password],
//       onEditingComplete: () => TextInput.finishAutofillContext(),
//       validator: (password) => password != null && password.length < 5
//           ? 'Enter min. 5 characters'
//           : null,
//     );
//   }
// }
