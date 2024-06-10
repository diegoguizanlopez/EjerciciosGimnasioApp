import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Estilo de Container predeterminado
class StyleContainer extends StatelessWidget {
  Widget child;
  EdgeInsets? edgeInsets;
  EdgeInsets? padding;
  double? width;
  double? height;
  double clip;
  Color? backgroundColor;
  Color? borderColor;

  Function()? onPressed;

  StyleContainer(
      {super.key,
      required this.child,
      this.edgeInsets,
      this.width,
      this.height,
      this.padding,
      this.clip = 0,
      this.backgroundColor = Colors.black,
      this.borderColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: borderColor != null ? Border.all(color: borderColor!) : null,
          borderRadius: BorderRadius.all(Radius.circular(clip)),
          color: backgroundColor,
        ),
        margin: edgeInsets ?? const EdgeInsets.all(0),
        child: Padding(
            padding: padding == null ? const EdgeInsets.all(0) : padding!,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(clip), child: child)),
      ),
    );
  }
}
