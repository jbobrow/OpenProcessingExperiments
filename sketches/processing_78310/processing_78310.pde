
PFont regFont;
PFont bigFont;
Corperation myCorp = new Corperation();

void setup() {
  size(640, 480);
}

void draw() {
  background(0, 0, 30);
  regFont = createFont("AppleBraille-18.vlw", 18);
  bigFont = createFont("AppleBraille-36.vlw", 36);
  drawText(bigFont, regFont);
}

void drawText(PFont font1, PFont font2) {
  int curY = 100;
  int inc = 30;
  textFont(font1);
  fill(230, 230, 255);
  text(myCorp.corpName, 20, 50);
  textFont(font2);
  text("Total Assets: $" + myCorp.totalAssets, 20, curY);
  curY += inc;
  fill(100, 100, 200);
  text("Total Liabilities: $" + myCorp.totalLiability, 20, curY);
  curY += inc;
  fill(230, 230, 255);
  text("Corperation Equity Value: $" + myCorp.corpEquity, 20, curY);
  curY += inc;
  fill(100, 100, 200);
  text("Assets to Liabilities: " + myCorp.capToDebt, 20, curY);
  curY += inc;
  fill(230, 230, 255);
  text("Total Number of Shares: " + myCorp.totalShareNum, 20, curY);
  curY += inc;
  fill(100, 100, 200);
  text("Total Number of Shares For Sale: " + myCorp.sharesForSale, 20, curY);
  curY += inc;
  fill(230, 230, 255);
  text("Average Market Share Price: $" + myCorp.averageSharePrice, 20, curY);
  text("---Press the spacebar to generate a new corperation---", 70, 450);
  
}

void keyPressed() {
 if (key == ' ') {
  myCorp.generateNew();
 } 
}

class Corperation {
  
  String corpName;
  int totalAssets;
  int totalLiability;
  int corpEquity;
  float capToDebt;
  int totalShareNum;
  int sharesForSale;
  float averageSharePrice;
  
  public Corperation() {
    generateNew();
  }

  void update() {
    corpEquity = totalAssets - totalLiability;
    capToDebt = (float)totalAssets / (float)totalLiability; // Recalculating the asset to liability ratio.
    totalShareNum = (int) (random(corpEquity/20, corpEquity*2));
    sharesForSale = (int) ((float)totalShareNum - ((float)totalShareNum * random(.01, .8)));
    averageSharePrice = (float)corpEquity / (float)totalShareNum;
    averageSharePrice = ((float)((int)(averageSharePrice * 100))) / 100;
  }
  
  void generateNew() {
    corpName = generateName();
    totalAssets = ((int) random(400, 2000)) * 100;
    capToDebt = random(.1, 40);
    totalLiability = (int)((float)totalAssets / capToDebt);
    update();
  }
  
  String generateName() {
    String[] prefixes = {"Agreeable", "Exa", "Benders", "Optima", "Cyber", "Galactic", "General", "Oz", "Franklin", "Titan", "Super", "Union", "Nexus",
      "Boomer", "Hacksaw", "Wall", "Monsters", "Bombach", "Burger", "Fuzzy", "E", "O\'Niner", "Tricycle", "The Nerd", "Halibut", "Murphy", "Hamilton", "McCoy"};
    String[] middles = {"Corp", " & Sons", "Mart", " World", " Banks", "-Mech", "rax", "", "BigBucks", " Plumbing", " Brothers", "Greens",
      " Town", " Place", "Donalds", " Consortium", " Firms", " Burgers", " Commerce", " Aeronautics", " Technology", " Innovations", " Labs",
      "vex", " Vendors", " Steel", " Oil", " Publishing"};
    String[] suffixes = {"  LLC.", "  Inc.", "  Corp.", "  FDN.", "  Ltd."};
    int pre = (int)random(0, prefixes.length);
    int mid = (int)random(0, middles.length);
    int suf = (int)random(0, suffixes.length);
    return prefixes[pre] + middles[mid] + suffixes[suf];
  }

}


