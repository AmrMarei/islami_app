import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/quran/item_sura_detail.dart';

class SuraDetail extends StatefulWidget {
  static const String routName = 'Sura_details';

  @override
  State<SuraDetail> createState() => _SuraDetailState();
}

class _SuraDetailState extends State<SuraDetail> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
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
              args.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primaryLightColor,
                ))
              : Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06,
                    vertical: MediaQuery.of(context).size.height * 0.06,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.witheColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: AppColors.primaryLightColor,
                        thickness: 2,
                      );
                    },
                    itemBuilder: (context, index) {
                      return ItemSuraDetail(
                          content: verses[index], index: index);
                    },
                    itemCount: verses.length,
                  ),
                ),
        )
      ],
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    for (int i = 0; i < lines.length; i++) {
      print(lines[i]);
    }
    verses = lines;
    setState(() {});
  }
}

class SuraDetailArgs {
  String name;

  int index;

  SuraDetailArgs({required this.name, required this.index});
}
