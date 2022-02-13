import 'package:deep_crypto/helper/helper.dart';
import 'package:flutter/material.dart';

class DText extends StatelessWidget {
  final String data;
  final TypographyVariant variant;

  final Locale? locale;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? semanticsLabel;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final double? textScaleFactor;
  final TextWidthBasis? textWidthBasis;
  final Color? textColor;


  const DText(
      this.data, {
        required this.variant,
        Key? key,
        this.locale,
        this.maxLines,
        this.overflow,
        this.semanticsLabel,
        this.softWrap,
        this.strutStyle,
        this.style,
        this.textAlign,
        this.textDirection,
        this.textScaleFactor,
        this.textWidthBasis,
        this.textColor ,
      }) : super(key: key);

  static TextStyle? styleForVariant(
      BuildContext context, TypographyVariant variant,
      {TextStyle overrides = const TextStyle(),Color? textColor}) {
    TextStyle? style;

    switch (variant) {
      case TypographyVariant.title:
        style =  TextStyle(
          color: textColor ?? DColors.blackColor,
          fontWeight: FontWeight.w700,
          fontSize: 22,
          fontFamily: 'Roboto',
        );
        break;
      case TypographyVariant.titleSmall:
        style =  TextStyle(
          color: textColor ??DColors.blackColor,
          fontWeight: FontWeight.w500,
          fontSize: 20,
          height: 1,
          fontFamily: 'Roboto',
        );
        break;
      case TypographyVariant.header:
        style =  TextStyle(
          color:textColor ?? DColors.darkGreyColor,
          fontWeight: FontWeight.w500,
          fontSize: 18,
          fontFamily: 'Roboto',
        );
        break;
      case TypographyVariant.h1:
        style =  TextStyle(
          color:textColor ?? Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 15,
          height: 1.0,
          fontFamily: 'Roboto',
        );
        break;

    }

    return style.merge(overrides);
  }

  @override
  Widget build(BuildContext context) {
    final style =
    DText.styleForVariant(context, variant,textColor: textColor)!.merge(this.style);
    return Text(
      data,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      style: style,
      textAlign: textAlign,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
      maxLines: maxLines,
    );
  }
}

enum TypographyVariant {
  title,
  titleSmall,
  header,
  h1,
}
