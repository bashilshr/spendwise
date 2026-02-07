import 'package:hive/hive.dart';
import '../category_model.dart';

class CategoryService {
  static const String _boxName = 'categories';

  Future<Box<CategoryModel>> _openBox() async {
    return await Hive.openBox<CategoryModel>(_boxName);
  }

  Future<List<CategoryModel>> getAllCategories() async {
    final box = await _openBox();
    return box.values.toList();
  }

  Future<void> addCategory(CategoryModel category) async {
    final box = await _openBox();
    await box.put(category.id, category);
  }

  Future<void> deleteCategory(String id) async {
    final box = await _openBox();
    await box.delete(id);
  }
}
