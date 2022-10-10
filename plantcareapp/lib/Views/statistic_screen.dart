import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plantcareapp/Models/plant.dart';
import 'package:plantcareapp/Uitls/typography.dart';
import 'package:plantcareapp/Widgets/custom_analysis_bar_widget.dart';

import '../Uitls/colors.dart';
import '../Uitls/icondata.dart';

class StatisticScreen extends StatefulWidget {
  Plant plant;
  StatisticScreen({Key? key, required this.plant}) : super(key: key);

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.kLightGreen,
      body: Stack(children: [
        Padding(
          padding: EdgeInsets.only(
            top: 80.h,
            left: 20.w,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: CustomColors.kSimeLightGreen),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 5.w,
                    ),
                    child: Icon(
                      CustomIconData.kBackIos,
                      color: CustomColors.kWhite,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 60.w,
              ),
              Text(
                'Statistic',
                style: CustomTextStyle.kHeadingTextStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 140.h,
            left: 135.w,
          ),
          child: Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(widget.plant.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 250.h,
            left: 140.w,
          ),
          child: Text(
            widget.plant.title,
            style: CustomTextStyle.kHeadingTextStyle,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 275.h,
            left: 145.w,
          ),
          child: Text(
            widget.plant.subTitle,
            style: CustomTextStyle.ksubTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 300.h,
            left: 140.w,
          ),
          child: Container(
            width: 100.w,
            height: 35.h,
            decoration: BoxDecoration(
              color: CustomColors.kTiniLightGreen,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Center(
              child: Text('25 days old'),
            ),
          ),
        ),
        DraggableScrollableSheet(
          maxChildSize: 0.8,
          initialChildSize: 0.5,
          minChildSize: 0.3,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r)),
                color: CustomColors.kWhite,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 14.h,
                      left: 20.w,
                      right: 20.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Water Level',
                          style: CustomTextStyle.kHeadingTextStyle
                              .copyWith(letterSpacing: 0.2, fontSize: 18.sp),
                        ),
                        Text(
                          'More info',
                          style: CustomTextStyle.ksubTextStyle
                              .copyWith(color: CustomColors.kDarkOrange),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 14.h,
                      left: 20.w,
                      right: 20.w,
                    ),
                    child: const ShortBar(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 14.h, left: 20.w),
                    child: Container(
                      width: 100.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                        color: CustomColors.kPink,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: Text(
                          '! Need Water',
                          style: CustomTextStyle.ksubTextStyle
                              .copyWith(color: CustomColors.kWhite),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 23.w, top: 10.h),
                    child: const Text('Give me a Water 25ml(0.03L) Today'),
                  )
                ],
              ),
            );
          },
        )
      ]),
    );
  }
}
