import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:plantcareapp/Models/plant.dart';
import 'package:plantcareapp/Uitls/colors.dart';
import 'package:plantcareapp/Uitls/icondata.dart';
import 'package:plantcareapp/Uitls/images_path.dart';
import 'package:plantcareapp/Uitls/typography.dart';
import 'package:plantcareapp/Views/detail_screen.dart';

import '../Widgets/custom_container.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var controller = PageController(
    initialPage: 0,
  );
  int currentPage = 0;
  int current = 0;
  late Timer _timer;
  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (currentPage < plantList.length) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      controller.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.kLightGreen,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 60.h,
                left: 70.w,
                bottom: 10.h,
              ),
              child: Text(
                'Hello, Sumarti',
                style: CustomTextStyle.kHeadingTextStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 90.h,
                left: 40.w,
              ),
              child: Text(
                "Let's starting taking care of your plants now",
                textAlign: TextAlign.start,
                style: CustomTextStyle.ksubTextStyle,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 140.h),
                child: Image(image: AssetImage(CustomAssets.kDashboard))),
            Padding(
              padding: EdgeInsets.only(top: 115.h, left: 40.w),
              child: CustomContainer(
                voidCallback: () {},
                height: 45,
                wdith: 260,
                color: CustomColors.kDarkOrange,
                mywidget: Row(children: [
                  SizedBox(
                    width: 60.w,
                  ),
                  Icon(
                    CustomIconData.kAdd,
                    color: CustomColors.kWhite,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Add New Plant',
                    style: CustomTextStyle.ksubTextStyle.copyWith(
                      fontSize: 15.sp,
                      letterSpacing: 0.2,
                      color: CustomColors.kWhite,
                    ),
                  )
                ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 90.h),
              child: DraggableScrollableSheet(
                maxChildSize: 0.8,
                initialChildSize: 0.6,
                minChildSize: 0.5,
                builder: (context, scrollController) {
                  return SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45.r),
                            topRight: Radius.circular(45.r)),
                        color: CustomColors.kLightYellow,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              width: 100,
                              height: 4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 6.h,
                              left: 20.w,
                              right: 20.w,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recent Plant',
                                  style: CustomTextStyle.kHeadingTextStyle
                                      .copyWith(
                                          letterSpacing: 0.2, fontSize: 18.sp),
                                ),
                                Text(
                                  'See All',
                                  style: CustomTextStyle.ksubTextStyle.copyWith(
                                      color: CustomColors.kDarkOrange),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 2.h,
                              left: 8.w,
                              right: 8.w,
                            ),
                            child: SizedBox(
                              height: 280.h,
                              child: PageView.builder(
                                controller: controller,
                                itemCount: plantList.length,
                                itemBuilder: (context, index) {
                                  return CustomCards(
                                    plant: plantList[index],
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}

class CustomCards extends StatelessWidget {
  const CustomCards({Key? key, required this.plant}) : super(key: key);
  final Plant plant;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h, left: 8.w, right: 8.w),
      child: GestureDetector(
        onTap: () => Get.to(() => DetailScreen(
              plant: plant,
            )),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 300.w,
                height: 130.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(plant.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.h, left: 16.w),
              child: Text(
                plant.title,
                style: CustomTextStyle.kHeadingTextStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.h, left: 16.w),
              child: Text(
                plant.subTitle,
                style: CustomTextStyle.ksubTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  LinearPercentIndicator(
                    width: 140.0,
                    lineHeight: 14.0,
                    percent: plant.percentage,
                    animation: true,
                    curve: Curves.bounceIn,
                    barRadius: Radius.circular(20),
                    backgroundColor: CustomColors.kDarkOrange.withOpacity(0.3),
                    progressColor: CustomColors.kDarkOrange,
                  ),
                  Text(
                    plant.days,
                    style: CustomTextStyle.ksubTextStyle.copyWith(
                      color: CustomColors.kDarkOrange,
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
