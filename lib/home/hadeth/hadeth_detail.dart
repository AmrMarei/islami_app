import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/hadeth/hadeth_tab.dart';

class HadethDetail extends StatelessWidget {
  static const String routName = 'Hadeth_details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
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
              args.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.06,
              vertical: MediaQuery.of(context).size.height * 0.06,
            ),
            decoration: BoxDecoration(
              color: AppColors.witheColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(args.content[index]);
              },
              itemCount: args.content.length,
            ),
          ),
        )
      ],
    );
  }
}
