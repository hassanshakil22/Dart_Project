import 'dart:io';

void main() {
  recipeOrganizer();
}

recipeOrganizer() {
  print("Welcome to recipe organizer app ; ");
  print("---------------------------------------------");

  print("To add Enter --> 1 ");
  print("To Edit Enter --> 2 ");
  print("To Remove Enter --> 3 ");
  stdout.write("--> ");
  String? input = stdin.readLineSync();

  Map<String, List> recipes = {
    "BIRYANI": ['Rice', 'Chicken', "Onion", "Biryani masala"],
    "NIHARI": ["flour", "Onion", "Yogurt", "Nihari masala"],
    "QOURMA": ["Meat", "Yougurt", "Qourma masala"],
  };

  if (input == "1") {
    addRecipe(recipes);
  } else if (input == "2") {
  } else if (input == "3") {
  } else {
    print("invalid input");
  }
}

addRecipe(Map recipes) {
  print("\n Enter the name of the recipe : ");
  String? recipeName = stdin.readLineSync()!;
  recipeName = recipeName.toUpperCase();
  if (recipes.containsKey(recipeName)) {
    print("This recipe already exists.");
  } else {
    List ingredients = [];
    bool continuation = true;
    print("enter the recipe :  \n enter q to quit writing");
    while (continuation) {
      String? ingredient = stdin.readLineSync();

      if (ingredient == "q") {
        continuation = false;
      } else {
        ingredients.add(ingredient);
      }
    }
    recipes[recipeName] = ingredients;
    print("recipe added successfully");
    for (var entry in recipes.entries) {
      print("${entry.key} --> ${entry.value} ");
    }
  }
}

editRecipe(Map recipes) {}
