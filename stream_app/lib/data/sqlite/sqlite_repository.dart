import 'dart:async'; // 1
import '../repository.dart';
import 'database_helper.dart';
import '../models/models.dart';

class SqliteRepository extends Repository {
  final dbHelper = DatabaseHelper.instance;
  // TODO: Add methods to use dbHelper here
  @override
  Future<List<Recipe>> findAllRecipes() {
    return dbHelper.findAllRecipes();
  }

  @override
  Stream<List<Recipe>> watchAllRecipes() {
    return dbHelper.watchAllRecipes();
  }

  Stream<List<Ingredient>> watchAllIngredients() {
    return dbHelper.watchAllIngredients();
  }

  Future<Recipe> findRecipeById(int id) {
    return dbHelper.findRecipeById(id);
  }

  Future<List<Ingredient>> findAllIngredients() {
    return dbHelper.findAllIngredients();
  }

  Future<List<Ingredient>> findRecipeIngredients(int id) {
    return dbHelper.findRecipeIngredients(id);
  }
// TODO: Add recipe insert here

  Future<int> insertRecipe(Recipe recipe) {
    return Future(() async {
      final id = await dbHelper.insertRecipe(recipe);
      recipe.id = id;
      if (recipe.ingredients != null) {
        recipe.ingredients!.forEach((ingredient) {
          ingredient.recipeId = id;
        });
        insertIngredients(recipe.ingredients!);
      }
      return id;
    });
  }

// TODO: Insert ingredients
  Future<List<int>> insertIngredients(List<Ingredient> ingredients) {
    return Future(() async {
      if (ingredients.length != 0) {
        final ingredientIds = <int>[];
        await Future.forEach(ingredients, (Ingredient ingredient) async {
          final futureId = await dbHelper.insertIngredient(ingredient);
          ingredient.id = futureId;
          ingredientIds.add(futureId);
        });
        return Future.value(ingredientIds);
      } else {
        return Future.value(<int>[]);
      }
    });
  }

  // TODO: Delete methods go here
  @override
  Future<void> deleteRecipe(Recipe recipe) {
    // 1
    dbHelper.deleteRecipe(recipe);
    if (recipe.id != null) {
      deleteRecipeIngredients(recipe.id!);
    }
    return Future.value();
  }

  @override
  Future<void> deleteIngredient(Ingredient ingredient) {
    dbHelper.deleteIngredient(ingredient); // 3
    return Future.value();
  }

  @override
  Future<void> deleteIngredients(List<Ingredient> ingredients) {
    // 4
    dbHelper.deleteIngredients(ingredients);
    return Future.value();
  }

  @override
  Future<void> deleteRecipeIngredients(int recipeId) {
    // 5
    dbHelper.deleteRecipeIngredients(recipeId);
    return Future.value();
  }

  // TODO: initialize and close methods go here
  @override
  Future init() async {
    await dbHelper.database;
    return Future.value();
  }

  void close() {
    dbHelper.close();
  }
}
