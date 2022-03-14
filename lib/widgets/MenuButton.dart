import 'package:flutter/material.dart';

class MenuButton extends StatefulWidget {
  MenuButton({
    Key? key,
    required this.options,
    required this.selection,
    this.textcolor,
  }) : super(key: key);

  List<String> options;
  String selection;
  var textcolor;

  @override
  _MenuButton createState() => _MenuButton();
}

class _MenuButton extends State<MenuButton> {

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: widget.selection,
        items: widget.options.map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(
              option,
              style: TextStyle(color: widget.textcolor),
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            widget.selection = newValue!;
          });
        }
    );
  }
}