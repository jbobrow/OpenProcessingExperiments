
PFont rep;

void setup(){
  background(0);
  size(700,500);
  rep = loadFont("Replica-Bold-35.vlw");
  
  fill(255);
  textFont(rep);
  String txt = "SORRY, OUR FILE WAS TOO BIG" + "\n" + 
  "DOWNLOAD @ LINK BELOW!";
  text(txt, 80, 220);
}

void draw() {
}

