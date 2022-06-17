import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../home_page/components/colors.dart';
import '../../home_page/components/size_config.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final TextEditingController nomController = new TextEditingController();
  final TextEditingController prenomController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController phoneEtranController = new TextEditingController();
    var sexe = '0';
     // select items
  final List<Map<String, dynamic>> _items = [
    {
      'value': '0',
      'label': 'رجل',
      'icon': const Icon(Icons.man),
    },
    {
      'value': '1',
      'label': 'امرأة',
      'icon': const Icon(Icons.woman),
    },
  ];
 late SharedPreferences sharedPreferences;

   @override
  void initState() {
    checkLoginStatus();

    super.initState();
  }

  //
  checkLoginStatus() async {
   sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          nomTextField(),
          prenomTextField(),
          sexeTextField(),
          phoneTextField(),
          phoneEtrangTextField(),
        ],
      ),
    );
  }

//PrenomTextField
  prenomTextField() {
    SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 68.3,
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 34.15),
        child: TextFormField(
          style: TextStyle(color: textColor),
          cursorColor: textColor,
          controller: prenomController,
          onChanged: (text) {
            //print("Text $text");
            sharedPreferences.setString("prenomarabe", text);
          },
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.account_circle),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(
                    width: SizeConfig.screenWidth! / 205.5, color: textColor),

                /// 2
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(width: 1, color: texthint),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: ' اللقب بالعربية',
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText: ' اللقب بالعربية',
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))),
        ),
      ),
    );
  }

  //nomTextField
  nomTextField() {
    SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 68.3,
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 34.15),
        child: TextFormField(
          style: TextStyle(color: textColor),
          cursorColor: textColor,
          controller: nomController,
          onChanged: (text) {
            //print("Text $text");
            sharedPreferences.setString("nomarabe", text);
          },
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.account_circle),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(
                    width: SizeConfig.screenWidth! / 205.5, color: textColor),

                /// 2
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(width: 1, color: texthint),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: 'اسم الثلاثي بالعربية',
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText: 'اسم الثلاثي بالعربية',
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))),
              validator: (value) {
              if (value == null || value.isEmpty ||value.length < 8) {
                return 'الرجاء إدخال إسم ';
              }
              return null;
            },
        ),
             
      ),
    );
  }


  //SexeTextField ||
  sexeTextField() {
    SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 68.3,
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 34.15),
        child: SelectFormField(
          type: SelectFormFieldType.dropdown, // or can be dialog
          initialValue: 'رجل',
          icon: Icon(Icons.man),
          labelText: 'الجنس',
          items: _items,
          onChanged: (val) => sharedPreferences.setString("sexe", val),
          onSaved: (val) => sharedPreferences.setString("sexe", val.toString()),
        ),
      ),
    );
  }

//phoneController ||
  phoneTextField() {
    SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 68.3,
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 34.15),
        child: TextFormField(
          style: TextStyle(color: textColor),
          cursorColor: textColor,
          keyboardType: TextInputType.phone,
          controller: phoneController,
          onChanged: (text) {
            //print("Text $text");
            sharedPreferences.setString("phone", text);
          },
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(
                    width: SizeConfig.screenWidth! / 205.5, color: textColor),

                /// 2
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(width: 1, color: texthint),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: 'رقم الهاتف',
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText: 'رقم الهاتف',
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))),
/*               validator: (value) {
              if (value == null || value.isEmpty ||value.length < 8) {
                return 'الرجاء إدخال  رقم الهاتف';
              }
              return null;
            }, */
            validator:(value)=> validateMobile(value),
        ),
      ),
    );
  }

//phoneController ||
  phoneEtrangTextField() {
    SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 68.3,
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 34.15),
        child: TextFormField(
          style: TextStyle(color: textColor),
          keyboardType: TextInputType.phone,
          cursorColor: textColor,
          controller: phoneEtranController,
          onChanged: (text) {
            //print("Text $text");
            sharedPreferences.setString("phoneEtran", text);
          },
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(
                    width: SizeConfig.screenWidth! / 205.5, color: textColor),

                /// 2
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(width: 1, color: texthint),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: 'رقم الهاتف',
              hintStyle: TextStyle(color: texthint.withOpacity(0.3)),
              labelText: 'رقم الهاتف',
              labelStyle: TextStyle(color: texthint.withOpacity(0.6))),
             /* validator: (value) {
              if (value == null || value.isEmpty ||value.length < 8) {
                return 'الرجاء إدخال  رقم واتساب ';
              }
              return null;
            },*/
            validator:(value)=> validateMobile(value),
        ),
      ),
    );
  }

//

String? validateMobile(String? value) {
String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
RegExp regExp = new RegExp(patttern);
if (value!.length == 0) {
       return 'الرجاء إدخال  رقم واتساب ';
}
else if (!regExp.hasMatch(value)) {
      return 'الرجاء إدخال  رقم واتساب ';
}
return null;
}
}
