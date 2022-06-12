import 'package:accompagnateur/view/pelerins_List_page/widgets/Pelerin_list.dart';
import 'package:flutter/material.dart';

class PelerinsListView extends StatefulWidget {
  const PelerinsListView({Key? key}) : super(key: key);

  @override
  _PelerinsListViewState createState() => _PelerinsListViewState();
}

class _PelerinsListViewState extends State<PelerinsListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
   
      body: PelerinListWidget(),
    );
  }
}
