import 'package:hive/hive.dart';
import '../expense_model.dart';

class ExpenseService {
  static const String _boxName = 'expenses';

  Future<Box<ExpenseModel>> _openBox() async {
    return await Hive.openBox<ExpenseModel>(_boxName);
  }

  Future<List<ExpenseModel>> getAllExpenses() async {
    final box = await _openBox();
    return box.values.toList();
  }

  Future<void> addExpense(ExpenseModel expense) async {
    final box = await _openBox();
    await box.put(expense.id, expense);
  }

  Future<void> deleteExpense(String id) async {
    final box = await _openBox();
    await box.delete(id);
  }
}
