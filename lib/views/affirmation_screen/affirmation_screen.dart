import 'package:ecom/consts/consts.dart';
import 'package:ecom/consts/lists.dart';

class AffirmationScreen extends StatelessWidget {
  const AffirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: beigeColor,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            //swiper
            Align(
              alignment: Alignment.center,
              child: VxSwiper.builder(
                autoPlayAnimationDuration: const Duration(milliseconds: 200),
                autoPlayInterval: const Duration(seconds: 2),
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                height: 400,
                itemCount: slidersList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Image.asset(
                      slidersList[index],
                      fit: BoxFit.fill,
                    )
                        .box
                        .rounded
                        .clip(Clip.antiAlias)
                        .margin(const EdgeInsets.symmetric(horizontal: 8))
                        .make(),
                  );
                },
              ),
            ),
            30.heightBox,
            "Look in the mirror and remind yourself everyday!"
                .text
                .fontFamily(bold)
                .green800
                .center
                .size(26)
                .make(),
            Image.asset(
              slbg,
              width: 270,
              height: 250,
            ),
          ],
        ),
      ),
    );
  }
}
