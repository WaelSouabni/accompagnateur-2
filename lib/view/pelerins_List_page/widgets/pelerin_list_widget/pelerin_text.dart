import 'package:accompagnateur/view/home_page/components/colors.dart';
import 'package:accompagnateur/view/home_page/components/size_config.dart';
import 'package:flutter/material.dart';

class PelerinText extends StatefulWidget {
  String PelerinName;
  String PelerinEtat;
  String telephone;
  PelerinText({Key? key, required this.PelerinName, required this.PelerinEtat, required this.telephone}) : super(key: key);

  @override
  _PelerinTextState createState() => _PelerinTextState();
}

class _PelerinTextState extends State<PelerinText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${widget.PelerinName}",
          style: TextStyle(color: Colors.black, fontSize: SizeConfig.screenHeight!/42.69),                 /// 16
          maxLines: 2,
        ),
        SizedBox(height: SizeConfig.screenHeight!/341.5),        /// 2.0
        Text.rich(
            (widget.PelerinEtat =='0')?
    TextSpan(
        text: "مرفوض",
        style: TextStyle(
            fontWeight: FontWeight.w600, color: buttonColor, fontSize: SizeConfig.screenHeight!/37.95   /// 18
        ),
        children: [
          TextSpan(
              text: ' - ${widget.telephone}',
              style: Theme.of(context).textTheme.bodyText1),
        ],
      ):  (widget.PelerinEtat =='1')?
        TextSpan(
            text: "في الانتظار",
            style: TextStyle(
                fontWeight: FontWeight.w600, color: buttonColor, fontSize: SizeConfig.screenHeight!/37.95   /// 18
            ),
            children: [
              TextSpan(
                   text: ' - ${widget.telephone}',
                  style: Theme.of(context).textTheme.bodyText1),
            ],
          )
          :TextSpan(
                text: "مؤكد",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: buttonColor, fontSize: SizeConfig.screenHeight!/37.95   /// 18
                ),
                children: [
                  TextSpan(
                        text: ' - ${widget.telephone}',
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
        ),
      ],
    );
  }
}
