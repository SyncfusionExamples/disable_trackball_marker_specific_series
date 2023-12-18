import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  late TrackballBehavior _trackballBehavior;
  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
        enable: true,
        markerSettings: TrackballMarkerSettings(
          markerVisibility: TrackballVisibilityMode.auto,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: Center(
          child: Container(
            height: 500,
            width: 340,
            child: SfCartesianChart(
                backgroundColor: Colors.white,
                primaryXAxis: CategoryAxis(),
                trackballBehavior: _trackballBehavior,
                series: <LineSeries<_SalesData, String>>[
                  LineSeries<_SalesData, String>(
                      dataSource: <_SalesData>[
                        _SalesData('Jan', 35),
                        _SalesData('Feb', 28),
                        _SalesData('Mar', 34),
                        _SalesData('Apr', 32),
                        _SalesData('May', 40)
                      ],
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                      markerSettings:
                          MarkerSettings(isVisible: true, width: 0, height: 0)),
                  LineSeries<_SalesData, String>(
                      dataSource: <_SalesData>[
                        _SalesData('Jan', 15),
                        _SalesData('Feb', 8),
                        _SalesData('Mar', 14),
                        _SalesData('Apr', 12),
                        _SalesData('May', 20)
                      ],
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                      markerSettings: MarkerSettings(
                          isVisible:
                              false // Setting false to this series to not to render marker for this series.
                          ))
                ]),
          ),
        ));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
