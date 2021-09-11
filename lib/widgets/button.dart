import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final Color color;
  final bool active;
  final Color activeColor;

  const CustomButton({
    Key key,
    this.child,
    this.onTap,
    this.color,
    this.activeColor,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: active ? null : onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        decoration: BoxDecoration(
          color: active ? activeColor : color,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: child,
      ),
    );
  }
}
