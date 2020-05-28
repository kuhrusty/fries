import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:fries/model.dart';
import 'package:fries/data.dart';

///  Create it with a list of ints-minus-1 to be returned in order by calls to
///  `nextInt()`; if passed `[1, 2, 3]`, `nextInt()` will return `0, 1, 2`.
class _NotSoRandom implements Random {
  _NotSoRandom(this._ints);
  final List<int> _ints;
  @override int nextInt(int max) => _ints.removeAt(0) - 1;
  @override bool nextBool() => throw Exception("nope");
  @override double nextDouble() => throw Exception("nope");
}

void checkIngredients(Restaurant rest, bool bun, bool sauce, bool fries,
                      bool drink, bool veggies, bool cheese, bool bird,
                      bool cow, bool fish, bool meat, bool pie) {
  expect(rest.usesIngredient(Bun), bun);
  expect(rest.usesIngredient(Sauce), sauce);
  expect(rest.usesIngredient(Fries), fries);
  expect(rest.usesIngredient(Drink), drink);
  expect(rest.usesIngredient(Veggies), veggies);
  expect(rest.usesIngredient(Cheese), cheese);
  expect(rest.usesIngredient(Bird), bird);
  expect(rest.usesIngredient(Cow), cow);
  expect(rest.usesIngredient(Fish), fish);
  expect(rest.usesIngredient(Meat), meat);
  expect(rest.usesIngredient(Pie), pie);
}

void checkRecipe(Recipe got, String expectName,
    List<Ingredient> expectIngredients) {
  expect(got.name, expectName);
  expect(got.ingredients.length, expectIngredients.length);
  for (int ii = 0; ii < expectIngredients.length; ++ii) {
    expect(got.ingredients[ii], expectIngredients[ii]);
  }
}

void checkRoll(Restaurant rest, List<int> rolls, String expectName,
    List<Ingredient> expectIngredients) {
  checkRecipe(rest.roll(_NotSoRandom(rolls)), expectName, expectIngredients);
}

void main() {

  test('Ingredients calculated correctly', () {
    checkIngredients(Friedeys, true, false, true, true, false, true, true, true, true, true, true);
    checkIngredients(LongWok, true, true, false, false, true, true, true, true, true, false, true);
    checkIngredients(Ratherbees, true, true, true, true, true, true, true, true, true, false, true);
    checkIngredients(Blank, true, true, true, true, true, true, true, true, true, false, true);
  });

  test('Orders rolled correctly', () {
    checkRoll(Friedeys, [1, 1], "Small Fry", [ Fries ]);
    checkRoll(Friedeys, [5, 3], "Cheezabunga Conga", [ Bun, Fries, Drink, Cheese, Cow ]);
    checkRoll(Friedeys, [6, 1, 2, 1], "Small Fry, Extra Bun",
        [ Fries, Bun ]);
    checkRoll(Friedeys, [6, 2, 5, 2], "Chickabunga Conga, Extra Meat",
        [ Bun, Fries, Drink, Bird, Meat ]);
    checkRoll(Friedeys, [6, 3, 3, 5], "Neato Burrito, Extra Cheese",
        [ Cheese, Bird, Cow, Cheese ]);
    //  we saw this one game!
    checkRoll(Friedeys, [6, 4, 6, 6], "Lord of the Fries Plus Lord of the Fries",
        [ Fries, Fries, Fries, Fries, Fries, Fries ]);
    checkRoll(Friedeys, [6, 5, 6], "Old Man & the Sea With Drink",
        [ Drink, Drink, Drink, Fish, Drink ]);
    checkRoll(Friedeys, [6, 6, 6], "Patriarch, Extra Fries",
        [ Bun, Fries, Drink, Cheese, Fish, Pie, Fries ]);
    checkRoll(Friedeys, [6, 3, 6, 3, 6, 2, 6, 1, 6, 2, 6, 1, 6, 3, 5, 6],
        "Patriarch, Extra Cheese, Extra Bun, Extra Meat, Extra Bun, Extra Meat, Extra Cheese, Extra Cheese",
        [ Bun, Fries, Drink, Cheese, Fish, Pie, Cheese, Bun, Meat, Bun, Meat, Cheese, Cheese ]);

    checkRoll(LongWok, [2, 3], "Hot Chicken Spicy Noodle",
        [ Bun, Sauce, Veggies, Bird ]);

    checkRoll(Holiday, [6, 3, 6, 3, 6, 2, 6, 1, 6, 2, 6, 1, 6, 3, 6, 5, 6, 1],
        "Ebeneezer Scrooge Plus Donner on Blitzen, Extra Fish, Extra Bun With Drink, Extra Bun With Drink, Extra Fish, Extra Fish",
        [ Drink, Drink, Drink, Bird, Bun, Cow, Cow, Fish, Bun, Drink, Bun, Drink, Fish, Fish, ]);
  });

  test('Blank menu orders rolled correctly', () {
    checkRoll(Blank, [1, 3, 6, 2, 4], "Zone A 3", [ Fries, Cow ]);
    checkRoll(Blank, [2, 3], "Zone A 3", [ Fries, Cow ]);
    checkRoll(Blank, [2, 4, 1, 1, 1, 1, 1, 1, 1], "Zone A 4",
        [ Sauce, Veggies, Cheese, Drink, Bun, Fries ]);
    checkRoll(Blank, [6, 6, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 1], "Zone D 6",
        [ Sauce, Veggies, Cheese, Drink, Bun, Fries, Cow, Bird, Fish, Drink, Veggies, Bun, Pie, Sauce, Fish, Fries, Cow, Cheese, Bird]);
    checkRoll(Blank, [6, 5, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 6], "Zone D 5",
        [ Sauce, Veggies, Cheese, Drink, Bun, Fries, Cow, Bird, Fish, Drink, Veggies, Bun, Pie, Sauce, Fish, Fries, Cow, Cheese, Bird]);
    checkRoll(Blank, [6, 5], "Zone D 5",
        [ Sauce, Veggies, Cheese, Drink, Bun, Fries, Cow, Bird, Fish, Drink, Veggies, Bun, Pie, Sauce, Fish, Fries, Cow, Cheese, Bird]);
  });
}
