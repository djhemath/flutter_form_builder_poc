import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  String? label = '';
  String? error = '';
  void Function(String) onChange;
  String? value;

  static void _defaultOnChange(String val) {}

  CustomInput({super.key, this.label = '', this.error = '', this.onChange = _defaultOnChange, this.value = ''});

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  final myController = TextEditingController();

  FocusNode f1 = FocusNode();

  @override
  Widget build(BuildContext context) {
    myController.value = TextEditingValue(text: widget.value != null ? widget.value! : '');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label != null ? widget.label! : ''),
        TextField(
          focusNode: f1,
          controller: myController,
          onChanged: (val) {
            widget.onChange(val);
            f1.requestFocus();
          },
        ),
        const SizedBox(height: 20,),
        Text(widget.error != null ? widget.error! : ''),
      ],
    );
  }
}