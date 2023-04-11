// ignore_for_file: prefer_const_constructors

import 'package:covid_tracker/services/state_services.dart';
import 'package:covid_tracker/view/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  StateServices stateServices = StateServices();
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search with country name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
            Expanded(
              child: FutureBuilder(
                future: stateServices.fetchCountriesRecords(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    // ((((((((SHIMER EFFECT))))))))((((((((((((()))))))))))))
                    return ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade800,
                          highlightColor: Colors.grey.shade100,
                          child: Column(
                            children: [
                              ListTile(
                                title: Container(
                                  height: 15,
                                  width: 80,
                                  color: Colors.white,
                                ),
                                subtitle: Container(
                                  height: 15,
                                  width: 40,
                                  color: Colors.white,
                                ),
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );

                    // (((((((((((((((((((((((((LONEWOLF_CODEZILLA...SAQIB_AHMEd)))))))))))))))))))))))))
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        // creating variable for searching country from ssearchbar
                        String name = snapshot.data![index]['country'];
                        if (_controller.text.isEmpty) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                                name: name,
                                                image: snapshot.data![index]
                                                    ['countryInfo']['flag'],
                                                totalCases: snapshot
                                                    .data![index]['cases'],
                                                totalRecovered: snapshot
                                                    .data![index]['recovered'],
                                                totalDeaths: snapshot
                                                    .data![index]['deaths'],
                                                active: snapshot.data![index]
                                                    ['active'],
                                                critical: snapshot.data![index]
                                                    ['critical'],
                                                todayCases: snapshot
                                                    .data![index]['todayCases'],
                                                test: snapshot.data![index]
                                                    ['tests'],
                                              )));
                                },
                                child: ListTile(
                                  title: Text(snapshot.data![index]['country']),
                                  subtitle: Text(snapshot.data![index]['cases']
                                      .toString()),
                                  leading: Image(
                                      height: 50,
                                      width: 50,
                                      image: NetworkImage(snapshot.data![index]
                                          ['countryInfo']['flag'])),
                                ),
                              ),
                            ],
                          );
                        } else if (name
                            .toLowerCase()
                            .contains(_controller.text.toLowerCase())) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                            name: name,
                                            image: snapshot.data![index]
                                                ['countryInfo']['flag'],
                                            totalCases: snapshot.data![index]
                                                ['cases'],
                                            totalRecovered: snapshot
                                                .data![index]['recovered'],
                                            totalDeaths: snapshot.data![index]
                                                ['deaths'],
                                            active: snapshot.data![index]
                                                ['active'],
                                            critical: snapshot.data![index]
                                                ['critical'],
                                            todayCases: snapshot.data![index]
                                                ['todayCases'],
                                            test: snapshot.data![index]
                                                ['tests'],
                                          )));
                            },
                            child: ListTile(
                              title: Text(snapshot.data![index]['country']),
                              subtitle: Text(
                                  snapshot.data![index]['cases'].toString()),
                              leading: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage(snapshot.data![index]
                                      ['countryInfo']['flag'])),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
