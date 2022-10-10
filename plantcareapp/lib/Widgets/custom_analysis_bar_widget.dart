import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantcareapp/Uitls/colors.dart';
import 'package:plantcareapp/Uitls/images_path.dart';
import 'package:plantcareapp/Uitls/typography.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Models/sale.dart';

class ShortBar extends StatelessWidget {
  const ShortBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            height: 200.h,
            child: SfCartesianChart(
                legend: Legend(
                  borderWidth: 0.0,
                ),
                plotAreaBorderWidth: 0.0,
                plotAreaBackgroundColor: Colors.transparent,
                borderColor: Colors.transparent,
                backgroundColor: CustomColors.kLightBlue.withOpacity(0.5),
                primaryYAxis: CategoryAxis(
                  minorTickLines: const MinorTickLines(width: 0),
                  maximumLabelWidth: 0,
                  labelIntersectAction: AxisLabelIntersectAction.hide,
                  labelStyle: CustomTextStyle.ksubTextStyle,
                  isVisible: true,
                  axisLine: const AxisLine(width: 0),
                ),
                primaryXAxis: CategoryAxis(
                  isVisible: false,
                  labelStyle: CustomTextStyle.ksubTextStyle,
                  axisLine: const AxisLine(width: 0),
                  majorGridLines: const MajorGridLines(width: 0),
                  majorTickLines: const MajorTickLines(width: 0),
                ),
                series: <StackedLineSeries<SalesData, int>>[
                  StackedLineSeries<SalesData, int>(
                      markerSettings: const MarkerSettings(
                        isVisible: true,
                        borderColor: Colors.blue,
                      ),
                      color: Colors.blue,
                      dataSource: <SalesData>[
                        SalesData(2010, 25),
                        SalesData(2011, 27),
                        SalesData(2012, 27),
                        SalesData(2013, 20),
                        SalesData(2014, 20)
                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales)
                ])));
  }
}
