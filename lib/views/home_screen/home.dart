import 'package:ecom/consts/consts.dart';
import 'package:ecom/controller/home_controller.dart';
import 'package:ecom/views/affirmation_screen/affirmation_screen.dart';
import 'package:ecom/views/breathe_screen/breathe_screen.dart';
import 'package:ecom/views/home_screen/home_screen.dart';
import 'package:ecom/views/journaling_screen/journal_screen.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //init home controller
    var controller = Get.put(HomeController());
    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(icHome, width: 26), label: home),
      BottomNavigationBarItem(
          icon: Image.asset(icCategories, width: 26), label: affirmations),
      BottomNavigationBarItem(
          icon: Image.asset(icCart, width: 26), label: breathein),
      BottomNavigationBarItem(
          icon: Image.asset(icProfile, width: 26), label: journaling),
    ];

    var navBody = [
      const HomeScreen(),
      const AffirmationScreen(),
      const BreatheScreen(),
      const JournalScreen(),
    ];

    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: blueColor,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          items: navbarItem,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
      //bottomNavigationBar: BottomNavigationBar(items: []),
    );
  }
}
