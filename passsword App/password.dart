import 'dart:io';
import 'dart:math';

passwordApp() {
  print("Welcome to Password Generator app ; ");
  print("---------------------------------------------");
  print("***to GENERATE a Password Enter --> 1***");
  print("***to SAVE a Password Enter --> 2***");
  print("***to SEE all your previous passwords Enter --> 3*** ");
  print("***to REMOVE all Passwords Enter --> 4***");
  stdout.write("--> ");
  String? uInput = stdin.readLineSync();

  if (uInput == '1') {
    passwordGenerator();
  } else if (uInput == '2') {
    addPasswords();
  } else if (uInput == '3') {
    print(readPasswords());
  } else if (uInput == '4') {
    removeAllPasswords();
  } else {
    print("invalid input");
  }
}

passwordGenerator() {
  print("---write name of App :");
  stdout.write("-->");
  String? appName = stdin.readLineSync()!.toUpperCase();

  stdout.write("_____enter the Length of Characters of Password --> _____");
  String? input = stdin.readLineSync();
  int pwLength = int.parse(input!);
  var wordList = [];

  for (var i = 0; i < (pwLength); i++) {
    if (pwLength % 2 == 0) {
      var randomCapitalLetter = String.fromCharCode(
          Random().nextInt(26) + 65); // assci code of letter between 65-90
      wordList.add(randomCapitalLetter);
    } else {
      var randomSmallLetter = String.fromCharCode(
          Random().nextInt(26) + 97); // assci code of letter between 79-123
      wordList.add(randomSmallLetter);
    }
  }
  String password = "$appName\n${wordList.join()}";
  print(password);
  savePassword(password);
  // return password;
}

addPasswords() {
  print("---> write name of App :");
  stdout.write("-->");
  String? appName = stdin.readLineSync()!.toUpperCase();
  print("---> write Your password");
  stdout.write("--> ");
  String? pw = stdin.readLineSync();
  String password = "$appName\n$pw";
  savePassword(password);
}

// ------------------
var file = File('passsword App/password.txt');
savePassword(password) {
  var oldpw = readPasswords();
  file.writeAsStringSync("$oldpw\n$password");
}

removeAllPasswords() {
  file.writeAsStringSync("");
}

String readPasswords() {
  try {
    return file.readAsStringSync();
  } catch (e) {
    return "";
  }
}
