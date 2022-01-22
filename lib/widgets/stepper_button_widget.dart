import 'package:flutter/material.dart';
class StepperButton extends StatelessWidget {
  VoidCallback? mContinue;
  VoidCallback? mCancel;
   StepperButton({Key? key,this.mContinue,this.mCancel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      // right: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        // margin: EdgeInsets.symmetric(vertical: 350),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF79224B),
                Color(0xFFEAC43E),
              ],
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // if (_currentStep != 0)
            TextButton(
                child: const Text(
                  'Previous',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: mCancel),
            // const SizedBox(
            //   width: 12,
            // ),
            TextButton(
              child: const Text(
                // isLastStep ? 'CONFIRM' : 'Next',
                'next',
                style: TextStyle(color: Colors.white),
              ),
              // onPressed: onStepContinue,
              onPressed: mContinue,
            ),
          ],
        ),
      ),
    ); //stepper buttons
  }
}
