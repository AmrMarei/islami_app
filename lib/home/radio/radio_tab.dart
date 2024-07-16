import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 2, child: Image.asset('assets/image/radio_logo.png')),
        Expanded(
          child: Column(
            children: [
              Text(
                'اذاعه القرأن الكريم',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/image/icon_prev.png'),
                  Image.asset('assets/image/icon_play.png'),
                  Image.asset('assets/image/icon_next.png'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
