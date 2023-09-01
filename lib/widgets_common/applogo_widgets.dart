import 'package:ecom/consts/consts.dart';

Widget applogoWidget() {
  //using velocity x
  return Image.asset(icAppLogo)
      .box
      .white
      .size(100, 100)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}
