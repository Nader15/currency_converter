import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:currency_converter/Logic/controllers/home_controller.dart';
import 'package:currency_converter/Routes/routes.dart';
import 'package:currency_converter/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Widgets/keyboard.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          backgroundColor: AppColors.BLACK_COLOR,
          appBar: AppBar(
            backgroundColor: AppColors.Tile_DARK_COLOR,
            title: const Text("Exchange Rate"),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextButton(
                                onPressed: () {
                                  homeController.firstCountrySelected(true);
                                  Get.toNamed(Routes.selectCurrencyScreen);
                                },
                                style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all(
                                        AppColors.WHITE_COLOR)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        "${homeController.firstCountry} ${homeController.firstCurrency}",
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    // SizedBox(width: 10),
                                    const Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                        color: AppColors.Tile_DARK_COLOR,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: TextButton(
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              homeController
                                                      .firstValueSelected.value
                                                  ? AppColors.TEAL_COLOR
                                                  : AppColors.WHITE_COLOR)),
                                  onPressed: () {
                                    homeController.firstValueSelected(true);
                                    homeController.secondValueSelected(false);
                                  },
                                  child: ConditionalBuilder(
                                    condition: !homeController
                                        .firstValueIsLoading.value,
                                    builder: (context) => Text(
                                      homeController
                                          .firstValueController.value.text,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                    fallback: (context) => const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: AppColors.WHITE_COLOR,
                                        strokeWidth: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextButton(
                                onPressed: () {
                                  homeController.secondCountrySelected(true);
                                  Get.toNamed(Routes.selectCurrencyScreen);
                                },
                                style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all(
                                        AppColors.WHITE_COLOR)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        "${homeController.secondCountry} ${homeController.secondCurrency}",
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    // SizedBox(width: 10),
                                    const Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                        color: AppColors.Tile_DARK_COLOR,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: TextButton(
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              homeController
                                                      .secondValueSelected.value
                                                  ? AppColors.TEAL_COLOR
                                                  : AppColors.WHITE_COLOR)),
                                  onPressed: () {
                                    homeController.secondValueSelected(true);
                                    homeController.firstValueSelected(false);
                                  },
                                  child: ConditionalBuilder(
                                    condition: !homeController
                                        .secondValueIsLoading.value,
                                    builder: (context) => Text(
                                      homeController
                                          .secondValueController.value.text,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                    fallback: (context) => const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: AppColors.WHITE_COLOR,
                                        strokeWidth: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: CustomKeyboardScreen(),
              )
            ],
          ));
    });
  }
}
