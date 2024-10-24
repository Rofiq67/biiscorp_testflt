import 'package:flutter/material.dart';
import 'package:flutter_tes_biiscrop/presentation/controllers/user_controller.dart';
import 'package:flutter_tes_biiscrop/presentation/models/user_model.dart';
import 'package:flutter_tes_biiscrop/presentation/widgets/card_user.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ListUser extends StatefulWidget {
  const ListUser({super.key});

  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
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
              const SizedBox(
                height: 64,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Color(0xFF1C1C1C),
                          size: 25,
                        )),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                ],
              ),
              const SizedBox(
                  height: 20), // Jarak antara judul dan daftar pengguna
              Expanded(
                // Menggunakan Expanded di sini untuk menghindari kesalahan tinggi
                child: FutureBuilder<List<User>>(
                  future: futureUsers,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      List<User>? users = snapshot.data;

                      return ListView.builder(
                        itemCount: (users!.length / 2).ceil(),
                        itemBuilder: (context, index) {
                          int firstUserIndex = index * 2;
                          int secondUserIndex = firstUserIndex + 1;

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CardUser(user: users[firstUserIndex]),
                              ),
                              const SizedBox(width: 16), // Jarak antara kolom
                              if (secondUserIndex < users.length)
                                Expanded(
                                  child: CardUser(user: users[secondUserIndex]),
                                )
                              else
                                const SizedBox(), // Kosongkan jika tidak ada user kedua
                            ],
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text('No data available'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
