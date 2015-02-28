

String generateName() {
  String[] prefixes = {
    "Agreeable", "Exa", "Benders", "Optima", "Cyber", "Galactic", 
    "General", "Oz", "Franklin", "Titan", "Super", "Union", "Nexus", 
    "Boomer", "Hacksaw", "Wall", "Monsters", "Bombach", "Burger", 
    "Fuzzy", "e", "O\'Niner", "Tricycle", "The Nerd", "Halibut", 
    "Murphy", "Hamilton", "McCoy", "Harold"
  };
  String[] middles = {
    "Corp", " & Sons", "Mart", " World", " Banks", "-Mech", 
    "rax", "", "BigBucks", " Plumbing", " Brothers", "Greens", 
    " Town", " Place", "Donalds", " Consortium", " Firms", 
    " Burgers", " Commerce", " Aeronautics", " Technology", 
    " Innovations", " Labs", "vex", " Vendors", " Steel", " Oil", 
    " Publishing", " Manufacturing", " Designers", " Dairy", " Drilling"
  };
  String[] suffixes = {
    "  LLC.", "  Inc.", "  Corp.", "  FDN.", "  Ltd."
  };
  int pre = (int)random(0, prefixes.length);
  int mid = (int)random(0, middles.length);
  int suf = (int)random(0, suffixes.length);
  return prefixes[pre] + middles[mid] + suffixes[suf];
}

PFont font1;
boolean switchName = false;
String currentName = generateName();

void setup() {
  size(450, 150);
}

void draw() {
  background(10, 10, 40);
  font1 = createFont("AlBayan-Bold-24.vlw", 30);
  textFont(font1);
  fill(230, 230, 255);
  if (switchName) {
    currentName = generateName();
    switchName = false;
  }
  text(currentName, centerTextHorizontal(currentName, width), 85);
}

void keyPressed() {
  if (key == ' ') {
    switchName = true;
  }
}

int centerTextHorizontal(String words, int rectWidth) {
  return (int)(((float)(rectWidth - textWidth(words)))/2);
}


