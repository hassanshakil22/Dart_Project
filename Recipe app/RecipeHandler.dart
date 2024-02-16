// import 'dart:io';

// import 'Recipe_Organizer.dart';

// class RecipefileHandler {
//   String? _filepath;

//   RecipefileHandler(this._filepath);

// // recipe reading method
//   List<String> readRecipes() {
//     try {
//       var file = File(this
//           ._filepath!); // creating a file of the filepath and  asigning it to file variable
//       return file
//           .readAsLinesSync(); //reading this file  line by line and returning them in list format
//     } catch (e) {
//       return []; //if error occurs returning an empty file
//     }
//   }

// // recipe writing method
//   void writeRecipes(Map<String, List<String>> recipes) {
//     var lines = recipes.entries
//         .map((entry) => '${entry.key}:${entry.value.join(',')}')
//         .toList();
// //recipes.entries returns an iterable of MapEntry<String, List<String>>. It represents each recipe's name and its list of ingredients.

// // .map((entry) => '${entry.key}:${entry.value.join(',')}') applies a transformation to each MapEntry. It converts each entry into a formatted string where the key (recipe name) is followed by a colon, and the values (ingredients) are joined by commas.

// // .toList() converts the iterable of formatted strings into a list of strings.

// // So, lines is a list of strings, where each string represents a recipe in the format "recipeName:ingredient1,ingredient2,...". This list of strings will be written to the file
//     var file = File(this._filepath!);
//     file.writeAsStringSync(
//         lines.join('\n')); // writing the list by a newline using join func
//   }
// }

// void main() {
//   var recipeFilePath = "recipes.txt";
//   var recipeFileHandler =
//       RecipefileHandler(recipeFilePath); // making the object and giving it path
//   var recipes = loadrecipes(
//       recipeFileHandler); //loading recipes by getting a map of string and list of recipes/ingredients from load recipes and assigning it to recipes
//   recipeOrganizer(recipes, recipeFileHandler);
//   saveRecipes(recipes, recipeFileHandler);
// }

// Map<String, List<String>> loadrecipes(RecipefileHandler recipefileHandler) {
//   var lines = recipefileHandler
//       .readRecipes(); // list of recipes by [recipename:ingredients]
//   var recipes = <String, List<String>>{}; // creatintg an empty map
//   for (var line in lines) {
//     var parts = line.split(
//         ":"); //splitting in each line at ":" and putting it on different indexes on the list
//     var recipeName = parts[0]; // taking first index which is recipename
//     var ingredients = parts[1].split(
//         ","); // ingredients which were a string now into a list of string with each string bieng a single ingredient
//     recipes[recipeName] =
//         ingredients; // now that empty map is added with recipe name as key and ingredients as values
//   }
//   return recipes;
// }

// void saveRecipes(
//     Map<String, List<String>> recipes, RecipefileHandler recipefileHandler) {
//   recipefileHandler.writeRecipes(recipes);
// }
