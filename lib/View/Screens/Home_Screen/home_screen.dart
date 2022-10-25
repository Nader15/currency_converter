import 'package:currency_converter/Logic/controllers/home_controller.dart';
import 'package:currency_converter/Routes/routes.dart';
import 'package:currency_converter/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_keyboard_2/virtual_keyboard_2.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          appBar: AppBar(
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
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextButton(
                                onPressed: (){
                                  homeController.firstValueSelected(true);
                                  Get.toNamed(Routes.selectCurrencyScreen);
                                },
                                child: Row(
                                  children:  [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        "${homeController.firstValue}",
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    // SizedBox(width: 10),
                                    const Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(
                                "100",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: AppColors.TEAL_COLOR,
                                  fontWeight: FontWeight.bold,
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
                                onPressed: (){
                                  homeController.secondValueSelected(true);
                                  Get.toNamed(Routes.selectCurrencyScreen);
                                },
                                child: Row(
                                  children:  [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        "${homeController.secondValue}",
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    // SizedBox(width: 10),
                                    const Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(
                                "6.336",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: AppColors.TEAL_COLOR,
                                  fontWeight: FontWeight.bold,
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
                child: Container(
                  // Keyboard is transparent
                  color: AppColors.Tile_DARK_COLOR,
                  child: VirtualKeyboard(
                    // [0-9] + .
                    type: VirtualKeyboardType.Numeric,
                    fontSize: 20,
                    textColor: AppColors.TEAL_COLOR,
                    // builder: (context, keyboardKey){
                    //   return Text(keyboardKey.text!);
                    // },
                    textController: homeController.valueController.value,
                  ),
                ),
              )
            ],
          ));
    });
  }

}
