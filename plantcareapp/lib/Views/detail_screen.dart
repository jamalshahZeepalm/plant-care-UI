import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:plantcareapp/Models/plant.dart';
import 'package:plantcareapp/Uitls/colors.dart';
import 'package:plantcareapp/Uitls/icondata.dart';
import 'package:plantcareapp/Views/statistic_screen.dart';
import 'package:plantcareapp/Widgets/custom_container.dart';

import '../Uitls/typography.dart';

class DetailScreen extends StatefulWidget {
  final Plant plant;
  const DetailScreen({Key? key, required this.plant}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.kLightGreen,
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(
            top: 80.h,
            bottom: 10.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: CustomColors.kSimeLightGreen),
                child: Icon(
                  CustomIconData.kAdd,
                  color: CustomColors.kWhite,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: CustomColors.kSimeLightGreen),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        border: Border.all(
                          color: CustomColors.kWhite,
                        )),
                    child: Icon(
                      CustomIconData.kQuestionMark,
                      color: CustomColors.kWhite,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 5.h,
            bottom: 5.h,
          ),
          child: Text(
            widget.plant.title,
            textAlign: TextAlign.center,
            style: CustomTextStyle.kHeadingTextStyle.copyWith(fontSize: 25.sp),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: 10.h,
          ),
          child: Text(
            widget.plant.subTitle,
            textAlign: TextAlign.center,
            style: CustomTextStyle.ksubTextStyle.copyWith(fontSize: 14),
          ),
        ),
        Container(
          width: 270.w,
          height: 270.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(widget.plant.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h),
          child: Container(
            width: 300.w,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CustomColors.kTiniLightGreen),
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < widget.plant.checkStatus.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.plant.checkStatus[i],
                          textAlign: TextAlign.center,
                          style: i == 0
                              ? CustomTextStyle.kHeadingTextStyle
                                  .copyWith(fontSize: 18.sp, letterSpacing: 0.1)
                              : CustomTextStyle.ksubTextStyle,
                        ),
                      )
                  ]),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h, left: 14, right: 14.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomContainer(
                color: CustomColors.kWhite,
                mywidget: Center(
                  child: Text(
                    'How to Fix.?',
                    style: CustomTextStyle.ksubTextStyle
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                wdith: 120,
                height: 45,
                voidCallback: () {},
              ),
              CustomContainer(
                color: CustomColors.kDarkOrange,
                mywidget: Center(
                  child: Text(
                    'View Statistic',
                    style: CustomTextStyle.ksubTextStyle.copyWith(
                        color: CustomColors.kWhite,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                wdith: 120,
                height: 45,
                voidCallback: () {
                  Get.to(() => StatisticScreen(
                        plant: widget.plant,
                      ));
                  debugPrint('click it');
                },
              )
            ],
          ),
        )
      ]),
    );
  }
}
