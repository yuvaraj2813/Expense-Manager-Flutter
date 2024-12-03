
import 'package:flutter/material.dart';

class Transaction {
  final double amount;
  final String description;
  final String type; // 'income' or 'expense'

  Transaction({
    required this.amount,
    required this.description,
    required this.type,
  });
}

class TransactionProvider with ChangeNotifier {
  List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  double get totalIncome {
    return _transactions
        .where((txn) => txn.type == 'income')
        .fold(0.0, (sum, txn) => sum + txn.amount);
  }

  double get totalExpense {
    return _transactions
        .where((txn) => txn.type == 'expense')
        .fold(0.0, (sum, txn) => sum + txn.amount);
  }

  double get balance {
    return totalIncome - totalExpense;
  }

  void addTransaction(double amount, String description, String type) {
    final newTransaction = Transaction(
      amount: amount,
      description: description,
      type: type,
    );
    _transactions.add(newTransaction);
    notifyListeners(); // Notify listeners to update UI
  }
}
