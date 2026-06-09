import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spend_wise/models/expense.dart';
import 'package:intl/intl.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {

    final Map<ExpenseCategory, String> categoryImages = {
      ExpenseCategory.food: 'Assets/i5-food.png',
      ExpenseCategory.transport: 'Assets/i4-t.png',
      ExpenseCategory.fun: 'Assets/i7-fun.png',
    };
        return Card(

      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(
            categoryImages[expense.category] ??
                'assets/food.png',
          ),
        ),
        title: Text(
          expense.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '${expense.category.label} • ${DateFormat.yMMMd().format(expense.date)}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          '\₹${expense.amount.toStringAsFixed(2)}',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}