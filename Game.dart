import 'dart:io';
import 'dart:math';

void main() {
  gameApp();
}

gameApp() {
  print("Welcome to Password Generator app ; ");
  print("---------------------------------------------");
  print(
      "this app is a simple maths quiz game app Helping you Check your Maths Skills ");

  print("To Start the Game Enter --> 1");
  print("To Check your scoreCard Enter --> 2");
  // print("To Start the Game Enter --> 3");

  String? Uinput = stdin.readLineSync();

  if (Uinput == "1") {
    startGame();
  } else if (Uinput == "2") {
  } else {
    print("Invalid Input");
  }
}

startGame() {
  print(
      "Rules of The game : \n 1) You are to answer 10 questions (each Question compulsary) \n 2) Each Question is a MCQs Type question \n 3) In order To cpmplete You are REQUIRED to Answer every question ");
  int points = 0;

  points = points + factorialGame();

  print(points);
}

int factorialGame() {
  int factorial(int n) {
    if (n == 0 || n == 1) {
      return 1;
    } else {
      return n * factorial(n - 1);
    }
  }

  int randomNumber = Random().nextInt(10);
  print("What is the factorial of $randomNumber");
  int input1 = stringToInt();
  return input1 == factorial(randomNumber) ? 1 : 0;
}

stringToInt() {
  String? input = stdin.readLineSync();
  int number = int.parse(input!);
  return number;
}
