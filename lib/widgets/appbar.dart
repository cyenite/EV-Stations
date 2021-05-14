import 'package:ev_stations/constants/pallete.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget> actions;
  final Widget leading;
  final bool centerTitle;

  const CustomAppBar(
      {Key key, this.title, this.actions, this.leading, this.centerTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Palette.blackColor,
        border: Border(
          bottom: BorderSide(
            color: Palette.separatorColor,
            width: 1.4,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: AppBar(
        backgroundColor: Palette.blackColor,
        elevation: 0,
        leading: leading,
        actions: actions,
        centerTitle: centerTitle,
        title: title,
      ),
    );
  }

  final Size preferredSize = const Size.fromHeight(kToolbarHeight + 10);
}
