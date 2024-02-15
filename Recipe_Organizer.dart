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
