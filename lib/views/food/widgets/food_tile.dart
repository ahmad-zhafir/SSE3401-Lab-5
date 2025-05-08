import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_foodly/common/app_style.dart';
import 'package:restaurant_foodly/common/reusable_text.dart';
import 'package:restaurant_foodly/constants/constants.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
    super.key, required this.food,
  });

  final Map<String, dynamic> food;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.h, vertical:  4),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: kOffWhite,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: SizedBox(
                    width: 62.w,
                    height: 62.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.6),
                      child: Image.asset(food['imagePath'],
                        fit: BoxFit.cover,),
                    ),
                  ),
                ),

                SizedBox(width: 12.w,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ReusableText(text: food["title"], style: appStyle(11, kDark, FontWeight.w500)),
                    ReusableText(text: "Delivery time: ${food["time"]}", style: appStyle(9, kGray, FontWeight.w500)),
                    SizedBox(
                      width: width*0.7,
                      height: 16.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: food["additives"].length,
                          itemBuilder: (context, i){
                            String title = food["additives"][i]["title"];
                            return Container(
                              margin: EdgeInsets.only(right: 5.w),
                              decoration: BoxDecoration(
                                color: kSecondaryLight,
                                borderRadius: BorderRadius.circular(9.r),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                                  child: ReusableText(text: title, style: appStyle(8, kGray, FontWeight.w400)),
                                ),
                              ),
                            );
                          }),
                    ),

                  ],
                ),


            ],
            ),
            Positioned(
              right: 5.w,
              top: 5.h,
              child: Container(
              height: 19.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: kPrimary,
                borderRadius: BorderRadius.circular(12.r)
              ),
              child: Center(
                child: ReusableText(
                    text: "\$ ${food['price'].toStringAsFixed(2)}",
                    style: appStyle(12, kLightWhite, FontWeight.bold)
                )
              ),
              ),
            )
          ],
        ),

      ),
    );
  }
}