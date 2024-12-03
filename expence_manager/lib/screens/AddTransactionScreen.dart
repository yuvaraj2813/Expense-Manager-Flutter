import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transaction_provider.dart';

class AddTransactionScreen extends StatefulWidget {
  static const routeName = '/add-transaction';

  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _transactionType = 'income'; // Default type: income

  void _saveTransaction() {
    final amount = double.tryParse(_amountController.text);
    final description = _descriptionController.text;

    if (amount == null || amount <= 0 || description.isEmpty) {
      return; // Invalid input, return early
    }

    // Add the transaction to the provider
    Provider.of<TransactionProvider>(context, listen: false)
        .addTransaction(amount, description, _transactionType);

    Navigator.of(context).pop(); // Close the screen after saving the transaction
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Transaction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Income'),
                Radio<String>(
                  value: 'income',
                  groupValue: _transactionType,
                  onChanged: (value) {
                    setState(() {
                      _transactionType = value!;
                    });
                  },
                ),
                Text('Expense'),
                Radio<String>(
                  value: 'expense',
                  groupValue: _transactionType,
                  onChanged: (value) {
                    setState(() {
                      _transactionType = value!;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _saveTransaction,
              child: Text('Save Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
