import 'package:depot_boisson/views/agent/home_page.dart';
import 'package:depot_boisson/views/shared/Home.dart';
import 'package:depot_boisson/widgets/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
      () => NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: (index) => controller.selectedIndex.value = index,
        destinations: [
          NavigationDestination(
            icon: Icon(Iconsax.home),
            label: 'Home',
          ),
           NavigationDestination(
            icon: Icon(Iconsax.user),
            label: 'profile',
          ),
        ]
        ),
      ),
        body: Obx(() => controller.screen[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screen = [HomeScreen(),ProfileScreen()];
}