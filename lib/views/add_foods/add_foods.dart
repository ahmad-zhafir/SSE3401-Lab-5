import 'package:flutter/material.dart';
import 'package:restaurant_foodly/common/app_style.dart';
import 'package:restaurant_foodly/common/background_container.dart';
import 'package:restaurant_foodly/common/reusable_text.dart';
import 'package:restaurant_foodly/constants/constants.dart';
import 'package:restaurant_foodly/views/add_foods/widgets/additives_info.dart';
import 'package:restaurant_foodly/views/add_foods/widgets/all_categories.dart';
import 'package:restaurant_foodly/views/add_foods/widgets/food_info.dart';
import 'package:restaurant_foodly/views/add_foods/widgets/image_uploads.dart';

class AddFoods extends StatefulWidget {
  const AddFoods({super.key});

  @override
  State<AddFoods> createState() => _AddFoodsState();
}

class _AddFoodsState extends State<AddFoods> {

  final PageController _pageController = PageController();
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController preparation = TextEditingController();
  final TextEditingController types = TextEditingController();
  final TextEditingController additiveTitle = TextEditingController();
  final TextEditingController additivePrice = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    price.dispose();
    preparation.dispose();
    types.dispose();
    _pageController.dispose();
    additiveTitle.dispose();
    additivePrice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        backgroundColor: kSecondary,
        centerTitle: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
                text: "Welcome to Foodly Restaurant",
                style: appStyle(14, kLightWhite, FontWeight.w600)),
            ReusableText(
                text: "Fill all the required info to add food items",
                style: appStyle(12, kLightWhite, FontWeight.normal)),
          ],
        ),
      ),
      body: BackgroundContainer(
          child: ListView(
            children: [
              SizedBox(
                width: width,
                height: height,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  pageSnapping: false,
                  children: [
                    ChooseCategory(
                      next: () {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn
                        );
                      },
                    ),

                    ImageUploads(
                      back: (){
                        _pageController.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn
                        );
                      },
                      next: (){
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn
                        );
                      },
                    ),

                    FoodInfo(
                        title: title,
                        description: description,
                        price: price,
                        preparation: preparation,
                        types: types,
                        back: (){
                          _pageController.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn
                          );
                        },
                        next: (){
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn
                          );
                      },
                    ),

                    AdditivesInfo(
                      additiveTitle: additiveTitle,
                      additivePrice: additivePrice,
                    )

                  ],
                ),
              )
            ],

          )
      ),
    );
  }
}
