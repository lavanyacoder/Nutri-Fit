import 'package:flutter/material.dart';
import 'package:nutri_fit/common/colo_extension.dart';
import 'package:nutri_fit/common_widget/on_boarding_page.dart';
import 'package:nutri_fit/view/login/signup_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;
  PageController controller = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(() {
      selectPage = controller.page?.round() ?? 0;

      setState(() {});
    });
  }

  List pageArr = [
    {
      "title": "Track Your Goal",
      "subtitle":
          "Track your fitness journey effortlessly! Set personal goals, monitor progress, and stay motivated every step of the way. Whether it's hitting your daily step count or burning calories, this page helps you stay on target and achieve your goals with real-time updates and easy goal adjustments.",
      "image": "assets/img/on_1.png"
    },
    {
      "title": "Feel the Burn",
      "subtitle":
          "Push through the challenge to reach your goals. The pain is temporary, but the results last forever. Don’t give up now!",
      "image": "assets/img/on_2.png"
    },
    {
      "title": "Eat Well with Smart Nutrition",
      "subtitle":
          "Track your calories and nutrients effortlessly with our app. Let's make healthy eating easy and enjoyable every day!",
      "image": "assets/img/on_3.png"
    },
    {
      "title": "Enhance Your Sleep Quality",
      "subtitle":
          "Achieve restful, rejuvenating sleep with our guidance. Wake up refreshed and ready to take on the day with a brighter mood!",
      "image": "assets/img/on_4.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
              controller: controller,
              itemCount: pageArr.length,
              itemBuilder: (context, index) {
                var pObj = pageArr[index] as Map? ?? {};
                return OnBoardingPage(pObj: pObj);
              }),
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    color: TColor.primaryColor1,
                    value: (selectPage + 1) / 4,
                    strokeWidth: 2,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: TColor.primaryColor1,
                      borderRadius: BorderRadius.circular(35)),
                  child: IconButton(
                    icon: Icon(
                      Icons.navigate_next,
                      color: TColor.white,
                    ),
                    onPressed: () {
                      if (selectPage < 3) {
                        selectPage = selectPage + 1;

                        controller.animateToPage(selectPage,
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.bounceInOut);

                        // controller.jumpToPage(selectPage);

                        setState(() {});
                      } else {
                        // Open Welcome Screen
                        print("Open Welcome Screen");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpView()));
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
