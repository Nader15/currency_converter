import 'package:currency_converter/Logic/controllers/home_controller.dart';
import 'package:currency_converter/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_keyboard_2/virtual_keyboard_2.dart';

class SelectCurrencyScreen extends StatelessWidget {
  SelectCurrencyScreen({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Currency"),
        centerTitle: true,
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: homeController.currenciesList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              if (homeController.firstValueSelected.value) {
                homeController.firstValue.value =
                "${homeController.currenciesList[index]
                    .country} ${homeController.currenciesList[index].currency}";
              }
              if (homeController.secondValueSelected.value) {
                homeController.secondValue.value =
                "${homeController.currenciesList[index]
                    .country} ${homeController.currenciesList[index].currency}";
              }
              homeController.firstValueSelected(false);
              homeController.secondValueSelected(false);
              Get.back();
            },
            tileColor: AppColors.WHITE_COLOR,
            leading: Text(
              homeController.currenciesList[index].currency,
              style: const TextStyle(fontSize: 15),
            ),
            title: Text(
              homeController.currenciesList[index].country,
              style: const TextStyle(fontSize: 10),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: AppColors.GREY_COLOR,
          );
        },
      ),
    );
  }
}
