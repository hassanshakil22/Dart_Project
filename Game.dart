import 'dart:math';

void main() {
  Map stds = {
    "std1": [21, 4],
    "std2": [2, 3]
  };
  List recipes = [
    "Biryanni : abx,ada,ada,da,dad",
    "Salad : dadad,adad,ad,ad,da",
    "Raita : dadad,adad,ad,ad,da"
  ];
  var parts = (recipes[1].split(":"));
  var rname = parts[0];
  var ing = parts[1];
  var ing1 = parts[1].split(",");
  print(ing);
  print(ing1);
}
