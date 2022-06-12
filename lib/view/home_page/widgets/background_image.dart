import 'package:accompagnateur/view/home_page/widgets/username_text.dart';
import 'package:flutter/material.dart';


import '../../home_page/components/size_config.dart';
import '../../login_page/widgets/text_title.dart';


class BackgroundImage extends StatelessWidget {
 
   const BackgroundImage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: SizeConfig.screenHeight!/4.268,    /// 160.0
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/main/background_image.png'),
                    fit: BoxFit.fill
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UserNameText(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
