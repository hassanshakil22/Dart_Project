// Recipe Organizer app
// password generator
// quiz game
//Note-taking  App

import 'dart:io';
import 'Recipe_Organizer.dart';

void main() {
  print("----------------Welcome To My dart Project----------------");

  print("here is the list of things you can do on the app : ");
  print(" '1' --> Recipe Organizer ");
  print("DESCRIPTION : Add , Edit and Delete Recipes for delicious cusines ");
  print(" '2' --> Password Manager");
  print("DESCRIPTION : Generate a random password : ");
  print(" '3' --> Play a Game");

  stdout.write("Enter Your Choice :");
  String? userInput = stdin.readLineSync();

  if (userInput == "1") {
    recipeOrganizer();
  } else if (userInput == "2") {
  } else if (userInput == "3") {
  } else {}
}
