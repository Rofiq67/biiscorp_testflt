import 'package:flutter/material.dart';
import 'package:flutter_tes_biiscrop/presentation/widgets/menu_circle.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MenuCircle(
              beginClr: Color(0xFFFFE88C),
              endClr: Color(0xFFFFCC00),
              shadowClr: Color(0xFFFFCC00),
              icon: Icons.person_2_rounded,
              txtMenu: 'User',
            ),
            MenuCircle(
              beginClr: Color(0xFF7AD786),
              endClr: Color(0xFF41CB90),
              shadowClr: Color(0xFF41CB90),
              icon: Icons.play_circle_fill_rounded,
              txtMenu: 'Bountique Class',
            ),
            MenuCircle(
              beginClr: Color(0xff76C3E5),
              endClr: Color(0xFF41CB90),
              shadowClr: Color(0xff76C3E5),
              icon: Icons.document_scanner_sharp,
              txtMenu: 'Free Crouse',
            ),
          ],
        ),
        SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MenuCircle(
              beginClr: Color(0xFFFF7D82),
              endClr: Color(0xFFDD4F50),
              shadowClr: Color(0xFFFF7D82),
              icon: Icons.store,
              txtMenu: 'Store',
            ),
            MenuCircle(
              beginClr: Color(0xFFD378FF),
              endClr: Color(0xFF9D45C7),
              shadowClr: Color(0xFFD378FF),
              icon: Icons.live_tv_rounded,
              txtMenu: 'Live Course',
            ),
            MenuCircle(
              beginClr: Color(0xFFFF8758),
              endClr: Color(0xFFB35631),
              shadowClr: Color(0xFFFF8758),
              icon: Icons.leaderboard_rounded,
              txtMenu: 'Free Crouse',
            ),
          ],
        ),
      ],
    );
  }
}
