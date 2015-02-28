
String[] foo;
int randline;
PFont font;

void setup() {
  size(800,400);
  frameRate(2);
  font = loadFont("AvenirNext-Medium-20.vlw");
  textFont(font, 20);
  foo = loadStrings("Hamlet.txt");
  println(foo[randline]);
  background(255);
}

void draw() {
  fill(255,255,255,60);
  randline = int (random(foo.length));
  rect(0,0,width,height);
  stroke(0);
  fill(0);
  text (foo[randline], random(width/4), random(height));
}


