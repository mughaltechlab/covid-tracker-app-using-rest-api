// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:covid_tracker/model/world_state_model.dart';
import 'package:covid_tracker/services/state_services.dart';
import 'package:covid_tracker/view/country_list.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WorldStateScreen extends StatefulWidget {
  const WorldStateScreen({super.key});

  @override
  State<WorldStateScreen> createState() => _WorldStateScreenState();
}

class _WorldStateScreenState extends State<WorldStateScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 3), vsync: this);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[
    Colors.blue.shade600,
    Colors.green.shade400,
    Colors.red.shade600,
  ];

  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .01),
            FutureBuilder(
              future: stateServices.fetchWorldStateRecords(),
              builder: (BuildContext context,
                  AsyncSnapshot<WorldStateModel> snapshot) {
                if (!snapshot.hasData) {
                  return Expanded(
                    flex: 1,
                    child: SpinKitFadingCircle(
                      color: Colors.white,
                      controller: _controller,
                      size: 50.0,
                    ),
                  );
                } else {
                  return Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(children: [
                        PieChart(
                          dataMap: {
                            'Total':
                                double.parse(snapshot.data!.cases.toString()),
                            'Recovered': double.parse(
                                snapshot.data!.recovered.toString()),
                            'Death':
                                double.parse(snapshot.data!.deaths.toString()),
                          },
                          chartValuesOptions: ChartValuesOptions(
                              showChartValuesInPercentage: true),
                          chartType: ChartType.ring,
                          colorList: colorList,
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          legendOptions: LegendOptions(
                            legendPosition: LegendPosition.left,
                            legendTextStyle: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0),
                          ),
                          animationDuration: Duration(milliseconds: 1500),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * .06),
                          child: Card(
                            child: Column(
                              children: [
                                ReusableRow(
                                    title: 'Total',
                                    value: snapshot.data!.cases.toString()),
                                ReusableRow(
                                    title: 'Recovered',
                                    value: snapshot.data!.recovered.toString()),
                                ReusableRow(
                                    title: 'Deaths',
                                    value: snapshot.data!.deaths.toString()),
                                ReusableRow(
                                    title: 'Critical',
                                    value: snapshot.data!.critical.toString()),
                                ReusableRow(
                                    title: 'Today cases',
                                    value:
                                        snapshot.data!.todayCases.toString()),
                                ReusableRow(
                                    title: 'Today Recovered',
                                    value: snapshot.data!.todayRecovered
                                        .toString()),
                                ReusableRow(
                                    title: 'Today Deaths',
                                    value:
                                        snapshot.data!.todayDeaths.toString()),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        CountriesListScreen())));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green.shade600,
                            ),
                            child: Center(child: Text('Country Tracker')),
                          ),
                        ),
                      ]),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    ));
  }
}
// -----------------------__________LONEWOLF__CODEZILLA--SAQIB__AHMED___________--------------------

// reusable row

class ReusableRow extends StatelessWidget {
  final String title, value;
  const ReusableRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(height: 5),
          Divider(),
        ],
      ),
    );
  }
}
