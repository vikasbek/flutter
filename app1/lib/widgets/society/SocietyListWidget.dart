import 'package:app1/models/SocietyInfoItemModel.dart';
import 'package:flutter/material.dart';

class SocietyListItemWidget extends StatelessWidget {
  final SocietyInfoItemModel item;

  const SocietyListItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
          child: ListTile(
            onTap: () {
              
            },
            contentPadding: EdgeInsets.all(10),
            leading: Image.network(item.societyLogo),
            title: Text("${item.societyShortName}"),
            subtitle: Text("${item.societyDisplayName}"),
          ),
    );
  }
}