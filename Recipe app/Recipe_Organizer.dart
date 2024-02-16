import 'dart:io';

import 'Recipe_Organizer.dart';
import 'dart:io';

import 'RecipeHandler.dart';

recipeOrganizer(
    Map<String, List<String>> recipes, RecipefileHandler recipefileHandler) {
  print("Welcome to recipe organizer app ; ");
  print("---------------------------------------------");

  print("To add Enter --> 1 ");
  print("To Edit Enter --> 2 ");
  print("To Remove Enter --> 3 ");
  stdout.write("--> ");
  String? input = stdin.readLineSync();

//default recipes
  Map<String, List> recipes = {
    "BIRYANI": ['Rice', 'Chicken', "Onion", "Biryani masala"],
    "NIHARI": ["flour", "Onion", "Yogurt", "Nihari masala"],
    "QOURMA": ["Meat", "Yougurt", "Qourma masala"],
  };

  if (input == "1") {
    addRecipe(recipes);
  } else if (input == "2") {
    editRecipe(recipes);
  } else if (input == "3") {
    removeRecipe(recipes);
  } else {
    print("invalid input");
  }
}

// RECIPE ADDING MAIN FUNCTION
addRecipe(Map recipes) {
  print("\n Enter the name of the recipe : ");
  String? recipeName = stdin.readLineSync()!;
  recipeName = recipeName.toUpperCase();
  if (recipes.containsKey(recipeName)) {
    print("This recipe already exists.");
  } else {
    List ingredients = recipeAddition();
    recipes[recipeName] = ingredients;
    print("recipe added successfully");
    printRecipe(recipes);
  }
}

//RECIPE EDITING MAIN FUCNTIION
editRecipe(Map recipes) {
  printRecipe(recipes);
  print("Enter the name of the recipe do you want to edit");
  stdout.write("-->");
  String? input = stdin.readLineSync()!;
  input = input.toUpperCase();
  if (recipes.containsKey(input)) {
    print("Old Recipe ${recipes[input]}");
    print("write new recipe ");
    List newIngredients = recipeAddition();
    recipes[input] = newIngredients;
    print("upgraded Recipe list");
    printRecipe(recipes);
  } else {
    print("No such recipe ");
  }
}

// RECIPE REMOVING MAIN FUNCTION
removeRecipe(Map recipes) {
  printRecipe(recipes);
  print("Enter the name of the recipe which you want to remove: ");
  String? input = stdin.readLineSync()!;
  input = input.toUpperCase();
  if (recipes.containsKey(input)) {
    recipes.remove(input);
    print("updated Recipe List");
    printRecipe(recipes);
  } else {
    print("no such Recipe");
  }
}

List recipeAddition() {
  List ingredients = [];
  bool continuation = true;
  print("enter the recipe :  \n enter q to quit writing");
  while (continuation) {
    stdout.write("-->");
    String? ingredient = stdin.readLineSync();

    if (ingredient == "q") {
      continuation = false;
    } else {
      ingredients.add(ingredient);
    }
  }
  return ingredients;
}

printRecipe(recipes) {
  for (var entry in recipes.entries) {
    print("${entry.key} --> ${entry.value} ");
  }
}

// -----------------------------------------------------------------------------------------------------

class RecipefileHandler {
  String? _filepath;

  RecipefileHandler(this._filepath);

// recipe reading method
  List<String> readRecipes() {
    try {
      var file = File(this
          ._filepath!); // creating a file of the filepath and  asigning it to file variable
      return file
          .readAsLinesSync(); //reading this file  line by line and returning them in list format
    } catch (e) {
      return []; //if error occurs returning an empty file
    }
  }

// recipe writing method
  void writeRecipes(Map<String, List<String>> recipes) {
    var lines = recipes.entries
        .map((entry) => '${entry.key}:${entry.value.join(',')}')
        .toList();
//recipes.entries returns an iterable of MapEntry<String, List<String>>. It represents each recipe's name and its list of ingredients.

// .map((entry) => '${entry.key}:${entry.value.join(',')}') applies a transformation to each MapEntry. It converts each entry into a formatted string where the key (recipe name) is followed by a colon, and the values (ingredients) are joined by commas.

// .toList() converts the iterable of formatted strings into a list of strings.

// So, lines is a list of strings, where each string represents a recipe in the format "recipeName:ingredient1,ingredient2,...". This list of strings will be written to the file
    var file = File(this._filepath!);
    file.writeAsStringSync(
        lines.join('\n')); // writing the list by a newline using join func
  }
}

void main() {
  var recipeFilePath = "recipes.txt";
  var recipeFileHandler =
      RecipefileHandler(recipeFilePath); // making the object and giving it path
  var recipes = loadrecipes(
      recipeFileHandler); //loading recipes by getting a map of string and list of recipes/ingredients from load recipes and assigning it to recipes
  recipeOrganizer(recipes, recipeFileHandler);
  saveRecipes(recipes, recipeFileHandler);
}

Map<String, List<String>> loadrecipes(RecipefileHandler recipefileHandler) {
  var lines = recipefileHandler
      .readRecipes(); // list of recipes by [recipename:ingredients]
  var recipes = <String, List<String>>{}; // creatintg an empty map
  for (var line in lines) {
    var parts = line.split(
        ":"); //splitting in each line at ":" and putting it on different indexes on the list
    var recipeName = parts[0]; // taking first index which is recipename
    var ingredients = parts[1].split(
        ","); // ingredients which were a string now into a list of string with each string bieng a single ingredient
    recipes[recipeName] =
        ingredients; // now that empty map is added with recipe name as key and ingredients as values
  }
  return recipes;
}

void saveRecipes(
    Map<String, List<String>> recipes, RecipefileHandler recipefileHandler) {
  recipefileHandler.writeRecipes(recipes);
}
