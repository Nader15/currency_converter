import 'package:currency_converter/Utils/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../Logic/controllers/home_controller.dart';

class CustomKeyboardScreen extends StatelessWidget {
  final homeController = Get.find<HomeController>();

  renderKeyboard() {
    return homeController.keys
        .map(
          (x) => Expanded(
            // flex: 2,
            child: Container(
              color: AppColors.Tile_DARK_COLOR,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: x.map((y) {
                        if (y == "*") {
                          return Expanded(
                            child: InkWell(
                              onTap: () {
                                homeController.onClearPress(y);
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  color: AppColors.TEAL_COLOR,
                                  margin: const EdgeInsets.all(2),
                                  child: const Icon(
                                    Icons.clear,
                                    color: AppColors.WHITE_COLOR,
                                  )),
                            ),
                          );
                        } else {
                          return Expanded(
                            child: KeyboardKey(
                              label: y,
                              onTap: homeController.onNumberPress,
                              value: y,
                            ),
                          );
                        }
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ...renderKeyboard(),
          ],
        ),
      ),
    );
  }
}

class KeyboardKey extends StatelessWidget {
  final String label;
  final dynamic value;
  final ValueSetter<dynamic> onTap;

  const KeyboardKey({
    super.key,
    required this.label,
    required this.onTap,
    @required this.value,
  }) : assert(value != null);

  renderLabel() {
    if (label is String) {
      return Text(
        label,
        style: const TextStyle(
          fontSize: 20.0,
          color: AppColors.WHITE_COLOR,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return label;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(value);
      },
      child: Container(
        margin: const EdgeInsets.all(2),
        color: AppColors.MAIN_COLOR,
        child: Center(
          child: renderLabel(),
        ),
      ),
    );
  }
}
