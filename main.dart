import 'dart:io';
import 'Recipe app/Recipe_Organizer.dart';
import 'passsword App/password.dart';

void main() {
  print("----------------Welcome To My dart Project----------------");

  print("here are the  things you can do on the app : \n ");
  print("Enter '1' --> Recipe Organizer ");
  print(
      "DESCRIPTION : Add , Edit and Delete Recipes for delicious cusines \n ");
  print("Enter '2' --> Password Generator");
  print("DESCRIPTION : Generate or Save a random password : \n ");
  // bool continuation = true;
  while (true) {
    stdout.write("Enter Your Choice :");
    String? userInput = stdin.readLineSync();
    if (userInput == "1") {
      recipeOrganizer();
      break;
    } else if (userInput == "2") {
      passwordApp();
      break;
    } else {
      print("\n\nInvalid Input! Please Enter Again.\n");
    }
  }
}
