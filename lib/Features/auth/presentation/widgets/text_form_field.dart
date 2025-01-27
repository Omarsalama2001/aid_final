// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextForm extends StatelessWidget {
  final String hinttext ;
  final TextEditingController mycontroller ;
  final String ?Function(String?)?validator;
   final IconData ?suffix;
   final  VoidCallback? suffixpressed;
   final  bool obscureText;
  final Widget? prefixIcon;
  final int? maxLines;
  final Widget? label;
  // final bool?isDeny;
   final  TextInputType? keyboardType;
   final List<TextInputFormatter>? inputFormatters;
   CustomTextForm({super.key, required this.hinttext, required this.mycontroller, this.keyboardType, this.inputFormatters, this.validator, this.suffix, this.suffixpressed, required this.obscureText, this.prefixIcon ,this.maxLines=1, this.label  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      maxLines: maxLines,
      inputFormatters:inputFormatters,
      keyboardType:keyboardType,
      obscureText:obscureText,
      onTapOutside: (event)=>FocusScope.of(context).unfocus(),
      validator: validator,
      controller: mycontroller,

      ///see it again
      decoration: InputDecoration(

        prefixIcon: prefixIcon,
           // isDense: true, to make it scrollable
          // isDense: isDeny,
        // you should put this to mke border fixed when you click on the button
        border:OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: suffix != null ? IconButton(
        onPressed: suffixpressed,
        icon: Icon(suffix),
      )
            : null,
        label:label ,
        hintText: hinttext,
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color:Colors.black)
        ),
    //اول لما تدوس على ال textformfield




    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color:Colors.orangeAccent,)
    ),
      ),



    );
  }
}