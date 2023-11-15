import 'package:covid_19_tracker/screens/world_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  String countryName,image;
  int totalCases, totalDeaths, totalRecovered, active, critical, todayRecovered, test;
  DetailScreen({
    super.key,
    required this.countryName,
    required this.image,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.countryName),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter ,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
                      ReusableRow(title: 'Total Cases', value: widget.totalCases.toString()),
                      ReusableRow(title: 'Total Deaths', value: widget.totalDeaths.toString()),
                      ReusableRow(title: 'Total Recovered', value: widget.totalRecovered.toString()),
                      ReusableRow(title: 'Active Cases', value: widget.active.toString()),
                      ReusableRow(title: 'Critical Cases', value: widget.critical.toString()),
                      ReusableRow(title: 'Today Recovered', value: widget.todayRecovered.toString()),
                      ReusableRow(title: 'Total Tests', value: widget.test.toString()),                
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}