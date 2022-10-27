import 'package:currency_converter/Logic/controllers/home_controller.dart';
import 'package:currency_converter/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Widgets/search_widget.dart';

class SelectCurrencyScreen extends StatelessWidget {
  SelectCurrencyScreen({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Currency"),
        centerTitle: true,
        // bottom: PreferredSize(
        //   preferredSize: const Size.fromHeight(60),
        //   child: Padding(
        //     padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
        //     child: SearchTextField(),
        //   ),
        // ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: homeController.currenciesList.length,
        itemBuilder: (BuildContext context, int index) {
          return Obx(() {
            if (homeController.searchKey.value.isEmpty) {
              return ListTile(
                onTap: () async {
                  if (homeController.firstCountrySelected.value) {
                    homeController.firstCountry.value =
                        homeController.currenciesList[index].country;
                    homeController.firstCurrency.value =
                        homeController.currenciesList[index].currency;
                  }
                  if (homeController.secondCountrySelected.value) {
                    homeController.secondCountry.value =
                        homeController.currenciesList[index].country;
                    homeController.secondCurrency.value =
                        homeController.currenciesList[index].currency;
                  }
                  homeController.firstCountrySelected(false);
                  homeController.secondCountrySelected(false);
                  await homeController.convertCurrencies();
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
            }
            else{
              if (homeController.currenciesList[index].country
                  .toString()
                  .toLowerCase()
                  .startsWith(homeController.searchKey.value.toLowerCase())||homeController.currenciesList[index].currency
                  .toString()
                  .toLowerCase()
                      .startsWith(homeController.searchKey.value.toLowerCase())){
                return ListTile(
                  onTap: () async {
                    if (homeController.firstCountrySelected.value) {
                      homeController.firstCountry.value =
                          homeController.currenciesList[index].country;
                      homeController.firstCurrency.value =
                          homeController.currenciesList[index].currency;
                    }
                    if (homeController.secondCountrySelected.value) {
                      homeController.secondCountry.value =
                          homeController.currenciesList[index].country;
                      homeController.secondCurrency.value =
                          homeController.currenciesList[index].currency;
                    }
                    homeController.firstCountrySelected(false);
                    homeController.secondCountrySelected(false);
                    await homeController.convertCurrencies();
                    homeController.searchKey.value = '';
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
              }
              return Container();
            }
          });
        },
        // separatorBuilder: (context, index) {
        //   return Divider(
        //     color: AppColors.GREY_COLOR,
        //   );
        // },
      ),
    );
  }
}
