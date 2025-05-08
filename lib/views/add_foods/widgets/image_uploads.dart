import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_foodly/common/app_style.dart';
import 'package:restaurant_foodly/common/custom_button.dart';
import 'package:restaurant_foodly/common/reusable_text.dart';
import 'package:restaurant_foodly/constants/constants.dart';
import 'package:restaurant_foodly/controllers/uploader_controller.dart';
import 'package:get/get.dart';

class ImageUploads extends StatelessWidget {
  const ImageUploads({super.key, required this.back, required this.next});

  final Function back;
  final Function next;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploaderController());
    return SizedBox(
      height: height,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: "Upload Images",
                  style: appStyle(16, kGray, FontWeight.w600),
                ),
                ReusableText(
                  text:
                  "You are required to upload at least two images to proceed ",
                  style: appStyle(11, kGray, FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //image 1
                      GestureDetector(
                        onTap:(){
                          controller.pickImage('one');
                        },
                        child: Obx(() => Container(
                          height: 120.h,
                          width: width/2.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: kGrayLight)
                          ),
                          child: controller.imageOneUrl == '' ? Center(
                              child: ReusableText(
                                text: "Upload Image",
                                style: appStyle(16, kDark, FontWeight.w600),
                              )
                          ): ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.network(
                              controller.imageOneUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                      ),
                      //image 2
                      GestureDetector(
                        onTap:(){
                          controller.pickImage('two');
                        },
                        child: Obx(() => Container(
                          height: 120.h,
                          width: width/2.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: kGrayLight)
                          ),
                          child: controller.imageTwoUrl == '' ? Center(
                              child: ReusableText(
                                text: "Upload Image",
                                style: appStyle(16, kDark, FontWeight.w600),
                              )
                          ): ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.network(
                              controller.imageTwoUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                      ),

                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //image 3
                      GestureDetector(
                        onTap:(){
                          controller.pickImage('three');
                        },
                        child: Obx(() => Container(
                          height: 120.h,
                          width: width/2.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: kGrayLight)
                          ),
                          child: controller.imageThreeUrl == '' ? Center(
                              child: ReusableText(
                                text: "Upload Image",
                                style: appStyle(16, kDark, FontWeight.w600),
                              )
                          ): ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.network(
                              controller.imageThreeUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                      ),
                      //image 4
                      GestureDetector(
                        onTap:(){
                          controller.pickImage('four');
                        },
                        child: Obx(() => Container(
                          height: 120.h,
                          width: width/2.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: kGrayLight)
                          ),
                          child: controller.imageFourUrl == '' ? Center(
                              child: ReusableText(
                                text: "Upload Image",
                                style: appStyle(16, kDark, FontWeight.w600),
                              )
                          ): ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.network(
                              controller.imageFourUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                      ),

                    ],
                  ),
                  SizedBox(height: 25.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                          text: "Back",
                          onTap: (){
                            back();
                          },
                          btnRadius: 9,
                          btnWidth: width/2.3,
                      ),
                      CustomButton(
                        text: "Next",
                        onTap: (){
                          next();
                          /*
                          if(controller.images.length>1){
                            next();
                          } else{
                            Get.snackbar(
                                colorText: kLightWhite,
                                backgroundColor: kPrimary,
                                snackPosition: SnackPosition.TOP,
                                "Upload required images", "Please upload at least 2 images"
                            );
                          }*/

                        },
                        btnRadius: 9,
                        btnWidth: width/2.3,
                      ),
                    ],
                  )
                ],
              ),
            ),

          ),
        ],
      ),
    );
  }
}
