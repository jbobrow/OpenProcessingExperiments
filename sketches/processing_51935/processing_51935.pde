
PFont latha48;
void setup() {
  size(400,400);
  smooth();
  latha48 = loadFont("Latha-48.vlw");
}

void draw() {
  background(255);
  float ease = .5;
  int a = 1;
  a += (mouseX - a) * ease;
  fill(0);
  textFont(latha48,25+a);
  textAlign(CENTER);
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(radians(millis()/3));
  text("Vertigo",0,0);
  textFont(latha48,20+a);
  fill(162,69,167);
  text("Vertigo",0,0);
  popMatrix();
}

