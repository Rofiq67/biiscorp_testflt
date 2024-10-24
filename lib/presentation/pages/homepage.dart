import 'package:flutter/material.dart';
import 'package:flutter_tes_biiscrop/presentation/pages/list_user.dart';
import 'package:flutter_tes_biiscrop/presentation/widgets/card_user.dart';
import 'package:flutter_tes_biiscrop/presentation/widgets/menu_list.dart';
import 'package:flutter_tes_biiscrop/presentation/widgets/search_widget.dart';
import 'package:flutter_tes_biiscrop/presentation/controllers/user_controller.dart';
import 'package:flutter_tes_biiscrop/presentation/models/user_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<List<User>>? futureUsers;
  final UserController userController = UserController();

  @override
  void initState() {
    super.initState();
    futureUsers = userController.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 38),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Home Page',
                        style: GoogleFonts.poppins(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff1C1C1C),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Choose your course',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff1C1C1C),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'right away',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 38,
                    height: 38,
                    child: Center(
                      child: Icon(
                        Icons.notifications,
                        color: Colors.blueAccent,
                        size: 38,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const SearchWidget(),
              const SizedBox(height: 32),
              const MenuList(),
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'User in app',
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff1C1C1C),
                        ),
                      ),
                      Text(
                        'Choose your friends',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const ListUser());
                    },
                    child: Text(
                      'More',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              FutureBuilder<List<User>>(
                future: futureUsers,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    List<User>? users = snapshot.data;
                    return SizedBox(
                      height: 280,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: users?.length ?? 0,
                        itemBuilder: (context, index) {
                          final user = users![index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: CardUser(user: user),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Text('No data available');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
