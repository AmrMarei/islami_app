import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home/hadeth/hadeth_detail.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/home/quran/sura_detail.dart';
import 'package:islami_app/my_theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routName,
      theme: MyThemeData.lightMode,
      routes: {
        HomeScreen.routName: (context) => HomeScreen(),
        SuraDetail.routName: (context) => SuraDetail(),
        HadethDetail.routName: (context) => HadethDetail(),
      },
      locale: Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
