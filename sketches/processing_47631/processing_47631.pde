
class Country {

  int troopsPerCountry;
  ArrayList troopArray;
  PImage flag;

  String countryName;
  int budget;
  int originalAmounts;
  float w, h;
  float frame = 0;
  float nameX;


  Country(float x, String name, int _troopsPerCountry, int _originalAmounts) {

    flag  = loadImage(name+".png");
    troopsPerCountry = _troopsPerCountry;
    countryName = name;
    originalAmounts = _originalAmounts;
    budget = originalAmounts;

    troopArray = new ArrayList();

    // Building arraylist of troop objects for each country
    for (int i = 0; i < troopsPerCountry; i++) {
      if (i == 0) troopArray.add(new Troops(soldiers, x+width+i*100, height/1.32, 150, 75));     
      if (i == 1) troopArray.add(new Troops(tanks, x+width+i*100, height/1.32-5, 160, 80));
      if (i == 2) troopArray.add(new Troops(tanks, x+width+i*100, height/1.32-5, 160, 80)); 
      if (i == 3) troopArray.add(new Troops(tanks, x+width+i*100, height/1.32-5, 160, 80));
      if (i == 67) troopArray.add(new Troops(mario, x+width+i*100+300, height/1.38, 120, 100));

      else if (i > 3 ) troopArray.add(new Troops(tanks, x+width+i*100, height/1.32-5, 160, 80));
    }
  } 

  void CountryCreate() {

    Troops firstTroop = (Troops) troopArray.get(0);
    firstTroop.displayFlag(flag);
    firstTroop.planeFly();
    firstTroop.bannerFly();
    //   firstTroop.displayName(countryName, budget, still);

    Troops lastTroop = (Troops) troopArray.get(troopsPerCountry-1);   
    //  if (firstTroop.x  0 && lastTroop.x > width) {
    firstTroop.displayName(countryName, budget, nameX);     


    for (int i = troopArray.size()-1; i >= 0; i--) { 
      Troops troops = (Troops) troopArray.get(i);

      troops.display();
      troops.move();
    }
  }
}


