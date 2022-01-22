import 'dart:ui';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:talent_project/widgets/email_form_widget.dart';
import 'package:talent_project/widgets/name_form_widget.dart';
import 'package:talent_project/widgets/password_field_widget.dart';
import 'package:talent_project/widgets/stepper_button_widget.dart';

class CorporateSignupScreen extends StatefulWidget {
  const CorporateSignupScreen({Key? key}) : super(key: key);

  @override
  State<CorporateSignupScreen> createState() => _CorporateSignupScreen();
}

class _CorporateSignupScreen extends State<CorporateSignupScreen> {
  bool isHidden = true;
  String? selectGender;

  int _currentStep = 0;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    emailController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  VoidCallback? mContinue;
  VoidCallback? mCancel;

  // final genderItems = ['Male', 'Female', 'Other'];
  final fieldItems = [
    'Agency',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Stepper(
              elevation: 0.0,
              steps: getSteps(),
              type: StepperType.horizontal,
              currentStep: _currentStep,
              controlsBuilder: (context, {onStepCancel, onStepContinue}) {
                mContinue = onStepContinue!;
                mCancel = onStepCancel!;
                return Container();
              },
              onStepContinue: () {
                setState(() {
                  if (_currentStep == getSteps().length - 1) {
                    debugPrint("Submit");
                  } else {
                    _currentStep++;
                  }
                });
              },
              onStepCancel: () {
                setState(() {
                  _currentStep == 0 ? null : _currentStep--;
                });
              },
              onStepTapped: (value) {
                setState(() {
                  _currentStep = value;
                });
              },
            ),
          ),
          StepperButton(
            mCancel: mCancel,
            mContinue: mContinue,
          ),
          //stepper buttons
        ],
      )),
    );
  }

  List<Step> getSteps() => [
        Step(
            title:
                const SizedBox(width: 75, child: Text('Personal Information ')),

            isActive: _currentStep >= 0,
            content: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Step 1/3',
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  const Text(
                    'Company Name',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 7),
                  DefaultNameField(
                    controller: firstNameController,
                    onSaved: () {},
                    type: TextInputType.name,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Field',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height:5),

                  Container(
                      height: 60,
                      width: 360,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<dynamic>(
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                        dropdownColor: Colors.white,
                        iconSize: 33,
                        hint: const Padding(
                          padding: EdgeInsets.only(left: 20),
                        ),
                        isExpanded: true,
                        value: selectGender,
                        onChanged: (value) {
                          setState(() {
                            selectGender = value;
                          });
                        },
                        items: fieldItems.map((valueItem) {
                          return DropdownMenuItem(
                              value: valueItem,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: Text(valueItem),
                              ));
                        }).toList(),
                      )), //Field
                  const SizedBox(height: 20),
                  const Text(
                    'Country',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 5),

                  Container(
                      height: 60,
                      width: 360,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: CountryCodePicker(
                        alignLeft: true,
                        flagWidth: 20,
                        dialogTextStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        initialSelection: 'EG',
                        showCountryOnly: true,
                        dialogSize: Size(250, 300),
                        textStyle: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                        showOnlyCountryWhenClosed: true,
                        hideSearch: true,
                        boxDecoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )),
                  const SizedBox(height: 20),//Country Field

                  const Text(
                    'Address',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  DefaultNameField(
                    type: TextInputType.streetAddress,
                    controller: secondNameController,
                    onSaved: () {},
                  ),
                  const SizedBox(height: 30),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         const Text(
                  //           'Gender',
                  //           style: TextStyle(fontSize: 16),
                  //         ),
                  //         const SizedBox(
                  //           height: 10,
                  //         ),
                  //         genderBox()
                  //       ],
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         const Text(
                  //           'Country',
                  //           style: TextStyle(
                  //             fontSize: 16,
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           height: 10,
                  //         ),
                  //         countryBox(),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            )), //Personal information step********
        Step(
            isActive: _currentStep >= 1,
            title:
                const SizedBox(width: 75, child: Text('Required Information ')),
            content: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Step 2/3',
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Email',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      DefaultEmailField(
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Password',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      DefaultPasswordWidget(
                        obscure: isHidden,
                        validate: (password) =>
                            password != null && password.length < 5
                                ? 'Enter min. 5 characters'
                                : null,
                        suffix: IconButton(
                          icon: isHidden
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              isHidden = !isHidden;
                            });
                          },
                        ),
                        type: TextInputType.visiblePassword,
                        autoFillHints: [AutofillHints.password],
                      ),
                      SizedBox(
                        height: 37,
                      ),
                      const Text(
                        'Phone Number',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      Row(children: [
                        phoneNumber(),
                        Container(
                          height: 59,
                          width: 242,
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: phoneController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.zero,
                                bottomLeft: Radius.zero,
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10),
                              )),
                            ),
                          ),
                        ),
                      ])
                    ]))), //required information step*********
        // Step(
        //     isActive: _currentStep >= 2,
        //     title: const SizedBox(width: 75, child: Text('Occupation ')),
        //     content: Column(
        //       children: [],
        //     )), //Occupation step********
      ];

  // Widget genderBox() => Container(
  //   height: 55,
  //   width: 176,
  //   decoration: BoxDecoration(
  //     border: Border.all(color: Colors.black12, width: 2.5),
  //     borderRadius: BorderRadius.circular(10),
  //   ),
  //   child: DropdownButton<dynamic>(
  //     style: const TextStyle(
  //         fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black54),
  //     dropdownColor: Colors.white,
  //     iconSize: 33,
  //     hint: const Padding(
  //       padding: EdgeInsets.only(left: 20),
  //       child: Text(
  //         'Gender',
  //         style: TextStyle(fontSize: 15, color: Colors.black38),
  //       ),
  //     ),
  //     isExpanded: true,
  //     value: selectGender,
  //     onChanged: (value) {
  //       setState(() {
  //         selectGender = value;
  //       });
  //     },
  //     items: genderItems.map((valueItem) {
  //       return DropdownMenuItem(
  //           value: valueItem,
  //           child: Padding(
  //             padding: const EdgeInsets.only(left: 40),
  //             child: Text(valueItem),
  //           ));
  //     }).toList(),
  //   ),
  // );

  Widget countryBox() => Container(
      height: 55,
      width: 176,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 2.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: CountryCodePicker(
        alignLeft: true,
        flagWidth: 20,
        dialogTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
        initialSelection: 'EG',
        showCountryOnly: true,
        dialogSize: Size(250, 300),
        textStyle: const TextStyle(
            color: Colors.black54, fontSize: 14, fontWeight: FontWeight.bold),
        showOnlyCountryWhenClosed: true,
        hideSearch: true,
        boxDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ));

  Widget phoneNumber() => Container(
      height: 59,
      width: 120,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
      ),
      child: CountryCodePicker(
        showFlagDialog: true,
        showCountryOnly: false,
        showFlag: true,
        alignLeft: false,
        flagWidth: 20,
        dialogTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
        initialSelection: 'EG',
        dialogSize: Size(250, 300),
        textStyle: const TextStyle(
            color: Colors.black54, fontSize: 14, fontWeight: FontWeight.bold),
        hideSearch: true,
        boxDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ));
}
