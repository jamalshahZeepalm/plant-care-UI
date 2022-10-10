import 'package:plantcareapp/Uitls/images_path.dart';

class Plant {
  String title;
  String subTitle;
  String image;
  double percentage;
  List<String> checkStatus;
  String days;

  Plant(
      {required this.title,
      required this.subTitle,
      required this.image,
      required this.days,
      required this.percentage,
      required this.checkStatus});
}

List<Plant> plantList = [
  Plant(
      title: 'Cactus',
      days: 'Days 30',
      subTitle: 'nomen conservandum',
      image: CustomAssets.kListItems1,
      percentage: 0.5,
      checkStatus: [
        "I Feel very thirsty",
        'Please give a water as soon as possible'
      ]),
  Plant(
      title: 'Lidah Buayea',
      days: 'Days 20',
      subTitle: 'Hoc ipsum rarum  ',
      percentage: 0.9,
      image: CustomAssets.kListItems2,
      checkStatus: ["I Feel very Well", ' I dont need a Water Thank you !']),
  Plant(
      title: 'Bluestem',
      days: 'Days 27',
      subTitle: 'Est varie mitis Novembe',
      percentage: 0.10,
      image: CustomAssets.kListItems3,
      checkStatus: [
        "I Feel very thirsty",
        'Please give a water as soon as possible'
      ]),
  Plant(
      title: 'Caladium',
      days: 'Days 12',
      subTitle: 'Amet respicit ad prandium',
      image: CustomAssets.kListItems4,
      percentage: 0.4,
      checkStatus: ["I Feel very Well", ' I dont need a Water Thank you !']),
  Plant(
      title: 'Butterfly Weed',
      days: 'Days 2',
      subTitle: 'Quidam qui vultus bonum ',
      image: CustomAssets.kListItems5,
      percentage: 0.5,
      checkStatus: [
        "I Feel very thirsty",
        'Please give a water as soon as possible'
      ])
];
