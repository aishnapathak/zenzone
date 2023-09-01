import 'package:ecom/consts/consts.dart';
import 'package:ecom/consts/lists.dart';
import 'package:ecom/views/auth_screen/signup_screen.dart';
import 'package:ecom/views/home_screen/home.dart';
import 'package:ecom/widgets_common/applogo_widgets.dart';
import 'package:ecom/widgets_common/bg_widgit.dart';
import 'package:ecom/widgets_common/custom_textfield.dart';
import 'package:ecom/widgets_common/our_button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: blueColor,
          body: Center(
            child: Column(children: [
              (context.screenHeight * 0.2).heightBox,
              applogoWidget(),
              10.heightBox,
              "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
              15.heightBox,
              Column(
                children: [
                  customTextField(hint: emailHint, title: email, isPass: false),
                  customTextField(
                      hint: passwordHint, title: password, isPass: true),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: forgetPass.text.make())),
                  5.heightBox,
                  ourButton(
                      color: blueColor,
                      title: login,
                      textColor: whiteColor,
                      onPress: () {
                        Get.to(() => const Home());
                      }).box.width(context.screenWidth - 50).make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  ourButton(
                      color: whiteColor,
                      textColor: blueColor,
                      title: signup,
                      onPress: () {
                        Get.to(() => const SignupScreen());
                      }).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => CircleAvatar(
                              backgroundColor: lightGrey,
                              radius: 25,
                              child: Image.asset(
                                socialIconList[index],
                                width: 30,
                              ),
                            )),
                  )
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make()
            ]),
          )),
    );
  }
}
