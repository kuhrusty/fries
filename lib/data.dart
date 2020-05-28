import 'model.dart';

//  Normally I would read all this stuff from file at runtime, like in Morbad
//  Scorepad or other apps I've done, but I don't know how to do that in
//  Flutter yet, so it's hard-coded.  I am shamed.

final Restaurant Friedeys = Restaurant("Friedey's", null, [
  Menu("1-2", "Side Orders", [
    Recipe("Small Fry", [ Fries, ]),
    Recipe("Small Drink", [ Drink, ]),
    Recipe("Cod Piece", [ Fish, ]),
    Recipe("Breakfast Muffin", [ Bun, Cheese, ]),
    Recipe("Teething Vegan", [ Bun, Drink, ]),
    Recipe("Lord of the Fries", [ Fries, Fries, Fries, ]),
  ]),
  Menu("3-4", "Main Dishes", [
    Recipe("Cowabunga", [ Bun, Cow, ]),
    Recipe("Chickabunga", [ Bun, Bird, ]),
    Recipe("Cheezabunga", [ Bun, Cheese, Cow, ]),
    Recipe("Chickacheezabunga", [ Bun, Cheese, Bird, ]),
    Recipe("Neato Burrito", [ Cheese, Bird, Cow, ]),
    Recipe("Old Man & the Sea", [ Drink, Drink, Drink, Fish, ]),
  ]),
  Menu("5", "Combo Meals", [
    Recipe("Cowabunga Conga", [ Bun, Fries, Drink, Cow, ]),
    Recipe("Chickabunga Conga", [ Bun, Fries, Drink, Bird, ]),
    Recipe("Cheezabunga Conga", [ Bun, Fries, Drink, Cheese, Cow, ]),
    Recipe("Feast of the Innocents", [ Fries, Fries, Drink, Fish, Fish, ]),
    Recipe("Meat Munch", [ Fries, Drink, Bird, Cow, Fish, ]),
    Recipe("Patriarch", [ Bun, Fries, Drink, Cheese, Fish, Pie, ]),
  ]),
  Menu("6", "Special", [
    SpecialRecipe(", Extra Bun", [ Bun, ], [ "Friedey's", ]),
    SpecialRecipe(", Extra Meat", [ Meat, ], [ "Friedey's", ]),
    SpecialRecipe(", Extra Cheese", [ Cheese, ], [ "Friedey's", ]),
    SpecialRecipe(" Plus ", [ ], [ "Side Orders", "Side Orders", ]),
    SpecialRecipe(" With Drink", [ Drink, ], [ "Main Dishes", ]),
    SpecialRecipe(", Extra Fries", [ Fries, ], [ "Combo Meals", ]),
  ], special: true),
]);

final Restaurant Holiday = Restaurant("Holiday Menu", null, [
  Menu("1-2", "Stuffers", [
    Recipe("David Copperfield", [ Cheese, ]),
    Recipe("Nicholas Nickelby", [ Fries, ]),
    Recipe("Little Match Girl", [ Bird, ]),
    Recipe("Oliver Twist", [ Bun, ]),
    Recipe("Wassail, Wassail", [ Drink, Drink, ]),
    Recipe("Carillon", [ Bun, Bun, Bun, Bun, ]),
  ]),
  Menu("3-4", "Mainstays", [
    Recipe("Donner on Blitzen", [ Bun, Cow, Cow, ]),
    Recipe("Soylent Night", [ Bun, Fries, Cheese, ]),
    Recipe("Friendly Beasts", [ Cow, Bird, Fish, ]),
    Recipe("Big Bowl o' Jelly", [ Drink, Cheese, Fish, ]),
    Recipe("Loaves and Fishes", [ Bun, Bun, Fish, Fish, ]),
    Recipe("Ebeneezer Scrooge", [ Drink, Drink, Drink, Bird, ]),
  ]),
  Menu("5", "Meals", [
    Recipe("Last Supper", [ Bun, Drink, ]),
    Recipe("Good King Wenceslaus", [ Fries, Drink, Cow, ]),
    Recipe("Adoration of the Baby Cheeses", [ Cheese, Cheese, Cheese, ]),
    Recipe("Fourth Day of Christmas", [ Bird, Bird, Bird, Bird, ]),
    Recipe("Missus Claus", [ Bun, Fries, Drink, Cheese, Fish, ]),
    Recipe("Papa Christmas", [ Bun, Fries, Drink, Cheese, Cow, Pie, ]),
  ]),
  Menu("6", "Special", [
    SpecialRecipe(", Extra Bun", [ Bun, ], [ "Holiday Menu", ]),
    SpecialRecipe(" With Drink", [ Drink, ], [ "Holiday Menu", ]),
    SpecialRecipe(", Extra Fish", [ Fish, ], [ "Holiday Menu", ]),
    SpecialRecipe(" Plus ", [ ], [ "Stuffers", "Stuffers", ]),
    SpecialRecipe(" Plus ", [ ], [ "Mainstays", "Mainstays", ]),
    Recipe("Pick Any Three Ingredients", [ ]),
  ], special: true),
]);

final Restaurant LongWok = Restaurant("The Long Wok",
    "When filling an order, you may steal one ingredient from the table in front of another player as long as you play at least two cards from your hand.", [
  Menu("1", "Appetizers", [
    Recipe("Spring Roll", [ Bun, Veggies, ]),
    Recipe("Autumn Roll", [ Bun, Cow, ]),
    Recipe("Hong Kong Holiday", [ Veggies, Bird, ]),
    Recipe("M-S-Gee!", [ Veggies, Bird, Pie, ]),
    Recipe("Gang of Four", [ Bird, Cow, Fish, Pie, ]),
    Recipe("One With Everything", [ Bun, Sauce, Veggies, Cheese, Bird, Cow, Fish, Pie, ]),
  ]),
  Menu("2-3", "Chicken", [
    Recipe("Hot Chicken Noodle", [ Bun, Sauce, Bird, ]),
    Recipe("Chicken Spicy Noodle", [ Bun, Veggies, Bird, ]),
    Recipe("Hot Chicken Spicy Noodle", [ Bun, Sauce, Veggies, Bird, ]),
    Recipe("Chicken With Beef", [ Veggies, Bird, Cow, ]),
    Recipe("Great Wall of Chicken", [ Sauce, Bird, Bird, Bird, ]),
    Recipe("Chicken and Vegetables", [ Veggies, Bird, ]),
  ]),
  Menu("4-5", "Beef", [
    Recipe("Hot Beefy Noodle", [ Bun, Sauce, Cow, ]),
    Recipe("Chicken Beefy Hot Noodle", [ Bun, Sauce, Bird, Cow, ]),
    Recipe("Hot Beefy Chicken Spicy Noodle", [ Bun, Sauce, Veggies, Bird, Cow ]),
    Recipe("Shogun", [ Cow, Cow, Pie, ]),
    Recipe("Cultural Revolution", [ Bun, Veggies, Cow, Fish, ]),
    Recipe("Mao Tse Tongue", [ Sauce, Veggies, Cow, ]),
  ]),
  Menu("6", "Children", [
    Recipe("Wax On", [ Bun, Cheese, Cow, ]),
    Recipe("Wax Off", [ Bun, Cow, ]),
    Recipe("Wok Lobster", [ Fish, ]),
    Recipe("Occidental Tourist", [ Bun, Cheese, Bird, ]),
    Recipe("Just Dessert", [ Pie, ]),
    Recipe("Ancient Art of War", [ Bird, Cow, ]),
  ]),
]);

final Restaurant Ghicciaronis = Restaurant("Ghicciaroni's",
    "A dish is always worth the same number of points, even if it is missing some ingredients.  Track the extra points using chips.", [
  Menu("1-2", "Antipasto", [
    Recipe("Friend of Mine", [ Bird, ]),
    Recipe("Friend of Ours", [ Fish, ]),
    Recipe("Platonic Solids", [ Veggies, Cheese, Pie, ]),
    Recipe("Amerigo Vespucci", [ Bun, Sauce, ]),
    Recipe("Cosi Fan Tutte", [ Bird, Pie, ]),
    Recipe("A Piece of the Resistance", [ Veggies, Veggies, Cow, ]),
  ]),
  Menu("3", "Pasta", [
    Recipe("Chicken al Friedey's", [ Sauce, Cheese, Bird, ]),
    Recipe("Cow-a-Bungini", [ Bun, Sauce, Cow, ]),
    Recipe("Carpe de Diem", [ Sauce, Veggies, Cow, ]),
    Recipe("Sheep wit da Fishes", [ Cheese, Cow, Fish, Fish, ]),
    Recipe("Merchant of Venison", [ Veggies, Veggies, Cow, Cow, ]),
    Recipe("Leonardo da Vinci", [ Sauce, Veggies, Cheese, Bird, Bird, ]),
  ]),
  Menu("4-5", "Pizza", [
    Recipe("Primo", [ Bun, Sauce, Cheese, ]),
    Recipe("Excelsior", [ Bun, Sauce, Cheese, Cow, ]),
    Recipe("Gladiator", [ Bun, Sauce, Bird, Cow, ]),
    Recipe("Myrmidon", [ Bun, Veggies, Cheese, Fish, ]),
    Recipe("I, Claudius", [ Bun, Veggies, Cheese, Bird, ]),
    Recipe("Godfather", [ Bun, Sauce, Veggies, Bird, Cow, Fish, ]),
  ]),
  Menu("6", "Children", [
    Recipe("Penne for your Tots", [ Bun, Veggies, ]),
    Recipe("Moolius Caesar", [ Bun, Cheese, Cow, ]),
    Recipe("Marc Anthony", [ Bun, Fish, ]),
    Recipe("Cleopatra", [ Bun, Cheese, Bird, ]),
    Recipe("Easy Bein' Greeni", [ Veggies, Cheese, ]),
    Recipe("Chocolate Moussolini", [ Sauce, Pie, ]),
  ]),
]);

final Restaurant Montezumas = Restaurant("Montezuma's Mexi-Deli",
    "Any kind of meat may be substituted for the correct meat in a dish, but for zero points.  Leave the substituted meat face down.", [
  Menu("1-2", "Subs & Snax", [
    Recipe("Don Quixote", [ Bun, ]),
    Recipe("Sancho Panza", [ Veggies, ]),
    Recipe("Mask of Zorro", [ Cheese, ]),
    Recipe("Salsa Kielbasa", [ Veggies, Cow, ]),
    Recipe("El Diablo", [ Bun, Sauce, Drink, ]),
    Recipe("Conquest of Paradise", [ Bird, Bird, Bird, ]),
  ]),
  Menu("3-4", "Lunches", [
    Recipe("Rotten Burro", [ Cheese, Cow, Fish, ]),
    Recipe("Neato Burrito", [ Cheese, Cow, Bird, ]),
    Recipe("Neato Fajito", [ Bun, Cheese, Cow, ]),
    Recipe("Gonzo Garbanzo", [ Veggies, Veggies, Fish, ]),
    Recipe("Neato Carnito", [ Bun, Sauce, Cheese, Fish, ]),
    Recipe("Juan Sanchez Ramirez Villa Lobos", [ Sauce, Sauce, Veggies, Veggies, Cheese, ]),
  ]),
  Menu("5", "Dinners", [
    Recipe("Chicken con Pollo", [ Sauce, Bird, Bird, ]),
    Recipe("Bossie Con Carne", [ Sauce, Cow, Cow, ]),
    Recipe("Sombrero Surprise", [ Veggies, Fish, Fish, ]),
    Recipe("Beef Which is Actually Beef", [ Bun, Veggies, Bird, Fish, ]),
    Recipe("Quetzalcoatl", [ Bun, Drink, Cow, Bird, Fish, ]),
    Recipe("Aztec Sacrifice", [ Bun, Sauce, Drink, Veggies, Cheese, Bird, ]),
  ]),
  Menu("6", "Drinks", [
    Recipe("Rio Grind", [ Drink, Veggies, ]),
    Recipe("Banker's Holiday", [ Sauce, Drink, ]),
    Recipe("Forget the Alamo", [ Drink, Fish, ]),
    Recipe("Tequila Mockingbird", [ Sauce, Drink, Bird, ]),
    Recipe("Ponce de Leon", [ Sauce, Drink, Veggies, Cheese, ]),
    Recipe("Secret Tijuana Deathmatch", [ Drink, Drink, Bird, Cow, ]),
  ]),
]);

final Restaurant LovesLaboursLunch = Restaurant("Love's Labours Lunch",
    "Each time an order goes around the table without being filled, it becomes worth five extra points.  Track the extra points with chips.", [
  Menu("1-2", "Starters", [
    Recipe("Spanish Inquisition", [ Fries, ]),
    Recipe("Black Death", [ Cheese, Fish, ]),
    Recipe("Trafalgar Squares", [ Veggies, Cheese, ]),
    Recipe("One S'More Into the Breach", [ Cow, Pie, ]),
    Recipe("Healthy Breakfast", [ Fries, Cheese, Cow, ]),
    Recipe("Bunday Floody Bunday", [ Bun, Bun, Drink, Drink, ]),
  ]),
  Menu("3-4", "Soups", [
    Recipe("Just Barley Soup", [ Veggies, ]),
    Recipe("An Unbearable Likeness of Beans", [ Veggies, Bird, ]),
    Recipe("Gray Stuff in a Pot", [ Veggies, Cow, ]),
    Recipe("Brown Stuff in a Pot", [ Veggies, Cheese, Fish, ]),
    Recipe("Crown Gruel", [ Drink, Cheese, Cow, ]),
    Recipe("Bovine Spongiform Yum, Yum, Yum!", [ Bun, Bun, Drink, Cow, ]),
  ]),
  Menu("5", "Sandwiches", [
    Recipe("High Road", [ Bun, Cow, ]),
    Recipe("Low Road", [ Bun, Fish, ]),
    Recipe("Guy Fawkes", [ Bun, Cheese, Bird, ]),
    Recipe("Rosencrantz & Guildenstern", [ Bun, Fries, Fries, ]),
    Recipe("Two Gentlemen of Verona", [ Bun, Bird, Bird, ]),
    Recipe("Star Cross'd Lovers", [ Bun, Cheese, Cow, Fish, ]),
  ]),
  Menu("6", "Dinners", [
    Recipe("Mutton Jeff", [ Fries, Drink, Veggies, Cow, ]),
    Recipe("Frying Dutchman", [ Fries, Drink, Fish, Fish, Pie, ]),
    Recipe("Winston Churchill", [ Bun, Fries, Drink, Cheese, Cow, Pie, ]),
    Recipe("White Man's Bird", [ Bun, Fries, Drink, Cheese, Bird, Pie, ]),
    Recipe("Madness of King George III", [ Bun, Drink, Drink, Drink, Drink, Drink, Drink, ]),
    Recipe("Magna Carta with a Side of Fries", [ Bun, Fries, Drink, Veggies, Cheese, Bird, Fish, Pie, ]),
  ]),
]);

final Restaurant Ratherbees = Restaurant("Ratherbee's",
    "The \"Donner Pass\" really is nothing.  If the order is a Donner Pass, the lead passes to your left.  You can't call a Donner Pass more than once per hand.", [
  Menu("1-2", "Appetizers", [
    Recipe("Mighty Cholesterol Onion", [ Veggies, ]),
    Recipe("Clam Before the Storm", [ Fish, ]),
    Recipe("Donner Pass", [ ]),
    Recipe("Dubious Milkshake", [ Drink, Cheese, ]),
    Recipe("Paul Bunion", [ Fries, Veggies, Cheese, ]),
    Recipe("Take this Cob and Love It", [ Veggies, Bird, ]),
  ]),
  Menu("3-4", "Burgers", [
    Recipe("Amazing Meatless Burger", [ Bun, ]),
    Recipe("Bum Steer", [ Bun, Bird, ]),
    Recipe("Fur Piece", [ Bun, Cow, Pie, ]),
    Recipe("Patrick Swayze", [ Bun, Bun, ]),
    Recipe("Fishabunga", [ Bun, Cheese, Fish, ]),
    Recipe("Claim Jumper", [ Bun, Sauce, Fries, Veggies, Cheese, Bird, Cow, ]),
  ]),
  Menu("5", "Meals", [
    Recipe("Bovine Recombinant Yum, Yum, Yum!", [ Bun, Bun, Drink, Cheese, Cow, ]),
    Recipe("Salmon Rushdie", [ Sauce, Veggies, Cheese, Fish, ]),
    Recipe("Manifest Destiny", [ Sauce, Drink, Cheese, Bird, ]),
    Recipe("Intestinal Fortitude", [ Sauce, Bird, Cow, Fish, ]),
    Recipe("Pretty Good Corral", [ Veggies, Cow, Cow, Pie, ]),
    Recipe("We'll Fry Anything!", [ Bun, Fries, Veggies, Cheese, Pie, ]),
  ]),
  Menu("6", "Drinks", [
    Recipe("Covered Wagon", [ Drink, ]),
    Recipe("Blindfolded Pioneer", [ Drink, Pie, ]),
    Recipe("Artery Blocker", [ Sauce, Fries, Drink, Cheese, ]),
    Recipe("Heart Stopper", [ Sauce, Drink, Cow, ]),
    Recipe("Synaptic Deteriorator", [ Drink, Bird, Fish, ]),
    Recipe("Lying Dead on the Floor", [ Sauce, Drink, Bird, Cow, Fish, ]),
  ]),
]);

final Restaurant Blank = BlankRestaurant("Blank", [
  BlankMenu("1-2", "Zone A"),
  BlankMenu("3-4", "Zone B"),
  BlankMenu("5", "Zone C"),
  BlankMenu("6", "Zone D"),
]);

final List<Restaurant> AllRestaurants = [
  Friedeys,
  Holiday,
  Ghicciaronis,
  LongWok,
  LovesLaboursLunch,
  Montezumas,
  Ratherbees,
  //  This guy's commented out because, although it works, the fact that the
  //  call menu doesn't show icons (https://github.com/kuhrusty/fries/issues/2)
  //  makes it pretty much unusable.
  //Blank,
];
