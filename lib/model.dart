import 'dart:math';

///  A single ingredient in a recipe, like Bun or Fries.
class Ingredient {
  final String id;
  final String name;
  final int points;
  final String assetName;

  Ingredient(this.id, this.name, this.points, this.assetName);
}

final Ingredient Bun     = Ingredient("bun",     "Bun",     1, "assets/bun.png");
final Ingredient Sauce   = Ingredient("sauce",   "Sauce",   1, "assets/sauce.png");
final Ingredient Fries   = Ingredient("fries",   "Fries",   2, "assets/fries.png");
final Ingredient Drink   = Ingredient("drink",   "Drink",   3, "assets/drink.png");
final Ingredient Veggies = Ingredient("veggies", "Veggies", 3, "assets/veggies.png");
final Ingredient Cheese  = Ingredient("cheese",  "Cheese",  4, "assets/cheese.png");
final Ingredient Bird    = Ingredient("bird",    "Bird",    5, "assets/bird.png");
final Ingredient Cow     = Ingredient("cow",     "Cow",     5, "assets/cow.png");
final Ingredient Fish    = Ingredient("fish",    "Fish",    5, "assets/fish.png");
///  This one is Bird or Cow or Fish.
final Ingredient Meat    = Ingredient("meat",    "Meat",    5, "assets/meat.png");
final Ingredient Pie     = Ingredient("pie",     "Pie",     6, "assets/pie.png");

final List<Ingredient> AllIngredients = [
  Bun,
  Sauce,
  Fries,
  Drink,
  Veggies,
  Cheese,
  Bird,
  Cow,
  Fish,
  Pie,
  Meat,
];

///  Zero or more ingredients and a name.
class Recipe {
  final String name;
  final ingredients = <Ingredient>[];

  ///  Returns one or more menus to roll again on & add to this order, or null.
  ///  In the base class, this just returns null.
  List<Menu> getRollAgain() => null;

  Recipe(this.name, List<Ingredient> ingredients) {
    for (int ii = 0; ii < ingredients.length; ++ii) {
      this.ingredients.add(ingredients[ii]);
    }
  }
  Recipe.clone(Recipe other): name = other.name {
    ingredients.addAll(other.ingredients);
  }
}

///  A recipe which has you roll again for additional ingredients.
class SpecialRecipe extends Recipe {
  final _rollAgainNames = <String>[];
  final _rollAgain = <Menu>[];

  @override
  List<Menu> getRollAgain() {
    if (_rollAgain.length != _rollAgainNames.length) {
      throw Exception("SpecialRecipe ${name} didn't have its roll-agains set up");
    }
    return _rollAgain;
  }

  SpecialRecipe(name, List<Ingredient> ingredients, List<String> rollAgain): super(name, ingredients) {
    _rollAgainNames.addAll(rollAgain);
  }
}

///  Incredibly, "Menu" wasn't already taken.  This is a list of recipes or
///  sub-menus.
class Menu {
  ///  "1-2", "3-4", "5", etc.
  final String _roll;
  final String name;
  ///  If true, this will be excluded from calling orders.
  final bool special;
  ///  Elements will be Recipe or Menu.
  final menus = [];

  ///  In the base class, theoretically this is always true, but for blank
  ///  menus, it could be false.
  bool hasNonNullMenuItems() {
    for (int ii = 0; ii < menus.length; ++ii) {
      if (menus[ii] != null) return true;
    }
    return false;
  }

  ///  Adds all ingredients used by all recipes on this menu to the given set.
  void addIngredients(Set<Ingredient> set) {
    for (var mi in menus) {
      if (mi is Recipe) {
        set.addAll(mi.ingredients);
      } else if (mi is Menu) {
        mi.addIngredients(set);
      }
    }
  }

  ///  Rolls a random Recipe from this Menu.
  Recipe roll(Random rand) {
    int idx = rand.nextInt(menus.length);
    if (menus[idx] is Recipe) {
      Recipe rolled = menus[idx] as Recipe;
      List<Menu> rollAgain = rolled.getRollAgain();
      if (rollAgain == null) return rolled;
      //  Still here, so this is more complicated.
      if (rollAgain.length == 1) {
        Recipe sub = rollAgain[0].roll(rand);
        Recipe rv = Recipe("${sub.name}${rolled.name}", sub.ingredients);
        rv.ingredients.addAll(rolled.ingredients);
        return rv;
      } else if (rollAgain.length == 2) {
        Recipe sub1 = rollAgain[0].roll(rand);
        Recipe sub2 = rollAgain[1].roll(rand);
        Recipe rv = Recipe("${sub1.name}${rolled.name}${sub2.name}", sub1.ingredients);
        rv.ingredients.addAll(rolled.ingredients);
        rv.ingredients.addAll(sub2.ingredients);
        return rv;
      } else {
        throw Exception("NOT_DONE");
      }
    } else {
      //  it's a sub-Menu.
      return menus[idx].roll(rand);
    }
  }

  Menu(this._roll, this.name, List recipes, {bool special = false}): this.special = special {
    menus.addAll(recipes);
  }
}

///  One of the menus from the "Blank Menu" sheet included in my deluxe set.
class BlankMenu extends Menu {
  ///  This is the table at the bottom of the menu for rolling new orders; null
  ///  is "Stop."
  static final rolls = [
    Sauce, Veggies, Cheese, Drink, Bun, Fries,
    null, Cow, Bird, Fish, Drink, null,
    Veggies, Bun, Pie, Sauce, null, Fish,
    Fries, Cow, Cheese, Bird,
  ];

  @override
  void addIngredients(Set<Ingredient> set) {
    //  could add them all, but theoretically BlankRestaurant is returning
    //  true for all ingredients.
  }

  @override
  Recipe roll(Random rand) {
    int idx = rand.nextInt(menus.length);
    if (menus[idx] == null) {
      var rv = Recipe("${name} ${idx + 1}", []);
      int pos = rand.nextInt(6);
      while ((pos < rolls.length) && (rolls[pos] != null)) {
        rv.ingredients.add(rolls[pos]);
        pos += rand.nextInt(6) + 1;
      }
      menus[idx] = rv;
    }
    return menus[idx] as Recipe;
  }

  BlankMenu(roll, name) : super(roll, name, [null, null, null, null, null, null]);
}

class Restaurant {
  final String name;
  ///  May be null.
  final String specialRule;
  ///  The set of ingredients used in all recipes.
  final Set<Ingredient> _ingredients = Set();
  final Menu menu;

  ///  Returns true if this restaurant uses this ingredient in any of its
  ///  recipes.
  bool usesIngredient(Ingredient ti) {
    return _ingredients.contains(ti);
  }

  Recipe roll(Random rand) {
    return menu.roll(rand);
  }

  Restaurant(this.name, this.specialRule, List<Menu> subMenus):
        menu = Menu("", name, List()) {
    for (Menu tm in subMenus) {
      //  We could parse the roll string properly... or we could do this:
      switch (tm._roll) {
        case "1": case "2": case "3": case "4": case "5": case "6":
          menu.menus.add(tm);
          break;
        case "1-2": case "2-3": case "3-4": case "4-5": case "5-6":
          menu.menus.add(tm);
          menu.menus.add(tm);
          break;
        default: throw Exception("confused by ${tm.name} \"${tm._roll}\"");
      }
    }
    //  Now run through, replacing menu names in sub-menus with references to
    //  the actual menus.  Probably could've done this inside the previous
    //  loop, as all the menus I've seen have menus-with-sub-menus on the last
    //  menu only.
    for (Menu tm in menu.menus) {
      for (var tv in tm.menus) {
        if (tv is SpecialRecipe) {
          for (String menuName in tv._rollAgainNames) {
            tv._rollAgain.add(findMenuByNameOrCroak(menuName));
          }
        }
      }
    }
    menu.addIngredients(_ingredients);
  }

  Menu findMenuByNameOrCroak(String name) {
    if (menu.name == name) return menu;
    for (Menu tm in menu.menus) {
      if (tm.name == name) return tm;
    }
    throw Exception("couldn't find menu \"${name}\"");
  }
}

class BlankRestaurant extends Restaurant {
  BlankRestaurant(name, List<Menu> subMenus) : super(name, null, subMenus);
  @override
  bool usesIngredient(Ingredient ti) {
   return ti != Meat;  //  there's no Meat card; we use everything else
  }
}
