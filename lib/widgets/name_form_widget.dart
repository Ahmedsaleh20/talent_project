import 'package:flutter/material.dart';

class DefaultNameField extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  VoidCallback? onSaved;

  TextInputType? type;
  Function(String value)? onSubmit;
  Function(String value)? onChange;
  Function(String value)? validate;
  String? hint;
  IconData? prefix;
  IconData? suffix;
  bool? isPassword = false;

  DefaultNameField(
      {Key? key, required this.controller,
      this.onSaved,
      required this.type,
      this.onSubmit,
      this.onChange,
      this.validate,
      this.hint,
      this.prefix,
      this.suffix,
      this.isPassword}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
 TextFormField(
   keyboardType: type,

        onSaved: (newValue) => onSaved,
        decoration: InputDecoration(
          border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(10),

          ),
          contentPadding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
        ),

        controller: controller,
        textInputAction: TextInputAction.done,

    );
  }
}
