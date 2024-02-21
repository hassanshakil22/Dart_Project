import 'dart:io';

recipeOrganizer() {
  print("********** Welcome to recipe organizer app **********");
  print("---------------------------------------------");

  print("--> To add Enter --> 1 ");
  print("--> To Edit Enter --> 2 ");
  print("--> To Remove Enter --> 3 ");
  print("--> To View All Recipes --> 4 ");

  stdout.write("--> ");
  String? input = stdin.readLineSync();

//default recipes
  Map<String, List> recipes = loadRecipes();

  if (input == "1") {
    addRecipe(recipes);
  } else if (input == "2") {
    editRecipe(recipes);
  } else if (input == "3") {
    removeRecipe(recipes);
  } else if (input == "4") {
    viewAllRecipes(recipes);
  } else {
    print("***********invalid input***********");
  }
  return recipes;
}

// RECIPE ADDING MAIN FUNCTION
addRecipe(Map recipes) {
  print("\n*********** Enter the name of the recipe ***********");
  String? recipeName = stdin.readLineSync()!;
  recipeName = recipeName.toUpperCase();
  if (recipes.containsKey(recipeName)) {
    print(
        "**********************This recipe already exists.**********************");
  } else {
    List<String> ingredients = recipeAddition();
    recipes[recipeName] = ingredients;
    writeRecipes(recipes);
    print("***********recipe added successfully***********");
    printRecipe(recipes);
  }
}

//RECIPE EDITING MAIN FUCNTIION
editRecipe(Map recipes) {
  printRecipe(recipes);
  print(
      "***********Enter the name of the recipe do you want to edit***********");
  stdout.write("-->");
  String? input = stdin.readLineSync()!;
  input = input.toUpperCase();
  if (recipes.containsKey(input)) {
    print("---m >Old Recipe ${recipes[input]}");
    print("*********** write new recipe ***********");
    List newIngredients = recipeAddition();
    recipes[input] = newIngredients;
    writeRecipes(recipes);
    print(
        "upgraded Recipe list ${String.fromCharCode(25)}"); //${String.fromCharCode(25)}down arrow key
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
    writeRecipes(recipes);
    print("updated Recipe List ${String.fromCharCode(25)}");
    printRecipe(recipes);
  } else {
    print("******no such Recipe******");
  }
}

viewAllRecipes(recipes) {
  printRecipe(recipes);
}

List<String> recipeAddition() {
  List<String> ingredients = [];
  bool continuation = true;
  print("******enter the recipe :*********  \n ---> enter q to quit writing");
  while (continuation) {
    stdout.write("-->");
    String? ingredient = stdin.readLineSync();

    if (ingredient == "q") {
      continuation = false;
    } else {
      ingredients.add(ingredient ?? "null");
    }
  }
  return ingredients;
}

printRecipe(recipes) {
  for (var entry in recipes.entries) {
    print("${entry.key} --> ${entry.value} ");
  }
}

// ---------------------------------------------------------------------------------------------------

//  handling  file operations
var file = File("Recipe app/Recipes.txt");

writeRecipes(Map recipes) {
  var lines =
      recipes.entries.map((e) => "${e.key}: ${e.value.join(",")}").toList();
  file.writeAsStringSync(lines.join('\n'));
}

readRecipes() {
  try {
    return file.readAsLinesSync();
  } catch (e) {
    return [];
  }
}

Map<String, List<String>> loadRecipes() {
  var lines =
      readRecipes(); //returning lines list in the form of list ["Recipename : ing1,ing2,ing3 ", Recipename : ing1,ing2,ing3 , .. ...]
  // print(lines);
  var recipes = <String, List<String>>{};
  for (var line in lines) {
    var parts = line.split(':'); //["Recipename ", "ing1,ing2,ing3",...]
    var recipename = parts[0];
    var ing = parts[1].split(","); //['ing1','ing2','ing3',..]
    recipes[recipename] = ing;
  }
  return (recipes); // returning map  of recipes
}
