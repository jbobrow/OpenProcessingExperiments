
String[] names = {"Amanda" , "Eileen", "Maria", "Katie", "Dori"};
String[] verbs = {"likes" , "loves", "hates", "can't live without", "has to have"};
String[] food = {"strawberries.", "broccoli.", "mashed potatoes.", "Pepsi.", "pizza."};

void setup(){
  size(1000, 500);
  background(0);
}

void draw(){
    if (mousePressed == true){
      background(0);
  
  textSize(25);
  text(names[0], 15, 30);
  text(names[1], 15, 80);
  text(names[2], 15, 130);
  text(names[3], 15, 180);
  text(names[4], 15, 230);
  
  textSize(25);
  int f = int(random(verbs.length));
  text(verbs[f], 130, 30);
  int g = int(random(verbs.length));
  text(verbs[g], 130, 80);
  int h = int(random(verbs.length));
  text(verbs[h], 130, 130);
  int i = int(random(verbs.length));
  text(verbs[i], 130, 180);
  int j = int(random(verbs.length));
  text(verbs[j], 130, 230);
 
  
  textSize(25);
  int l = int(random(verbs.length));
  text(food[l], 350, 30);
  int m = int(random(verbs.length));
  text(food[m], 350, 80);
  int n = int(random(verbs.length));
  text(food[n], 350, 130);
  int o = int(random(verbs.length));
  text(food[o], 350, 180);
  int p = int(random(verbs.length));
  text(food[p], 350, 230);
}
}

