import 'package:flutter/material.dart';
class DefaultEmailField extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
   DefaultEmailField({Key? key,this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'name@example.com',
        labelStyle: TextStyle(
          fontSize: 17,
        ),
        // icon: Icon(Icons.mail),
        suffixIcon: controller!.text.isEmpty
            ? Container(width: 0)
            : IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => controller!.clear(),
        ),
        border:  OutlineInputBorder( borderRadius: BorderRadius.circular(10),),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      // autofocus: true,
    );;
  }
}
