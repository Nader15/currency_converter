import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Models/countries_model.dart';
import '../../Services/countries_services.dart';
import '../../Utils/local_storage/local_storage.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  Rx<TextEditingController> valueController = TextEditingController().obs;

  var currenciesList = <Currencies>[].obs;
  var firstValue = 'Kuwait dinar KWD'.obs;
  var secondValue = 'Egyptian Pound EGP'.obs;

  var firstValueSelected = false.obs;
  var secondValueSelected = false.obs;

  @override
  void onInit() async {
    super.onInit();
    getCountries();
  }

  getCountries() async {
    var countries = await HomeServices().getCountries();
    try {
      isLoading(true);
      if (countries.currencies!.isNotEmpty) {
        countries.currencies!.forEach((k, v) => currenciesList.add(Currencies(k, v)));
        print("${currenciesList.toString()}");
      }
    } finally {
      isLoading(false);
    }
  }
}
