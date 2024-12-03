
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/transaction_provider.dart';
import 'screens/home_screen.dart';
import './screens/AddTransactionScreen.dart';
import 'Main Screen.dart';
import './screens/stats_screen.dart';

void main() {
  runApp(ExpenseManagerApp());
}

class ExpenseManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expense Manager',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        initialRoute: MainScreen.routeName,
        routes: {
          MainScreen.routeName: (ctx) => MainScreen(),
          AddTransactionScreen.routeName: (ctx) => AddTransactionScreen(),
          StatsScreen.routeName: (ctx) => StatsScreen(),
        },
      ),
    );
  }
}
