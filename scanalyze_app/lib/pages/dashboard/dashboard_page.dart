import 'package:flutter/material.dart';
import 'package:scanalyze_app/models/document.dart';
import 'package:scanalyze_app/utils/constants/colors.dart';
import 'package:scanalyze_app/utils/constants/sizes.dart';
import 'package:scanalyze_app/utils/helpers/helper_functions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<CountStatusDocument> _documents = [
    CountStatusDocument(
      status: 'Pending',
      count: 5,
    ),
    CountStatusDocument(
      status: 'Approved',
      count: 10,
    ),
    CountStatusDocument(
      status: 'Rejected',
      count: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScanalyzeColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
              children: [

              ],
            ),
        ),
      ),
    );
  }

  Widget _buildChart() {
    return SfCartesianChart(
      primaryXAxis: const CategoryAxis(),
      title: const ChartTitle(text: 'Statistics of Documents'),
      legend: const Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries<dynamic, dynamic>>[
        ColumnSeries<CountStatusDocument, String>(
          dataSource: _documents,
          xValueMapper: (CountStatusDocument data, _) => data.status,
          yValueMapper: (CountStatusDocument data, _) => data.count,
          name: 'Count',
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        )
      ],
    );
  }
}