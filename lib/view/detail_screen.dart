// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:covid_tracker/view/world_state.dart';

class DetailScreen extends StatefulWidget {
  String name, image;
  int totalCases,
      totalRecovered,
      totalDeaths,
      active,
      critical,
      todayCases,
      test;
  DetailScreen({
    super.key,
    required this.name,
    required this.image,
    required this.totalCases,
    required this.totalRecovered,
    required this.totalDeaths,
    required this.active,
    required this.critical,
    required this.todayCases,
    required this.test,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .08),
                      ReusableRow(
                          title: 'Total Cases',
                          value: widget.totalCases.toString()),
                      ReusableRow(
                          title: 'Total Recovered',
                          value: widget.totalRecovered.toString()),
                      ReusableRow(
                          title: 'Total Deaths',
                          value: widget.totalDeaths.toString()),
                      ReusableRow(
                          title: 'Active', value: widget.active.toString()),
                      ReusableRow(
                          title: 'Critical', value: widget.critical.toString()),
                      ReusableRow(
                          title: 'Today Cases',
                          value: widget.todayCases.toString()),
                      ReusableRow(title: 'Test', value: widget.test.toString()),
                    ],
                  ),
                ),
              ),
              // image
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(widget.image),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
