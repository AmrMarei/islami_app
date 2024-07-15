import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home/hadeth/hadeth_tab.dart';
import 'package:islami_app/home/quran/quran_tab.dart';
import 'package:islami_app/home/radio/radio_tab.dart';
import 'package:islami_app/home/sebha/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/image/main_background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor,
            ),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage('assets/image/icon_radio.png')),
                      label: AppLocalizations.of(context)!.radio),
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage('assets/image/icon_sebha.png')),
                      label: AppLocalizations.of(context)!.sebha),
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage('assets/image/icon_hadeth.png')),
                      label: AppLocalizations.of(context)!.hadeith),
                  BottomNavigationBarItem(
                      icon:
                          ImageIcon(AssetImage('assets/image/icon_quran.png')),
                      label: AppLocalizations.of(context)!.quran),
                ]),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    RadioTab(),
    SebhaTab(),
    HadethTab(),
    QuranTab(),
  ];
}
