<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Flutter pacakage to generate dates for calandra

## Features

This pacakage contains three functions
monthlyDatesWithWeekDays -- Generate a List of Maps of Days with dates.. example-- [{Monday: 2023-02-13 00:00:00.000}]
monthlyDatesWithWeekDays --Generate a List of Maps of Days with dates.. example-- [{Monday: 2023-02-13 00:00:00.000}]
generateWholeYearCalendra --generateWholeYearCalendra

![image](https://github.com/aman246149/raw_calendra/blob/main/image.png)
## Getting started

Install the pacakage and run flutter pub get
Watch The example section to learn more thanks.

```dart
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:master_animations/dateTimePacakage/dates.dart';
import 'package:master_animations/details/detail.dart';

class CustomAnimatedList extends StatefulWidget {
  const CustomAnimatedList({super.key});

  @override
  State<CustomAnimatedList> createState() => _CustomAnimatedListState();
}

class _CustomAnimatedListState extends State<CustomAnimatedList> {
  List<Map> wholeYear = [];
  @override
  void initState() {
    super.initState();
    wholeYear = Dates().generateWholeYearCalendra(year: 2023);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Icon(Icons.add),
      body: SafeArea(
        child: ListView.separated(
          padding: EdgeInsets.all(10),
          separatorBuilder: (context, index) => const SizedBox(
            height: 15,
          ),
          itemCount: wholeYear.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  print(Dates().generateWholeYearCalendra(year: 2023));
                },
                child: AnimatedCont(
                  monthName: Dates().months[index],
                  data: wholeYear[index][index],
                ));
          },
        ),
      ),
    );
  }
}

class AnimatedCont extends StatelessWidget {
  const AnimatedCont({
    super.key,
    required this.data,
    required this.monthName,
  });

  final List<Map> data;
  final String monthName;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Column(
          children: [
            Text(
              monthName,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w800,
                  fontSize: 20),
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 15,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    height: 50,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Text(
                          data[index].keys.join(),
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(DateFormat.yMMMd()
                            .format(DateTime.parse(data[index].values.join()))),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

```

## Additional information
jiffy and Intl pacakages are used to develop this pacakage
