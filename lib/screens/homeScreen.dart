import 'dart:convert';

import 'package:doctorapp/models/specialtiesModel.dart';
import 'package:doctorapp/models/topDoctorsModel.dart';
import 'package:doctorapp/screens/secondScreen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final urlImages = [
    'https://images.unsplash.com/photo-1659464113425-715dcce997d3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1659485261351-5829b87386fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1659504440540-8490ec472d2a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1659471202280-742f0e0934c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1033&q=80'
  ];

  Future<SpecialtiesModel> getSpecialties() async {
    final url = Uri.parse("http://192.168.1.76:9000/v1/api/specialties");
    final res = await http.get(url);
    if (res.statusCode == 200) {
      var d = jsonDecode(res.body);
      return SpecialtiesModel.fromJson(d);
    } else {
      return SpecialtiesModel.fromJson(json);
    }
  }

  Future<TopDoctorsModel> getTopDoctors() async {
    final url = Uri.parse("http://192.168.1.76:9000/v1/api/topdoctors");
    final res = await http.get(url);
    if (res.statusCode == 200) {
      var d = jsonDecode(res.body);
      return TopDoctorsModel.fromJson(d);
    } else {
      return TopDoctorsModel.fromJson(json);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                  color: Colors.indigo,
                  size: 35,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.indigo,
                  size: 35,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.apps,
                  color: Colors.indigo,
                  size: 35,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.event_available_outlined,
                  color: Colors.indigo,
                  size: 35,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.indigo,
                  size: 35,
                ),
                label: ""),
          ],
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const HomeScreen())));
                break;
              case 1:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const SecondScreen())));
                break;
              case 2:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const SecondScreen())));
                break;
              case 3:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const SecondScreen())));
                break;
              case 4:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const SecondScreen())));
                break;
            }
          }),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.indigo,
                            radius: 22,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.health_and_safety_outlined,
                                size: 35,
                                color: Colors.indigo,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.indigo,
                            size: 35,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: const TextSpan(children: [
                                TextSpan(
                                    text: "Home",
                                    style: TextStyle(
                                        color: Colors.indigo, fontSize: 20)),
                                WidgetSpan(child: Icon(Icons.expand_more)),
                              ])),
                              const Text("AB-120 Shalimar Bagh Delhi..")
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.notifications_none_outlined,
                            color: Colors.black,
                            size: 35,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  CarouselSlider.builder(
                    itemCount: urlImages.length,
                    options: CarouselOptions(
                        height: 200, autoPlay: true, viewportFraction: 1),
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = urlImages[index];
                      return buildImage(urlImage, index);
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Specialties",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "View All",
                          style: TextStyle(
                            color: Colors.indigo,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  FutureBuilder<SpecialtiesModel>(
                    future: getSpecialties(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return GridView.builder(
                              itemCount: snapshot.data!.docs!.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                const SecondScreen())));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(32),
                                    child: Card(
                                      elevation: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                child: Image.network(
                                                  snapshot
                                                      .data!.docs![index].image
                                                      .toString(),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Expanded(
                                                flex: 1,
                                                child: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                    snapshot
                                                        .data!.docs![index].name
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.indigo,
                                                        overflow: TextOverflow
                                                            .visible),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return const Center(
                              child: Text("Some Error Has Occurred"));
                        }
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return const Center(
                            child: Text("Some Error Has Occurred"));
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Top Doctors",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              child: Container(
                height: 155,
                width: double.infinity,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    FutureBuilder<TopDoctorsModel>(
                        future: getTopDoctors(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.docs!.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: ((context) =>
                                                        const SecondScreen())));
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Container(
                                              color: Colors.black12,
                                              padding: const EdgeInsets.all(4),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.network(
                                                  "${snapshot.data!.docs![index].doctorimg}",
                                                  height: 150,
                                                  width: 150,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                      ],
                                    );
                                  });
                            } else {
                              return const Center(
                                child: Text("Some Error has occurred"),
                              );
                            }
                          } else {
                            return const Center(
                              child: Text("Some Error has occurred"),
                            );
                          }
                        }),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: ((context) => const SecondScreen())));
                    //   },
                    //   child: ClipRRect(
                    //     borderRadius: BorderRadius.circular(8),
                    //     child: Container(
                    //       color: Colors.black12,
                    //       padding: const EdgeInsets.all(4),
                    //       child: ClipRRect(
                    //         borderRadius: BorderRadius.circular(8),
                    //         child: Image.network(
                    //           "https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=2000",
                    //           height: 150,
                    //           width: 150,
                    //           fit: BoxFit.cover,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(width: 16),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}

Widget buildImage(String urlImage, int index) => Container(
      width: double.infinity,
      padding: const EdgeInsets.all(1.0),
      // margin: EdgeInsets.symmetric(horizontal: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          urlImage,
          fit: BoxFit.fill,
        ),
      ),
    );
