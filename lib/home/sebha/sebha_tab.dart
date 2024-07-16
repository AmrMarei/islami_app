import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';

class SebhaTab extends StatefulWidget {
  @override
  _SebhaTabState createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double rotationAngle = 0.0;
  List<String> phrases = [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: incrementCounter,
          child: Transform.rotate(
            angle: rotationAngle,
            child: Image.asset('assets/image/sebha_logo.png'),
          ),
        ),
        Text(
          'عدد التسبيحات',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(horizontal: 160.0, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.primaryLightColor,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Text(
            '$counter',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              color: AppColors.blackColor,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(horizontal: 110.0, vertical: 60),
          decoration: BoxDecoration(
            color: AppColors.primaryLightColor,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Text(
            getCurrentPhrase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              color: AppColors.blackColor,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: resetTasbeeh,
          child: Text('إعادة تعيين'),
          style: ElevatedButton.styleFrom(
            textStyle: Theme.of(context).textTheme.titleLarge,
            primary: AppColors.primaryLightColor,
            onPrimary: AppColors.blackColor,
          ),
        ),
      ],
    );
  }

  void incrementCounter() {
    setState(() {
      counter++;
      rotationAngle += 15.0;
    });
  }

  String getCurrentPhrase() {
    int phraseIndex = (counter ~/ 33) % phrases.length;
    return phrases[phraseIndex];
  }

  void resetTasbeeh() {
    setState(() {
      counter = 0;
      rotationAngle = 0.0;
    });
  }
}
