import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spod_app/model/sport_field.dart';
import 'package:spod_app/screen/auth/login_page.dart';
import 'package:spod_app/screen/search_screen.dart';
import 'package:spod_app/theme.dart';
import 'package:spod_app/utils/dummy_data.dart';
import 'package:spod_app/widget/category_card.dart';
import 'package:spod_app/widget/sport_field_card.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final users = FirebaseAuth.instance.currentUser!;

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  List<SportField> fieldList = recommendedSportField; //isi rekomended venue

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: StreamBuilder(
          stream: null,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return Column(
              children: [
                header(context),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 8.0),
                        child: Text(
                          "Let's Have Fun and \nBe Healty!",
                          style: greetingTextStyle,
                        ),
                      ),
                      CategoryListView(),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 16.0, right: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recommended Venue",
                              style: subTitleTextStyle,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SearchScreen(
                                      selectedDropdownItem: "All",
                                    );
                                  }));
                                },
                                child: const Text("Show All"))
                          ],
                        ),
                      ),
                      // RECOMMENDED FIELDS
                      Column(
                          children: fieldList
                              .map((fieldEntity) => SportFieldCard(
                                    field: fieldEntity,
                                  ))
                              .toList()),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }

  Widget header(context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: SafeArea(
        // SEARCH Icon
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image:
                          AssetImage("assets/images/user_profile_example.png"),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back,",
                      style: descTextStyle,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      users.displayName!,
                      style: subTitleTextStyle,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: primaryColor500,
                  borderRadius: BorderRadius.circular(borderRadiusSize)),
              child: IconButton(
                onPressed: () {
                  _signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }));
                },
                icon: const Icon(Icons.logout, color: colorWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
