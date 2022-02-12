import 'package:deep_crypto/common_widgets/common_widgets.dart';
import 'package:deep_crypto/models/models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget cryptoDetailsWidget(
    {required CryptoDetails cryptoDetails, required String cryptoName}) {
  var date = DateTime.fromMillisecondsSinceEpoch(
      int.parse(cryptoDetails.timestamp.toString()) * 1000);
  var output = DateFormat('dd MMM yyyy, HH:mm:ss ').format(date);
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin:
          const EdgeInsets.only(left: 16.0, right: 8, top: 16, bottom: 8),
          child: Row(
            children: [
              DText(cryptoName.toUpperCase(),
                  variant: TypographyVariant.title),
              const Spacer(),
              DText(output.toString(), variant: TypographyVariant.h1),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DText('OPEN', variant: TypographyVariant.header),
                  DText('\$' + cryptoDetails.open.toString(),
                      variant: TypographyVariant.h1),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DText('HIGH', variant: TypographyVariant.header),
                  DText('\$' + cryptoDetails.high.toString(),
                      variant: TypographyVariant.h1),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DText('LOW', variant: TypographyVariant.header),
                  DText('\$' + cryptoDetails.low.toString(),
                      variant: TypographyVariant.h1),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DText('LAST', variant: TypographyVariant.header),
                  DText('\$' + cryptoDetails.last.toString(),
                      variant: TypographyVariant.h1),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DText('VOLUME', variant: TypographyVariant.header),
              DText(cryptoDetails.volume.toString(),
                  variant: TypographyVariant.h1),
            ],
          ),
        ),
      ],
    ),
  );
}