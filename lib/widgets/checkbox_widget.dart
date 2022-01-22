import 'package:flutter/material.dart';


class BuildCheckItem extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool? value) onChange;

  const BuildCheckItem({
    required this.value,
    required this.onChange,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .4,
      child: Row(children: [
        Checkbox(value: value, onChanged: onChange),
        Expanded(child: Text(title))
      ]),
    );
  }
}

class RegisterCheckList extends StatefulWidget {
  const RegisterCheckList({Key? key}) : super(key: key);

  @override
  _RegisterCheckListState createState() => _RegisterCheckListState();
}

class _RegisterCheckListState extends State<RegisterCheckList> {
  bool selectedValue = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 10,
        runSpacing: 10,
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.start,
        children: [
          BuildCheckItem(
            value: selectedValue,
            onChange: (value) {
              setState(() {
                selectedValue =!selectedValue;
              });
            },
            title: "Actor",
          ),BuildCheckItem(
            value: selectedValue,
            onChange: (value) {
              setState(() {
                selectedValue =!selectedValue;
              });
            },
            title: "Director",
          ),BuildCheckItem(
            value: selectedValue,
            onChange: (value) {
              setState(() {
                selectedValue =!selectedValue;
              });
            },
            title: "Photographer",
          ),BuildCheckItem(
            value: selectedValue,
            onChange: (value) {
              setState(() {
                selectedValue =!selectedValue;
              });
            },
            title: "Videographer",
          ),BuildCheckItem(
            value: selectedValue,
            onChange: (value) {
              setState(() {
                selectedValue =!selectedValue;
              });
            },
            title: "Graphic Designer",
          ),BuildCheckItem(
            value: selectedValue,
            onChange: (value) {
              setState(() {
                selectedValue =!selectedValue;
              });
            },
            title: "Editor",
          ),BuildCheckItem(
            value: selectedValue,
            onChange: (value) {
              setState(() {
                selectedValue =!selectedValue;
              });
            },
            title: "Art Designer",
          ),BuildCheckItem(
            value: selectedValue,
            onChange: (value) {
              setState(() {
                selectedValue =!selectedValue;
              });
            },
            title: "Singer",
          ),BuildCheckItem(
            value: selectedValue,
            onChange: (value) {
              setState(() {
                selectedValue =!selectedValue;
              });
            },
            title: "Stylist",
          ),BuildCheckItem(
            value: selectedValue,
            onChange: (value) {
              setState(() {
                selectedValue =!selectedValue;
              });
            },
            title: "Colorist",
          ),BuildCheckItem(
            value: selectedValue,
            onChange: (value) {
              setState(() {
                selectedValue =!selectedValue;
              });
            },
            title: "Makeup Artist",
          ),BuildCheckItem(
            value: selectedValue,
            onChange: (value) {
              setState(() {
                selectedValue =!selectedValue;
              });
            },
            title: "Sound Engineering",
          ),BuildCheckItem(
            value: selectedValue,
            onChange: (value) {
              setState(() {
                selectedValue =!selectedValue;
              });
            },
            title: "Journalist",
          ),BuildCheckItem(
            value: false,
            onChange: (value) {
              setState(() {
                value = true;
              });
            },
            title: "Writer",
          ),BuildCheckItem(
            value: selectedValue,
            onChange: (value) {
              setState(() {
               selectedValue=!value!;
              });
            },
            title: "Football Player",
          ),BuildCheckItem(
            value: false,
            onChange: (value) {
              setState(() {
                value = true;
              });
            },
            title: "Production Manager",
          ),BuildCheckItem(
            value: false,
            onChange: (value) {
              setState(() {
                value = true;
              });
            },
            title: "Model",
          ),BuildCheckItem(
            value: false,
            onChange: (value) {
              setState(() {
                value = true;
              });
            },
            title: "Voice Over",
          ),BuildCheckItem(
            value: false,
            onChange: (value) {
              setState(() {
                value = true;
              });
            },
            title: "Producer",
          ),BuildCheckItem(
            value: false,
            onChange: (value) {
              setState(() {
                value = true;
              });
            },
            title: "Other",
          ),
        ]);
  }
}
