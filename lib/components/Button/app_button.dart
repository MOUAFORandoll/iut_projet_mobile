import 'package:iut/styles/colorApp.dart';
import 'package:iut/styles/textStyle.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final String text;
  final Widget? leading;
  final VoidCallback? onTap;
  final bool disabled;
  final bool load;
  final MainAxisSize size;
  final BoxBorder? border;
  AppButton({
    Key? key,
    required this.text,
    this.bgColor = ColorsApp.black,
    this.textColor = Colors.white,
    this.onTap,
    this.leading,
    this.border,
    this.disabled = false,
    this.load = false,
    this.size = MainAxisSize.min,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onTap,
      child: Container(
        constraints:
            BoxConstraints(minHeight: kHeight / 17, minWidth: kWidth / 5),
        padding: EdgeInsets.symmetric(horizontal: kMarginX),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: disabled ? bgColor.withOpacity(.5) : bgColor,
            border: border),
        alignment: Alignment.center,
        child: load
            ? Container(
                child: CircularProgressIndicator(),
                height: 15,
                width: 15,
              )
            : Text(
                text,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: disabled ? textColor.withOpacity(.5) : textColor,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 12,
                ),
              ),
      ),
    );
  }
}
