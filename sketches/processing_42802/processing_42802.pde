
PFont fontA;


void setup() {
  size(600, 600);
  smooth();
  colorMode(HSB, 100);
  fontA = loadFont("Klavika-Light-48.vlw");
  textFont(fontA, 48);
}

void draw() {
  background(100, 10);
  float s = map(second(), 0, 60, 0, 20);
  float s2 = map(second(), 0, 60, 0, 100);
  float m = map(minute(), 0, 60, 0, 100);
  println( hour() + ":" + minute() + ":" + second());
  fill(100, 0, 0);
  strokeWeight(3);
  text("P", 100, 240-s);
  line (130, 250-s, 170, 250);
  text("O", 180, 240);
  line (210, 250, 250, 250-s);
  text("S", 260, 240-s);
  line (290, 250-s, 330, 250);
  text("T", 340, 240);

  text("A", 100, 300+s);
  line (130, 310+s, 170, 310);
  text("N", 180, 300);
  line (210, 310, 250, 310+s);
  text("A", 260, 300+s); 
  line (290, 310+s, 330, 310);
  text("L", 340, 300);
  line (370, 310, 410, 310+s);
  text("O", 420, 300+s);
  line (450, 310+s, 490, 310);
  text("G", 500, 300);
  stroke(50+s2,60, 80);
  //  fill(100,100,0+s2);
}


