
import 'package:deep_crypto/common_widgets/common_widgets.dart';
import 'package:deep_crypto/helper/helper.dart';
import 'package:deep_crypto/models/models.dart';
import 'package:flutter/material.dart';

Widget orderBookWidget({required OrderBook? orderBook, required double height}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4, top: 6),
          child: DText('ORDER BOOK', variant: TypographyVariant.header),
        ),
        SizedBox(
          height: height - 400,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      DText(
                        'BID PRICE',
                        variant: TypographyVariant.h1,
                        textColor: DColors.greyColor,
                      ),
                      DText(
                        'QTY',
                        variant: TypographyVariant.h1,
                        textColor: DColors.greyColor,
                      ),
                      DText(
                        'QTY',
                        variant: TypographyVariant.h1,
                        textColor: DColors.greyColor,
                      ),
                      DText(
                        'ASK PRICE',
                        variant: TypographyVariant.h1,
                        textColor: DColors.greyColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: orderBook!.asks!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DText(
                              orderBook.asks![index][0],
                              variant: TypographyVariant.h1,
                              textColor: DColors.greyColor,
                            ),
                            DText(
                              orderBook.asks![index][1],
                              variant: TypographyVariant.h1,
                              textColor: DColors.greyColor,
                            ),
                            DText(
                              orderBook.bids![index][1],
                              variant: TypographyVariant.h1,
                              textColor: DColors.greyColor,
                            ),
                            DText(
                              orderBook.bids![index][0],
                              variant: TypographyVariant.h1,
                              textColor: DColors.greyColor,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}