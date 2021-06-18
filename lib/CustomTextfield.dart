import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget{

  CustomTextField({
    this.baslik,
    this.obsecure = false,
    this.validator,
    this.onSaved,
    this.isLighter,
    this.initialValueText,
    this.maximumLines = 1,
    this.isTextCenter,
    this.isReadOnly = false,
    TextEditingController controller,
  });

  final FormFieldSetter<String> onSaved;
  final String baslik;
  final bool obsecure;
  final bool isLighter;
  final bool isReadOnly;
  final bool isTextCenter;
  final String initialValueText;
  final int maximumLines;
  final FormFieldValidator<String> validator;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          textAlign: isTextCenter == true ? TextAlign.center : TextAlign.start,
          readOnly: isReadOnly,
          initialValue: initialValueText == null ? '' : initialValueText,
          onSaved: onSaved,
          validator: validator,
          obscureText: obsecure,
          maxLines: maximumLines == 1 ? 1 : maximumLines,
          style: TextStyle(
              color: isLighter == true ? Colors.black54 : Colors.white70,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.normal,
              fontSize: 5.sp),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 2,color: Colors.purple.shade900),
              borderRadius: BorderRadius.circular(15)
            ),

            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2,color: Colors.purple.shade900)
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
            ),
            labelText: baslik,
            labelStyle: TextStyle(
              color: isLighter == true ? Colors.black26 : Colors.white70,
            ),
          ),
        ),
      ),
    );
  }

}