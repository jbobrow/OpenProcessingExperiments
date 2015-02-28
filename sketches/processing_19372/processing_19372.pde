
PFont a;
PFont b;
PFont c;
PFont d;

String louise = "L";

void setup() {
  size(250,250);
  smooth();
  background(127);
  a = createFont("AGaramondPro-Regular-48.vlw",400);
  b = createFont("AmericanTypewriter-LightCond-48.vlw",200);
  c = createFont("HelveticaNeue-CondensedBlack-48.vlw",200);
  d = createFont("Memphis-MediumItalic-48.vlw",400);
}

void draw() {
  stroke(0);
  fill(20,120,120,10);
  textMode(CENTER);
  textFont(a,400);
  text("L",mouseY,mouseX);
  fill(200,10);
  textFont(b,200);
  text("5",127,127);
  fill(255,10);
  text("G", mouseX, mouseY);
  fill(0,30);
  text("3T7", random(height),random(width));

 
}
                
                
