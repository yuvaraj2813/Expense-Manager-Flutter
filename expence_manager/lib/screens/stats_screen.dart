import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pie_chart/pie_chart.dart';
import '../providers/transaction_provider.dart';

class StatsScreen extends StatelessWidget {
  static const routeName = '/stats';

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);
    final double income = transactionProvider.totalIncome;
    final double expense = transactionProvider.totalExpense;

    // Data for the pie chart
    final Map<String, double> dataMap = {
      "Income": income,
      "Expense": expense,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.teal[50],
      body: Center(
        child: Card(
          margin: EdgeInsets.all(20),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Income vs Expenses',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 20),
                PieChart(
                  dataMap: dataMap,
                  animationDuration: Duration(milliseconds: 800),
                  chartRadius: MediaQuery.of(context).size.width / 2.2,
                  colorList: [Colors.green, Colors.red],
                  chartType: ChartType.disc,
                  legendOptions: LegendOptions(
                    showLegendsInRow: false,
                    legendPosition: LegendPosition.right,
                    showLegends: true,
                    legendTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  chartValuesOptions: ChartValuesOptions(
                    showChartValuesInPercentage: true,
                    showChartValuesOutside: false,
                    decimalPlaces: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
