import 'package:flutter/material.dart';
import 'package:flutter_material3/pages/Home/home.dart';
import 'package:flutter_material3/pages/Profile/profile.dart';
import 'package:flutter_material3/pages/Qr/qr-scanner.dart';
import 'package:flutter_material3/routes/routes.dart';
import 'package:flutter_material3/utils/tab_items.dart';
import 'package:get/get.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int? selectedIndex;

  int currentIndex = 0;
    
  void onTap(int index) {
    if(index == 2){
      Get.toNamed(RouteHelper.getQrScanner());
    }else{
      setState(() {
        currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if(selectedIndex != null){
      currentIndex = selectedIndex!;
    }
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(tabItems[currentIndex].title),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onTap,
         destinations: tabItems.map((item) {
          return NavigationDestination(
            icon: item.icon,
            label: item.title,
          );
        }).toList()),
      body: tabItems[currentIndex].page,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: ()=>Get.toNamed(RouteHelper.getQrScanner()),
        child: const Icon(Icons.qr_code_rounded),
      )
    );
  }
}


List<TabItem> tabItems = [
  TabItem(page: const Home(), title: 'Home', icon: const Icon(Icons.home_rounded)),
  TabItem(page: const Home(), title: 'Notes', icon: const Icon(Icons.note_rounded)),
  TabItem(page: const QrScanner(), title: '', icon: Container()), // Empty TabItem
  TabItem(page: const Home(), title: 'Tab3', icon: const Icon(Icons.tab_rounded)),
  TabItem(page: const Profile(), title: 'Profile', icon: const Icon(Icons.person_rounded)),
];