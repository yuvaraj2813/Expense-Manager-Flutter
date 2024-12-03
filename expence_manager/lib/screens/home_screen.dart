
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transaction_provider.dart';
import './AddTransactionScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Manager'),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.teal[50],
      body: Column(
        children: [
          Card(
            color: Colors.white,
            elevation: 5,
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Income',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${transactionProvider.totalIncome.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.green, fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Expenses',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${transactionProvider.totalExpense.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Balance',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${transactionProvider.balance.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transactionProvider.transactions.length,
              itemBuilder: (ctx, index) {
                final txn = transactionProvider.transactions[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: ListTile(
                    tileColor: Colors.white,
                    title: Text(txn.description),
                    subtitle: Text(txn.type),
                    trailing: Text(
                      '\₹${txn.amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: txn.type == 'income' ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddTransactionScreen.routeName);
        },
      ),
    );
  }
}
