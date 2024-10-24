import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.grey[100],
        filled: true,
        hintText: 'Search for your grade, course, training type...',
        hintStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: 1,
          color: Colors.grey[500],
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Icon(
            Iconsax.search_normal,
            color: Colors.grey[500],
          ),
        ),
        prefixIconColor: const Color(0xff1c1c1c),
      ),
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        letterSpacing: 1,
        color: const Color(0xff1c1c1c),
      ),
    );
  }
}
